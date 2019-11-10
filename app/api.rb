module Base
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Base::People
    mount ::Base::Pizza_consumptions
    mount ::Base::Streaks
    mount ::Base::Best_day_of_month

    add_swagger_documentation api_version: 'v1'
  end
end
