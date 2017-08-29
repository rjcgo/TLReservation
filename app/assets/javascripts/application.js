//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tinymce
//= require_tree .

function toggleMainNav() {
    var burgerNav = document.getElementById("burger-nav");
    var navbarNav = document.getElementsByClassName("navbar-nav");
    if (!burgerNav.classList.contains("change")) {
        burgerNav.classList.add("change");
    } else {
        burgerNav.classList.remove("change");
    }

    if (!navbarNav[0].classList.contains("open")) {
        navbarNav[0].classList.add("open");
    } else {
        navbarNav[0].classList.remove("open");
    }
}

function toggleSideNav() {
    var sidenav = document.getElementById("sidenav-container");
    if (!sidenav.classList.contains("toggle")) {
        sidenav.classList.add("toggle");
    } else {
        sidenav.classList.remove("toggle");
    }
}

function openReservation(evt, tabName) {
    var i, listgroups, sidenavlinks;

    testlines = document.getElementsByClassName("tabcontent");
    for (i = 0; i < testlines.length; i++) {
        testlines[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    sidenavlinks = document.getElementsByClassName("sidenav-links");
    for (i = 0; i < sidenavlinks.length; i++) {
        sidenavlinks[i].className = sidenavlinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
    if (!window.matchMedia("(min-width: 768px)").matches) {
        toggleSideNav();
    }
}

function startTime() {
    for (let i = 0; i < timers.length; i++) {
        var myDate = secToTime(Math.floor((new Date().getTime()) / 1000) + t[timers[i]] - pt);
        document.getElementById(timers[i]).innerHTML = myDate;
    }

    setTimeout(startTime, 1000);
}

function secToTime(time) {
    var sec = time % 60;
    sec = (sec < 10) ? "0" + sec : sec.toString();
    var min = Math.floor(time / 60) % 60;
    min = (min < 10) ? "0" + min : min.toString();
    var hr = Math.floor(time / 3600);
    return hr + ":" + min + ":" + sec;
}

function loadFile(event) {
    var output = document.getElementById('preview');
    var remove_diagram = document.getElementById('testline_remove_diagram').removeAttribute("disabled");
    output.src = URL.createObjectURL(event.target.files[0]);
};

$(document).on('turbolinks:load', function () {
    $(document).on('click', function (event) {
        if (!$(event.target).closest('.modal-dialog').length) {
            $('.modal').removeClass("show");
        }
    });

    $("button").on("click", function () {
        var modal = $("." + $(this).data("dismiss")).removeClass("show");
    })

    $(".modal-open").on("click", function (e) {
        e.stopPropagation();
        e.preventDefault();

        var target = $($(this).data("target")).addClass("show");
        switch (target.attr("id")) {
            case "desc-modal":
                var content = $(this).data('content');
                if (content == "") {
                    content = "No description available.";
                }
                target.find('.modal-text').html(content);
                break;

            case "img-modal":
                target.find('.modal-img').attr('src', $(this).data('diagram'));
                break;

            default:
                break;
        }
    });
});