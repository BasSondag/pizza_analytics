const myApp = angular.module('myApp',['ngRoute']);

(function() {
  myApp.config(function($routeProvider) {
    $routeProvider
      .when('/', {
        controller: 'usersController',
        templateUrl: "partials/users/index.html"
      })
      .otherwise({
        redirectTo: "/"
      })
  })
})
