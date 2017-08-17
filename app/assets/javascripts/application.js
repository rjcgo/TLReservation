//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tinymce

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

function openReservation(evt, cityName) {
    var i, listgroups, sidenavlinks;

    listgroups = document.getElementsByClassName("list-group");
    for (i = 0; i < listgroups.length; i++) {
        listgroups[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    sidenavlinks = document.getElementsByClassName("sidenav-links");
    for (i = 0; i < sidenavlinks.length; i++) {
        sidenavlinks[i].className = sidenavlinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
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

$(document).on('turbolinks:load', function () {
    $(document).click(function (e) {
        if ($(e.target).is('.modal')) {
            $('.modal').hide();
        }
    });

    $("button").on("click", function () {
        var modal = $("." + $(this).data("dismiss")).hide();
    })

    $(".modal-open").on("click", function (e) {
        e.stopPropagation();
        e.preventDefault();
        var modal = $($(this).data("target")).show();
        modal.find('#submit').attr('href', $(this).data('href'));
        var content = $(this).data('content');
        if (content == "") {
            content = "<p>No description available</p>";
        }
        modal.find('.modal-body').append(content);
        modal.find('.modal-img').attr('src', $(this).data('diagram'));
    });
});