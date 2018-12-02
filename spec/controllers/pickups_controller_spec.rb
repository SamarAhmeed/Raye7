require 'rails_helper'

RSpec.describe PickupsController, type: :controller do
    it { should use_before_action(:authenticate_user!) }
    it { should_not use_before_action(:prevent_ssl) }

    it { should route(:get, '/pickups').to(action: :index) }
    it { should route(:get, '/pickups/1').to(action: :show, id: 1) }
    it { should route(:get, '/pickups/new').to(action: :new) }

end
