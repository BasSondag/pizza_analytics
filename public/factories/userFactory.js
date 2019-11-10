myApp.factory('userFactory', function($http, $location){
	var factory = {};

	factory.findUser = function(person,callback) {
		$http.get('/api/people/' + person.name)
      .success(function(data) {
        if(!data){
          data = {'error': "Person does not exist"}
        }
        callback(data);
      });
	}

	return factory;

});
