var app = angular.module("HealthyMe", []);

//handles same origin policy issues
app.config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
}]);