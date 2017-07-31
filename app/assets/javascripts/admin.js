var delete_id = 0;

function activate_modal(id) {
  document.getElementById(id).style.display = "block";
}

function deactivate_modal(id) {
  document.getElementById(id).style.display = "none";
}

function ask_modal(id) {
  if (id == delete_id)
    return true;
  document.getElementById("remove_access").style.display = "block";
  delete_id = id;
  return false;
}

function confirm_modal() {
  document.getElementById(delete_id).click();
}

function cancel_modal() {
  delete_id = 0;
  document.getElementById("remove_access").style.display = "none";
}