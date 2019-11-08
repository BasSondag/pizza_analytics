module Base
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Base::People

    add_swagger_documentation api_version: 'v1'
  end
end
