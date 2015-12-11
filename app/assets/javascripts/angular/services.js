app.service("userService", function($http) {
  //returns a promise
  return {
  	getUser: function(){
  		$http.get('/users/data.json').then(function(data){
    	//added returnedData as a property to user_data to have the data returned stored an untampered with object.
        user_data = {};
        user_data = data.data; 
        //do not need to write out all of these properties on user_data because they already exist, 
        //however, it will make my code more readable
        //Go back to users_controller, to modify the current_user properties that are sent to the client
        //make a comment with all of the properties 
        // user_data = {
        //     email: user_data.email,
        //     first_name: user_data.first_name,
        //     last_name: user_data.last_name,
        //     image_url: user_data.image_url,
        //     races: user_data.races,
        //     current_race: user_data.current_race
        // };

        return user_data;
        
    });
   }
  };
});

// app.service('HealthyMe', ['$resource', function($resource) {
//   return $resource(
//     "/api/contacts/:id.json",
//     {id: "@id"},
//     {update: {method: "PUT"}} 
//   );
// }]);

//Notes
//.then is a method on a promise 
//q on github, see tutorials
//in a promise you can return data or another promise