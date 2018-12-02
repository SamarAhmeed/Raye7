require 'rails_helper'

RSpec.describe TripsController, type: :controller do
    it { should use_before_action(:authenticate_user!) }
    it { should_not use_before_action(:prevent_ssl) }

    it { should route(:get, '/trips').to(action: :index) }
    it { should route(:get, '/trips/1').to(action: :show, id: 1) }
    it { should route(:get, '/trips/new').to(action: :new) }
end
