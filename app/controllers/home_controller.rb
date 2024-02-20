class HomeController < ApplicationController
    before_action :validate_user, :intialize_instance
    def home
    end
   
    # Initializing the eventA
    def create_event_a
        flash[:notice] = 'EventA has been initilaized'
        redirect_to root_path
    rescue StandardError => e
        flash[:notice] = e.message
        redirect_to root_path
    end

    # Initializing the EventB and Sending Email
    def create_event_b
        @event.for_email(current_user.email)
        flash[:notice] = "EventB has been initialized and sent email for #{current_user.email}."
        redirect_to root_path
    rescue StandardError => e
        flash[:notice] = e.message
        redirect_to root_path
    end
    
    def intialize_instance
        @event = Iterable::Events.new
    rescue StandardError => e
        flash[:notice] = e.message
        redirect_to root_path
    end
end
