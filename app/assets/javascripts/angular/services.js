app.service("userService", function($http) {
  return {
  	getUser: function(){
  		$http.get('/users/data.json').then(function(data){
    	//added returnedData as a property to user_data to have the data returned stored an untampered with object.
        this.user_data = {};
        this.user_data = data.data; 
        //do not need to write out all of these properties on user_data because they already exist, 
        //however, it will make my code more readable
        //Go back to users_controller, to modify the current_user properties that are sent to the client
        this.user_data = {
            email: this.user_data.email,
            first_name: this.user_data.first_name,
            last_name: this.user_data.last_name,
            image_url: this.user_data.image_url,
            races: this.user_data.races,
            current_race: this.user_data.current_race
        };
        console.log(this.user_data.email);
        return this.user_data;
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