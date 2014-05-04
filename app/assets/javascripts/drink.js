// Handle the creation of a new drink

var cupsizes = [1.5, 16, 32, 16.9];
var cuptype;

var drinkpotentcy = [.35, .4, .4, .4, .06, .12]
var drinktype;

var ready = function() {
  $("#slider-range").slider({
   orientation: "vertical",
   range: true,
   values: [ 0, 100 ],
   step: 1,
   slide: function( event, ui ) {
    $("#drink_amount").val(ui.values[0] * 0.01 * cupsizes[cuptype] * drinkpotentcy[drinktype]);
    console.log($("#drink_amount").val());
    }
  });

  $("#slider-hunger").slider({
    min: 1,
    max: 10,
    step: 1,
    slide: function(event, ui) {
      $("#drink_hunger").val($("#slider-hunger").slider("value"));
    }
  });

  $(".field-alcohol input:radio").click(function() {
    var alcoholtype = $(".field-alcohol input[type='radio']:checked").val();
    if (alcoholtype == 'vodka')
      drinktype = 0;
    if (alcoholtype == 'rum')
      drinktype = 1;
    if (alcoholtype == 'whiskey')
      drinktype = 2;
    if (alcoholtype == 'gin')
      drinktype = 3;
    if (alcoholtype == 'beer')
      drinktype = 4;
    if (alcoholtype == 'wine')
      drinktype = 5;
  });

  $(".field-amount input:radio").click(function() {
    var selection = $(".field-amount input[type='radio']:checked").val();
    $("#solo_pic").toggleClass("blur_pic");
    $("#shot_pic").toggleClass("blur_pic");
    $("#gatorade_pic").toggleClass("blur_pic");
    $("#water_pic").toggleClass("blur_pic");
    $("#" + selection + "_pic").toggleClass("blur_pic");
    if (selection == 'shot')
      cuptype = 0;
    if (selection == 'solo')
      cuptype = 1;
    if (selection == 'gatorade')
      cuptype = 2;
    if (selection == 'water')
      cuptype = 3;
    var height = ($("#" + selection + "_pic").height());

    var rowPos = $("#" + selection + "_pic").position();
    bottomTop = rowPos.top;
    bottomLeft = rowPos.left;

    $("#slider-range").css({
      "height": height,
      position: 'absolute',
      top: bottomTop,
      left: bottomLeft
    });

    $("#slider-range").show();
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);
