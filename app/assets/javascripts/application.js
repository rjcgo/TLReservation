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

const pokelist = [
    "team-brand poke-ball", "team-brand premier-ball", "team-brand great-ball", "team-brand ultra-ball",
    "team-brand master-ball", "team-brand safari-ball", "team-brand level-ball", "team-brand lure-ball",
    "team-brand moon-ball", "team-brand friend-ball", "team-brand love-ball", "team-brand heavy-ball",
    "team-brand fast-ball", "team-brand sports-ball", "team-brand repeat-ball", "team-brand timer-ball",
    "team-brand nest-ball", "team-brand net-ball", "team-brand dive-ball", "team-brand luxury-ball"
]

const pokelistLg = [
    "team-brand-lg poke-ball-lg", "team-brand-lg premier-ball-lg", "team-brand-lg great-ball-lg", "team-brand-lg ultra-ball-lg",
    "team-brand-lg master-ball-lg", "team-brand-lg safari-ball-lg", "team-brand-lg level-ball-lg", "team-brand-lg lure-ball-lg",
    "team-brand-lg moon-ball-lg", "team-brand-lg friend-ball-lg", "team-brand-lg love-ball-lg", "team-brand-lg heavy-ball-lg",
    "team-brand-lg fast-ball-lg", "team-brand-lg sports-ball-lg", "team-brand-lg repeat-ball-lg", "team-brand-lg timer-ball-lg",
    "team-brand-lg nest-ball-lg", "team-brand-lg net-ball-lg", "team-brand-lg dive-ball-lg", "team-brand-lg luxury-ball-lg"
]

$(document).on('turbolinks:load', function () {
    $(document).on('click', function (event) {
        if (!$(event.target).closest('.modal-dialog').length) {
            $('.modal').hide();
        }
    });

    $("button").on("click", function () {
        var modal = $("." + $(this).data("dismiss")).hide();
    })

    $(".modal-open").on("click", function (e) {
        e.stopPropagation();
        e.preventDefault();

        var target = $($(this).data("target")).show();
        switch (target.attr("id")) {
            case "confirm-modal":
                var submit = target.find('#submit');
                submit.attr('href', $(this).data('href'));

                var method = $(this).data('method');
                if (method == "delete") {
                    submit.attr('rel', "nofollow");
                }
                submit.attr('data-method', method);
                submit.focus();
                break;

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

            case "rel-modal":
                var teams = $(this).data('teams');
                var submit = target.find('#submit');
                submit.attr('action', $(this).data('href'));
                submit.attr('method', $(this).data('method'));
                if (!Array.isArray(teams)) {
                    var arr = new Array();
                    arr.push(teams);
                    teams = arr;
                }
                if (teams.length < 1) {
                    target.find('.modal-body').html(
                        "<p style='text-align: center; margin: 10px;'>" +
                        "All teams are already able to use this testline.</p>");
                    target.find(".modal-footer button[type='submit']").prop('disabled', true);
                } else {
                    var noAccess = "<div class='outer-border-hidden'>" + 
                    "<ul class='pokeballs-grid pokeballs-grid-sm'>";
                    for (var index = 0; index < teams.length; index++) {
                        var element = teams[index];
                        noAccess = noAccess +
                            "<li><input type='checkbox' name='teams[]'" +
                            "id='team-" + element.id + "' value='" + element.id + "'>" +
                            "<label for='team-" + element.id + "' class='pokeballs-item'>" +
                            "<span class='" + pokelist[element.id % 20] + "'></span>" + element.name +
                            "</label></li>";
                    }
                    noAccess = noAccess + "</ul></div>";
                    target.find(".modal-footer button[type='submit']").prop('disabled', false);
                    target.find('.modal-body').html(noAccess);
                }
                break;

            case "reserve-modal":
                var teams = $(this).data('teams');
                var submit = target.find('#submit');
                submit.attr('action', $(this).data('href'));
                submit.attr('method', $(this).data('method'));
                target.find('#email').val($(this).data('email'));

                if (!Array.isArray(teams)) {
                    var arr = new Array();
                    arr.push(teams);
                    teams = arr;
                }

                var teamsRadio = "<legend>Team Name:</legend>";
                for (var index = 0; index < teams.length; index++) {
                    var element = teams[index];
                    teamsRadio = teamsRadio +
                        "<input type='radio' name='reservation[team_id]'" +
                        "id='team-" + element.id + "' value='" + element.id + "' required checked>" +
                        "<label for='team-" + element.id + "'>" + element.name + "</label>";
                }
                target.find('#teams-radio').html(teamsRadio);
                target.find('#title').focus();
                break;

            case "team-modal":
                var submit = target.find('#submit');
                var method = $(this).data('method');
                var team_name = $(this).data('team-name');

                submit.attr('action', $(this).data('href'));

                submit.find("#method").remove();
                if (method == "put") {
                    submit.append("<input id='method' name='_method' type='hidden' value='put' />");
                }
                submit.attr('method', "post");
                if (team_name == null) {
                    team_name = "";
                }
                target.find('#team-name').val(team_name);
                target.find('#team-name').focus();
                break;

            default:
                break;
        }
    });
});