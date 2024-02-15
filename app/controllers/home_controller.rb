class HomeController < ApplicationController
    before_action :validate_user
    def home
    end

    def create_event_a
        event = Iterable::Events.new
        flash[:notice] = 'EventA has been initilaized'
        redirect_to root_path
    rescue StandardError => e
        flash[:notice] = e.message
        redirect_to root_path
    end

    def create_event_b
        event = Iterable::Events.new
        event.for_email(current_user.email)
        flash[:notice] = "EventB has been initialized and sent email for #{current_user.email}."
        redirect_to root_path
    rescue StandardError => e
        flash[:notice] = e.message
        redirect_to root_path
    end
end
