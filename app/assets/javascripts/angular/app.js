var app = angular.module("HealthyMe", ["ngRoute"]);

//handles same origin policy issues
app.config(['$httpProvider', '$routeProvider', function($httpProvider, $routeProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

  $routeProvider
    .when('/', {
      templateUrl: '/partials/user_profile.html', 
      controller: 'ProfileController'
    })
    // .when('/races', {
    //   templateUrl: '/partials/races.html', 
    //   controller: 'RaceController'
    // })
    .when('/race', {
      templateUrl: '/partials/race_profile.html', 
      controller: 'RaceController'
    })
    .when('/plan', {
      templateUrl: '/partials/fitness_plan.html', 
      controller: 'PlanController'
    });


}]);