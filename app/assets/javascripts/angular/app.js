var app = angular.module("HealthyMe", ["ngRoute"]);

//handles same origin policy issues
app.config(['$httpProvider', '$routeProvider', function($httpProvider, $routeProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

  $routeProvider
  	.when('/users/angular', {
  		templateUrl: '/partials/user_profile.html', 
  		controller: 'controller.js'
  	});
}]);