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
        $("#modal-add").addClass("show");
    });

    $(".modal-close-as, .modal-btn-as").click(function () {
        $("#modal-add").removeClass("show");
        $("#modal-del").removeClass("show");
    });

    $(".card-team-close", this).click(function(){
        $("#modal-del").addClass("show");
        // $(this).parent(".card-team-icon").remove();
    })

    $(window).click(function (event) {
        if (event.target.id == "modal-add" || event.target.id == "modal-del") {
            $("#modal-add").removeClass("show");
            $("#modal-del").removeClass("show");
        }
    });
});