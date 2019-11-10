myApp.controller('homeController', function($scope, $location, userFactory, pizzaConsumptionFactory){
  function clearVaribles() {
    $scope.messages = [];
    $scope.personInfo = null;
    $scope.toppings = ['sausage', 'pepperoni',"pineapple"];
    $scope.pizzasPerTopping = null;
  };

  clearVaribles();

	$scope.findUser = function(person) {
    clearVaribles()
		userFactory.findUser(person, function(data) {
      if (data.error) {
        $scope.messages = [data.error];
      } else {
        $scope.personInfo = data;
        $scope.person = "";
      }
		});
	}

  $scope.findPizzaPerTopping = function(topping) {
    clearVaribles()
    pizzaConsumptionFactory.findPizzaPerTopping(topping, function(data) {
      if (data.error) {
        $scope.messages = [data.error];
      } else {
        $scope.PizzasPerTopping = data;
        $scope.pizzasPerTopping = data;
      }
    });
  }

});
