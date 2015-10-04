var app = angular.module("HealthyMe", ["ngRoute"]);

//handles same origin policy issues
app.config(['$httpProvider', '$routeProvider', function($httpProvider, $routeProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

  $routeProvider
    .when('/', {
      templateUrl: '/partials/user_show.html', 
      controller: 'ProfileController'
    })
    // .when('/races', {
    //   templateUrl: '/partials/races.html', 
    //   controller: 'RaceController'
    // })
    .when('/race', {
      templateUrl: '/partials/race_show.html', 
      controller: 'RaceController'
    })
    .when('/plan', {
      templateUrl: '/partials/plan_show.html', 
      controller: 'PlanController'
    })
    .when('/team',{
      templateUrl: '/partials/team_show.html', 
    });


}]);

