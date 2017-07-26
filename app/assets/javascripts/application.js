// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function () {

    $("#burger-nav").on("click", function (event) {

        $("#burger-nav").toggleClass("change");
        $(".navbar-nav").toggleClass("open");
    });

    $(".sidenav-toggler").on("click", function (event) {
        event.preventDefault();
        $("#sidenav-container").toggleClass("toggle");
    });

    $(".closebtn").on("click", function (event) {
        event.preventDefault();
        $("#sidenav-container").removeClass("toggle");
    })

    $(document).click(function () {
        $(".show").removeClass("show");
    });

    $(".dropbtn, .dropdown-content, .modal-content, .modal-confirm, .modal-img").click(function (e) {
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

    $(".modal-close, .modal-btn").click(function (e) {
        $(".modal").removeClass("show");
    });

    $(".show-edit-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#edit-modal").addClass("show");
    });

    $(".show-rel-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#rel-modal").addClass("show");
    });

    $(".show-delete-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#delete-modal").addClass("show");
    });

    $(".show-confirm-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#confirm-admin-modal").addClass("show");
    });

    $(".show-add-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#add-modal").addClass("show");
    });

    $(".show-img-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#img-modal").addClass("show");
    });

    $(".show-description-modal").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("#description-modal").addClass("show");
    });

});

function openReservation(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}