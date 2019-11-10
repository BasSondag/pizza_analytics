myApp.factory('pizzaConsumptionFactory', function($http, $location){
	var factory = {};

	factory.findPizzaPerTopping = function(topping,callback) {
		$http.get('/api/pizza_consumptions/' + topping.type)
      .success(function(data) {
        if(!data){
          data = {'error': "topping does not exist"}
        }
        callback(data);
      });
	}

	return factory;

});
