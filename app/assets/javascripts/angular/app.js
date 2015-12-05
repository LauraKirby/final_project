var app = angular.module("HealthyMe", ["ngRoute", "ngResource"]);

//handles same origin policy issues
app.config(['$httpProvider', '$routeProvider', function($httpProvider, $routeProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

  $routeProvider
    .when('/', {
      templateUrl: '/partials/user_show.html', 
      controller: 'ProfileController'
    })
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
    }).otherwise({
      redirectTo: '/'
    });


}]);