// Handle the creation of a new drink

var ready = function() {
  $("#slider-range").slider({
   orientation: "vertical",
   range: true,
   values: [ 0, 1000 ],
   step: 1,
   slide: function( event, ui ) {
    $( ".hidden-number" ).val( ui.values[ 0 ] + ui.values[ 1 ] );
    $("#drink_amount").val(ui.values[ 0 ] + ui.values[ 1 ])
  }
});

  $( ".hidden-number" ).val($( "#slider-range" ).slider( "values", 0 ) + $( "#slider-range" ).slider( "values", 1 ) );
  $(".field-amount input:radio").click(function() {
    var selection = $(".field-amount input[type='radio']:checked").val();
    $("#solo_pic").toggleClass("blur_pic");
    $("#shot_pic").toggleClass("blur_pic");
    $("#gatorade_pic").toggleClass("blur_pic");
    $("#water_pic").toggleClass("blur_pic");
    $("#" + selection + "_pic").toggleClass("blur_pic");
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
