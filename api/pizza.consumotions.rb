module Base
  class Pizza_consumptions < Grape::API
    format :json
    resource :pizza_consumptions do
      desc "return all pizza_consumptions"
      get "/", root: :pizza_consumptions do
        pizza_consumptions = DB[:pizzas]
        pizza_consumptions.join(:users, id: :person_id).all
      end
      desc "Return a pizza per topping"
      params do
        requires :id, type: String, desc: "Type of the topping"
      end
      get ":id", root: "pizza_consumptions_per_topping" do
        DB[:pizzas].where(type: params[:id]).join(:users, id: :person_id).all
      end
    end
  end
end
