$(document).ready(function(){
    $("#modal-btn").click(function(){
        $("#modal").addClass("show");
    });

    $(".modal-close").click(function(){
        $("#modal").removeClass("show");
    });
});
