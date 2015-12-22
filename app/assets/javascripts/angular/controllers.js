app.controller("UsersController", ["$scope", "$http", "$location", "userService", function($scope, $http, $location, userService) {
    userService.getUser().then(function(user_data){
        $scope.user = user_data;
        console.log("here is my scope.user", $scope.user);
    });
}]);

app.controller("RaceController", ["$scope", "$http", "userService", function($scope, $http, userService) {
    $scope.selectRace;
    userService.getUser().then(function(user_data){
        $scope.user = user_data;
        $scope.currentRace = $scope.user.current_race;
    });

    $scope.updateCurrentRace = function(){
        var data =  {
                      race: {
                              name: $scope.selectRace
                              // save current_race to database
                            } 
                    };
        $http.post('/races', data).then(function(response){
            $scope.status = response.status;
            $scope.current_race = parseInt(response.data.id) - 1;
            console.log(response.data.id);
         });
    };

    $http.get('/races.json').then(function(data){
        $scope.races_data = data.data.races;
        console.log($scope.races_data);
        // races_data is an array of race objects
        // Each race object has: name, about, iOSImage,
        // date, thumbnail, cost, image, dateWeb, transportation

        $scope.raceDate = new Date($scope.races_data[$scope.currentRace].dateWeb);
        $scope.today = new Date(); 
        daysUntilRace = ($scope.today.getTime() - $scope.raceDate.getTime());
        msPerDay = 24 * 60 * 60 * 1000 ;
        race_daysLeft = daysUntilRace / msPerDay;
        $scope.daysLeft = Math.floor(race_daysLeft);
    });
    
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

//user should be able to select a race with "updateCurrentRace"
    //then the "about race" and "fitness plan" should be updated

//if race already exsists within user.races, 
    //then new race should not be added to user.races association

//should i add a column to my User table for current_race? 
//if i can get all the race data from the user object, 
    //then I do not need to make a separate call to the races api

//set up envServiceProvider
//console.log($location.host());