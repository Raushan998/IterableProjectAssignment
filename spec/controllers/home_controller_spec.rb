require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#home' do
    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe '#create_event_a' do
    it 'initializes EventA and sets flash notice' do
      expect(Iterable::Events).to receive(:new).and_return(instance_double(Iterable::Events))
      
      post :create_event_a

      expect(flash[:notice]).to eq('EventA has been initilaized')
      expect(response).to redirect_to(root_path)
    end

    it 'handles errors and sets flash notice' do
      allow(Iterable::Events).to receive(:new).and_raise(StandardError, 'Error message')
      
      post :create_event_a

      expect(flash[:notice]).to eq('Error message')
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#create_event_b' do
    it 'initializes EventB, sends email, and sets flash notice' do
      event_double = instance_double(Iterable::Events)
      allow(Iterable::Events).to receive(:new).and_return(event_double)
      allow(event_double).to receive(:for_email).with('user@gmail.com')
      
      post :create_event_b

      expect(flash[:notice]).to eq('EventB has been initialized and sent email for it.')
      expect(response).to redirect_to(root_path)
    end

    it 'handles errors and sets flash notice' do
      allow(Iterable::Events).to receive(:new).and_raise(StandardError, 'Error message')
      
      post :create_event_b

      expect(flash[:notice]).to eq('Error message')
      expect(response).to redirect_to(root_path)
    end
  end
end
