// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
// var ready = function () {

// $("#burger-nav").on("click", function (event) {

//     $("#burger-nav").toggleClass("change");
//     $(".navbar-nav").toggleClass("open");
// });

// $(".sidenav-toggler").on("click", function (event) {
//     event.preventDefault();
//     $("#sidenav-container").toggleClass("toggle");
// });

//     $(".closebtn").on("click", function (event) {
//         event.preventDefault();
//         $("#sidenav-container").removeClass("toggle");
//     })

//     $(document).click(function () {
//         $(".show").removeClass("show");
//     });

// $(".dropbtn, .dropdown-content, .modal-content, .modal-confirm, .modal-img").click(function (e) {
//     e.stopPropagation();
// });

// $(".dropdown:eq(0) .dropbtn").on("click", function (event) {
//     if (!$(".dropdown:eq(0) .dropdown-content").hasClass("show")) {
//         $(".dropdown:eq(0) .dropdown-triangle").addClass("show");
//         $(".dropdown:eq(0) .dropdown-content").addClass("show");
//     } else {
//         $(".dropdown-content").removeClass("show");
//         $(".dropdown-triangle").removeClass("show");
//     }
// });

//     $(".modal-close, .modal-btn").click(function (e) {
//         $(".modal").removeClass("show");
//     });

//     $(".show-edit-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#edit-modal").addClass("show");
//     });

//     $(".show-rel-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#rel-modal").addClass("show");
//     });

//     $(".show-delete-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#delete-modal").addClass("show");
//     });

//     $(".show-confirm-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#confirm-admin-modal").addClass("show");
//     });

//     $(".show-add-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#add-modal").addClass("show");
//     });

//     $(".show-img-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#img-modal").addClass("show");
//     });

//     $(".show-description-modal").click(function (e) {
//         e.stopPropagation();
//         e.preventDefault();
//         $("#description-modal").addClass("show");
//     });

// }

// function openReservation(evt, cityName) {
//     // Declare all variables
//     var i, tabcontent, tablinks;

//     // Get all elements with class="tabcontent" and hide them
//     tabcontent = document.getElementsByClassName("tabcontent");
//     for (i = 0; i < tabcontent.length; i++) {
//         tabcontent[i].style.display = "none";
//     }

//     // Get all elements with class="tablinks" and remove the class "active"
//     tablinks = document.getElementsByClassName("tablinks");
//     for (i = 0; i < tablinks.length; i++) {
//         tablinks[i].className = tablinks[i].className.replace(" active", "");
//     }

//     // Show the current tab, and add an "active" class to the link that opened the tab
//     document.getElementById(cityName).style.display = "block";
//     evt.currentTarget.className += " active";
// }

// $(document).ready(ready);
// $(document).on('turbolinks:load', ready);

var main_id = 0;
// var modal = document.getElementsByClassName("modal");
var modalClose = document.getElementsByClassName("modal-close");
var modalBtn = document.getElementsByClassName("modal-btn");

function openAddModal() {
    var element = document.getElementById("add-modal");
    element.classList.add("show");
}

function openEditModal(id) {
    main_id = id;
    var element = document.getElementById("edit-modal");
    element.classList.add("show");
}

function openDeleteModal(id) {
    main_id = id;
    var element = document.getElementById("delete-modal");
    element.classList.add("show");
}

function openRelModal(id) {
    main_id = id;
    var element = document.getElementById("rel-modal");
    element.classList.add("show");
}

function openConfirmAdminModal(id) {
    main_id = id;
    var element = document.getElementById("confirm-admin-modal");
    element.classList.add("show");
}

function openImgModal() {
    var element = document.getElementById("img-modal");
    element.classList.add("show");
}

function openDescriptionModal() {
    var element = document.getElementById("description-modal");
    element.classList.add("show");
}

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

document.onclick = function (event) {
    if (event.target.classList.contains("modal-submit")) {
        var modal = event.target.closest(".modal");
        modal.classList.remove("show");
        document.getElementById("" + main_id).submit();
    } else if (event.target.classList.contains("modal")) {
        var modal = event.target;
        modal.classList.remove("show");
    } else if (event.target.classList.contains("modal-close") ||
        event.target.classList.contains("modal-btn")) {
        var modal = event.target.closest(".modal");
        modal.classList.remove("show");
    }
    main_id = 0;
}