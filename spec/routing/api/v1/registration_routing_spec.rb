RSpec.describe DeviseTokenAuth::RegistrationsController, type: :controller do
  it { should route(:post, 'api/auth').to(action: :create, format: :json) }
  it { should route(:put, 'api/auth').to(action: :update, format: :json) }
end