$(document).ready(function(){

    $("#burger-nav").on("click", function(event){

        $("#burger-nav").toggleClass("change");
        $(".navbar-nav").toggleClass("open");
    });

});
