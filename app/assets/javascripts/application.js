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

function toggleFullModal(event) {
    var modalDialog = event.target.closest('.modal-dialog');
    var modalContent = event.target.closest('.modal-content');
    console.log(modalDialog);
    if (modalDialog.style.maxWidth == '100%') {
        modalDialog.removeAttribute('style');
        modalContent.removeAttribute('style');
        modalDialog.style.transition = '0.5s';
        modalContent.style.transition = '0.5s';
    } else {
        modalDialog.style.top = '0';
        modalDialog.style.marginBottom = '0';
        modalDialog.style.height = '100%';
        modalDialog.style.width = '100%';
        modalDialog.style.maxWidth = '100%';
        modalDialog.style.transition = '0.5s';
        modalContent.style.transition = '0.5s';
        modalContent.style.height = '100%';
    }
}

function openReservation(evt, tabName, tabMenu) {
    var i, listgroups, sidenavlinks;

    var testlines = document.getElementsByClassName("tabcontent");
    for (i = 0; i < testlines.length; i++) {
        testlines[i].style.display = "none";
    }

    var submenus = document.getElementsByClassName("sidenav-submenu");
    for (var j = 0; j < submenus.length; j++) {
        submenus[j].style.display = "none";
    }

    // Get all elements with class="sidenav-links" and remove the class "active"
    sidenavlinks = document.getElementsByClassName("sidenav-link");
    for (i = 0; i < sidenavlinks.length; i++) {
        sidenavlinks[i].className = sidenavlinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(tabName).style.display = "block";
    document.getElementById(tabMenu).style.display = "block";
    evt.currentTarget.className += " active";
    if (!window.matchMedia("(min-width: 768px)").matches) {
        toggleSideNav();
    }
}

function startTime() {
    for (var i = 0; i < timers.length; i++) {
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

function addRecipient() {
    var email = document.getElementById("reservation_recipient");
    var error_msg = document.getElementById("email-error");
    var recipient_list = document.getElementById("recipient-list");

    // check if blank
    if (!email.value) {
        email.classList.add("has-error");
        error_msg.textContent = "Must not be blank.";
    } else {
        email.value = email.value.replace(/[^\w@._\s]/g, "");
        console.log(email.value);
        var email_list = email.value.split(" ");
        
        for (var i = 0; i < email_list.length; i++) {
            var single_email = email_list[i];
            console.log(single_email);

            // validate email
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(single_email)) {
                var t = document.createTextNode(single_email);
        
                // create elements
                var chip = document.createElement("li");
                var chip_icon = document.createElement("i");
                var chip_label = document.createElement("span");
                var chip_input = document.createElement("input");
                var chip_close = document.createElement("i");
        
                // add class
                chip.className = "chip";
                chip_icon.className = "fa fa-user-circle fa-fw chip-icon";
                chip_close.className = "fa fa-times-circle chip-close";
        
                // add attr
                chip_input.type = "hidden";
                chip_input.value = single_email;
                chip_input.name = "recipient[email][]";
        
                // add event
                chip_close.onclick = function (e) {
                    e.cancelBubble = true;
                    recipient_list.removeChild(this.parentElement);
                }
        
                // append to document
                chip_label.appendChild(chip_input);
                chip_label.appendChild(t);
        
                chip.appendChild(chip_icon);
                chip.appendChild(chip_label);
                chip.appendChild(chip_close);
                recipient_list.appendChild(chip);
        
                email.classList.remove("has-error");
                error_msg.textContent = "";
                email.value = "";
            } else {
                email.classList.add("has-error");
                error_msg.textContent = "Email must be valid.";
            }
        }
    }
}

function enlargeImage() {
    var preview = document.getElementById("preview").src;
    var imgModal = document.getElementById("img-modal");
    var img = imgModal.getElementsByClassName("modal-img");

    img[0].setAttribute('src', preview);
    imgModal.classList.add("show");
}

function toggleTeamOverlay(overlay_id) {
    var overlay = document.getElementById(overlay_id);
    if (overlay.style.top == '0px') {
        overlay.style.top = '';
    } else {
        overlay.style.top = '0';
    }
}

$(document).on('turbolinks:load', function () {
    $(document).on('click', function (event) {
        if (!$(event.target).closest('.modal-dialog').length) {
            $(event.target).closest('.modal').removeClass("show");
        }
    });

    $(document).keydown(function(e) {
        if (e.keyCode == 27) {
            $('.modal').removeClass("show");
        } 
    });

    $("button").on("click", function () {
        var modal = $(event.target).closest("." + $(this).data("dismiss")).removeClass("show");
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
