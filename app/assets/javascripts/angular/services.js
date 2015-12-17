app.service("userService", ['$http', function($http) {
  //returns a promise
  return {
  	getUser: function(){
  		return $http.get('/users/data.json').then(function(data){
        user_data = {};
        user_data = data.data;
        // user_data has the following properties: 
        // first_name, email, image_url, races, current_race
        return user_data; 
    });
   }
  };
}]);

// app.service('HealthyMe', ['$resource', function($resource) {
//   return $resource(
//     "/api/contacts/:id.json",
//     {id: "@id"},
//     {update: {method: "PUT"}} 
//   );
// }]);

// To Do: 
//users_controller, to modify the current_user data that is sent to client