$("h1").css("color", "red");

$("button").click(function() {
  $("h1").slideToggle();
});

$(document).keypress(function(event) {
  $("h1").text(event.key);
});

$("h1").on("mouseover", function() {
  $("h1").css("color", "purple");
})
