// Handle the creation of a new drink

$(document).ready(function() {
  $(".field-amount input:radio").click(function() {
    var selection = $(".field-amount input[type='radio']:checked").val();
    $("#solo_pic").toggleClass("blur_pic");
    $("#shot_pic").toggleClass("blur_pic");
    $("#gatorade_pic").toggleClass("blur_pic");
    $("#water_pic").toggleClass("blur_pic");
    $("#" + selection + "_pic").toggleClass("blur_pic");
  });
});

