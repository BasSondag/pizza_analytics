module Base
  class People < Grape::API
    format :json
    resource :people do
      desc "Return all people"
      get "/", root: :people do
        people = DB[:users]
        people.all
      end
    end
  end
end
