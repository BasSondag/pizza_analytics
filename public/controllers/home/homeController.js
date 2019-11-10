myApp.controller('homeController', function($scope, $location, userFactory){

  // userFactory.getUsers(function(data) {
  //   console.log(data, "in homeController")
  //   $scope.people = data
  // })

	$scope.findUser = function(person) {
    console.log("in find user", person)
		userFactory.findUser(person, function(data) {
      console.log($scope.people, "absbs")
		})
	}
  // console.log($scope.people, "absbs")
	// // userFactory.viewUser(id, function(data) {
	// // 	$scope.user = data;
	// // })

})
