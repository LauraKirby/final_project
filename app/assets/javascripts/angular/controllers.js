app.controller("UsersController", ["$scope", "$http", "$location", "userService", function($scope, $http, $location, userService) {
    userService.getUser().then(function(user_data){
        $scope.user = user_data;
    });
}]);

app.controller("RaceController", ["$scope", "$http", function($scope, $http) {
    $scope.selectRace;
    $scope.currentRace = 0;
    $scope.racesCompleted = 2; 
    // $scope.today = new Date.now(); 
    $http.get('/races.json').then(function(data){
        $scope.races_data = data.data.races;
        // console.log($scope.races_data);
        // $scope.race_name = $scope.races_data[$scope.user_data.current_race].name;
        // $scope.raceDate = new Date($scope.races_data[$scope.user_data.current_race].dateWeb);
        // $scope.current_race = 0;
        // $scope.today = new Date(); 
        // daysUntilRace = ($scope.today.getTime() - $scope.raceDate.getTime());
        // msPerDay = 24 * 60 * 60 * 1000 ;
        // race_daysLeft = daysUntilRace / msPerDay;
        // $scope.daysLeft = Math.floor(race_daysLeft);
    });
    $scope.sendData = function(){
        var data =  {
                      race: {
                              name: $scope.selectRace
                            } 
                    };
        $http.post('/races', data).then(function(response){
            $scope.status = response.status;
            $scope.current_race = parseInt(response.data.id) - 1;
         });
    };
}]);

app.controller("PlanController", ["$scope", "$http", function($scope, $http) {
    $http.get('/users/plan.json').then(function(data){
        $scope.steps_data = data.data.two_weeks_before; 
        $scope.focus = $scope.steps_data[0].focus;
        $scope.activity = $scope.steps_data[0].activity;
        $scope.duration = $scope.steps_data[0].duration;
    });
    $http.get('users/plansummary.json').then(function(data){
        $scope.planSummary = data.data.plan_summary;
        $scope.planDiscription = $scope.planSummary[0].summary;
    });
}]);

//TO DO 
//set up envServiceProvider
//console.log($location.host());