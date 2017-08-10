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
  var min = Math.floor(time/60) % 60;
  min = (min < 10) ? "0" + min : min.toString();
  var hr = Math.floor(time/3600);
  return hr + ":" + min + ":" + sec;
}

var delete_id = 0;
var temp_id = 0;

function activate_modal(id) {
  document.getElementById(id).style.display = "block";
}

function deactivate_modal(id) {
  document.getElementById(id).style.display = "none";
}

function ask_modal(id) {
  if (id == delete_id)
    return true;
  document.getElementById("confirm-modal").style.display = "block";
  temp_id = id;
  return false;
}

function confirm_modal() {
    delete_id = temp_id;
    document.getElementById(delete_id).click();
}

function cancel_modal() {
  delete_id = temp_id = 0;
  document.getElementById("confirm-modal").style.display = "none";
}

document.onclick = function(event) {
  if (event.target.classList.contains("modal"))
    event.target.style.display = "none";
}