// Handle the creation of a new drink

$(document).ready(function() {
  $(".field-amount input:radio").click(function() {
    var selection = $(".field-amount input[type='radio']:checked").val();
    console.log($("label[for=\'" + selection + "\']").text());
  });
});

