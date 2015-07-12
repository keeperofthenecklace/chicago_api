module V1
  class EventsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    # GET /v1/events
    # GET all events
    def index
      @events = Event.includes(:user).order(created_at: :asc)
      render json: @events, each_serializer: EventSerializer, meta: { total: Event.count }
    end

    def show
      @event = Event.find(params[:id])
      render json: @event, serializer: EventSerializer
    end

    # POST /v1/events
    def create
      @event = Event.new(event_params)

      if @event.save
        render json: @event, serializer: EventSerializer
      else
        render json: { error: "Error creating the event." }, status: :unprocessable_entity
      end
    end

    private
      # Mass-assignment using rails strong params.
      def event_params
        params.require(:event).permit(:title, :event_begins_at, :event_ends_at).merge(user: current_user)
      end
  end
end
