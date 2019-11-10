const myApp = angular.module('myApp',['ngRoute']);

(function() {
  myApp.config(function($routeProvider) {
    $routeProvider
      .when('/', {
        controller: 'homeController',
        templateUrl: "partials/home/index.html"
      })
      .otherwise({
        redirectTo: "/"
      })
  })
}());
