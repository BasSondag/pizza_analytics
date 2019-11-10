myApp.factory('userFactory', function($http, $location){
	var factory = {};
	var thisUser = null;
	var users = []

	factory.findUser = function(person,callback) {
		$http.get('/api/people/' + person.name).success(function(data) {
      console.log(data,'in fac');
      callback(data);
		})

	}

	return factory

})
