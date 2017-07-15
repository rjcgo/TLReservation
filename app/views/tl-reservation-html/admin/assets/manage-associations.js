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

    $(".card-tl-add").click(function () {
        $("#modal").addClass("show");
    });

    $(".modal-close").click(function () {
        $("#modal").removeClass("show");
    });

    $(".card-team-close", this).click(function(){
        $(this).parent(".card-team-icon").remove();
    })

    $(window).click(function (event) {
        if (event.target.id == "modal") {
            $("#modal").removeClass("show");
        }
    });
});