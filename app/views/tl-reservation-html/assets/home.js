$(document).ready(function () {

    $("#burger-nav").on("click", function (event) {

        $("#burger-nav").toggleClass("change");
        $(".navbar-nav").toggleClass("open");
    });

    $(document).click(function () {
        $(".dropdown-content").removeClass("show");
        $(".dropdown-triangle").removeClass("show");
    });

    $(".dropbtn").click(function (e) {
        e.stopPropagation();
    });

    $(".dropdown-content").click(function (e) {
        e.stopPropagation();
    });

    $(".dropdown:eq(0) .dropbtn").on("click", function (event) {
        if (!$(".dropdown:eq(0) .dropdown-content").hasClass("show")) {
            $(".dropdown:eq(0) .dropdown-triangle").addClass("show");
            $(".dropdown:eq(0) .dropdown-content").addClass("show");
        } else {
            $(".dropdown-content").removeClass("show");
            $(".dropdown-triangle").removeClass("show");
        }
    });

});