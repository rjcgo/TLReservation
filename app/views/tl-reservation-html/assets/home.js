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

    var testlinescount = 5;

    for (var i = 0; i < testlinescount; i++) {
        (function (i) {
            var btnSelector = ".dropdown:eq(" + i + ") .dropbtn";
            var drpSelector = ".dropdown:eq(" + i + ") .dropdown-content";
            var triSelector = ".dropdown:eq(" + i + ") .dropdown-triangle";

            $(btnSelector).on("click", function (event) {
                if (!$(drpSelector).hasClass("show")) {
                    $(drpSelector).addClass("show");
                    $(triSelector).addClass("show");
                    $("*:not(" + drpSelector, triSelector +")").removeClass("show");
                } else {
                    $(drpSelector).removeClass("show");
                    $(triSelector).removeClass("show");
                }

            });

        })(i);
    }
});