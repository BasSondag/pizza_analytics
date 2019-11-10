module Base
  class People < Grape::API
    format :json
    resource :people do
      desc "Return all people"
      get "/", root: :people do
        people = DB[:users]
        people.all
      end
      desc "Return a person"
      params do
        requires :id, type: String, desc: "Name of the person"
      end
      get ":id", root: "person" do
        DB[:users].where(name: params[:id]).first!
      end
    end
  end
end
