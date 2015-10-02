app.controller("UsersController", ["$scope", "$http", "$location", function($scope, $http, $location) {
	$scope.testing = "testing";
    //TO DO 
    //set up envServiceProvider
    console.log($location.host());

    $http.get('/users/data.json').then(function(data){
    	$scope.user_data = data.data;
    	$scope.user_email = $scope.user_data.email;
    	$scope.user_name = $scope.user_data.first_name; 
    	$scope.user_image = $scope.user_data.image_url;
  });
}]);

app.controller("RacesController", ["$scope", "$http", "$location", function($scope, $http, $location) {

    $http.get('/races.json').then(function(data){
        $scope.b2b_data = data.data;
        $scope.b2b_name = $scope.b2b_data.name;
        $scope.b2b_distance = $scope.b2b_data.distance; 
        $scope.b2b_date = $scope.b2b_data.date;
        $scope.b2b_cost = $scope.b2b_data.cost;
        $scope.b2b_image = $scope.b2b_data.image_url;
   });
}]);