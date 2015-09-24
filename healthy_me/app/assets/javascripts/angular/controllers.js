app.controller("UsersController", ["$scope", "$http", function($scope, $http) {
	$scope.testing = "testing";

	$http.get('http://localhost:3000/users/data.json').then(function(data){
    	$scope.user_data = data.data;
    	$scope.user_email = $scope.user_data.email;
    	$scope.user_name = $scope.user_data.first_name; 
  });


}]);