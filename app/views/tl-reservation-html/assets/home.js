$(document).ready(function(){

    $("#burger-nav").on("click", function(event){

        $("#burger-nav").toggleClass("change");
        $(".sidebar-nav").toggleClass("open");
    });

});