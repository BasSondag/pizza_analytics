myApp.controller('homeController', function($scope, $location, userFactory){

	$scope.findUser = function(person) {
    $scope.messages = [];
    $scope.personInfo = null;
		userFactory.findUser(person, function(data) {
      if (data.error) {
        $scope.messages = [data.error];
      } else {
        $scope.personInfo = data;
      }
		});
	}
});
