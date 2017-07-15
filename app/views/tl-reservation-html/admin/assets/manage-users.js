$(document).ready(function () {
    
        $("#burger-nav").on("click", function (event) {
    
            $("#burger-nav").toggleClass("change");
            $(".navbar-nav").toggleClass("open");
        });
    
        $(".sidenav-toggle").on("click", function (event) {
            event.preventDefault();
            $(".sidenav").toggleClass("toggle");
        });
    
        $(".closebtn").on("click", function (event) {
            event.preventDefault();
            $(".sidenav").removeClass("toggle");
        });
    });