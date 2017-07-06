var colorInc = 100 / 3;

$(".percent-box").each(function () {
  var myVal = $(this).text();
  console.log(myVal);
  $(this).closest(".progress").parent().removeClass();
  if (myVal < colorInc * 1)
    $(this).closest(".progress").parent().addClass("red");
  else if (myVal < colorInc * 2)
    $(this).closest(".progress").parent().addClass("orange");
  else
    $(this).closest(".progress").parent().addClass("green");

  if (myVal == 0) {
    $(this).closest(".progress").find(".water").css("top", 110 + "%");
  } else {
    $(this).closest(".progress").find(".water").css("top", 100 - myVal + "%"); 
  }
  $(this).closest(".progress").find(".percent").text(myVal + "%");
  // $(".percent-box").val(myVal);
});