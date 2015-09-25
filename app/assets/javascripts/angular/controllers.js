app.controller("UsersController", ["$scope", "$http", function($scope, $http) {
	$scope.testing = "testing";
	$http.get('http://localhost:3000/users/data.json').then(function(data){
    	$scope.user_data = data.data;
    	$scope.user_email = $scope.user_data.email;
    	$scope.user_name = $scope.user_data.first_name; 
    	$scope.user_image = $scope.user_data.image_url;
  });

 	$http.get('http://localhost:3000/races.json').then(function(data){
     	$scope.b2b_data = data.data;
     	$scope.b2b_name = $scope.b2b_data.name;
     	$scope.b2b_distance = $scope.b2b_data.distance; 
     	$scope.b2b_date = $scope.b2b_data.date;
        $scope.b2b_cost = $scope.b2b_data.cost;
        $scope.b2b_image = $scope.b2b_data.image_url;
   });


}]);