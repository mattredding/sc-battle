$(function(){
  $(".connect-with-soundcloud a.connect").live("click", function(event){
    event.preventDefault();
    SC.Connect.open({
      redirectEndpoint: "/soundcloud/connect",
      error: function(reason){
        console.log("SoundCloud Connect failed: "+ reason);
      },
      success: function(){
        this.client.get("/me", function(me){
          $(".connect-with-soundcloud").addClass("connected");
          $(".visible-when-logged-in").removeClass("hidden");

          $(".connect-with-soundcloud .username").html(me.username);
        });
      }
    });
  });

})