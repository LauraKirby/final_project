app.controller("UsersController", ["$scope", "$http", "$location", function($scope, $http, $location) {
	$scope.testing = "testing";
    //TO DO 
    //set up envServiceProvider
    console.log($location.host());
    $scope.connectToFitbit = function(){
        $http.get('/users/auth/fitbit/').then(function(data){
            $scope.fitbit_data = data.data;
        });

    };
    //get data from '/users/data.json' 
    //data for users/angular
    $http.get('/users/data.json').then(function(data){
    	$scope.user_data = data.data;
    	$scope.user_email = $scope.user_data.email;
    	$scope.user_name = $scope.user_data.first_name; 
    	$scope.user_image = $scope.user_data.image_url;
        $scope.user_image = $scope.user_data.races;
    });
}]);

app.controller("RaceController", ["$scope", "$http", function($scope, $http) {
    $scope.selectRace;
    $scope.currentRace; 
    $scope.racesCompleted = 2; 
    //$scope.today = new Date.now(); 
    $http.get('/races.json').then(function(data){
        $scope.races_data = data.data.races;
        $scope.race_name = $scope.races_data[0].name;
        // $scope.selectRace = function(){
        //     $scope.current_race = 0;
        // };
        $scope.raceDate = new Date($scope.races_data[0].dateWeb);
        $scope.current_race = 0;
        $scope.today = new Date(); 
        daysUntilRace = ($scope.today.getTime() - $scope.raceDate.getTime());
        msPerDay = 24 * 60 * 60 * 1000 ;
        race_daysLeft = daysUntilRace / msPerDay;
        $scope.daysLeft = Math.floor(race_daysLeft);
    });

    $http.get('/auth/fitbit/').then(function(data){

    });
}]);

app.controller("ProfileController", ["$scope", "$http", function($scope, $http) {
    $http.get('/users/data.json').then(function(data){
        $scope.user_data = data.data;
        $scope.user_email = $scope.user_data.email;
        $scope.user_name = $scope.user_data.first_name; 
        $scope.user_image = $scope.user_data.image_url;
    });
}]);


app.controller("PlanController", ["$scope", "$http", function($scope, $http) {
    $http.get('/plan.json').then(function(data){

    });
}]);

app.controller("HomeController", ["$scope", function($scope){
    $scope.name = "LAURA!";
}]);

