Rails.application.routes.draw do
  namespeace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(versio: 1, default: true) do
      # route
    end
end
