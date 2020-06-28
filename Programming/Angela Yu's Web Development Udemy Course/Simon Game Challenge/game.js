var gamePattern = [];
var userClickedPattern = [];
var gameHasStarted = false;
var level = 0;

var buttonColors = ["red", "blue", "green", "yellow"];

$(".btn").click(function(event) {
  var userChosenColor = $(this).attr("id");
  userClickedPattern.push(userChosenColor);
  playSound(userChosenColor);
  animatePressed(userChosenColor);
  checkAnswer(userChosenColor);
  nextSequence();
});

$(document).keypress(function() {
  if (!gameHasStarted) {
    nextSequence();
    gameHasStarted = true;
  }
});

function nextSequence() {
  var randomNumber = Math.floor(Math.random() * 4);
  var randomChosenColor = buttonColors[randomNumber];
  $("#" + randomChosenColor).fadeOut(100).fadeIn(100);
  gamePattern.push(randomChosenColor);
  $("#level-title").text("Level " + level.toString());
  level++;
}

function playSound(name) {
  var sound = new Audio("sounds/" + name + ".mp3");
  sound.play();
}

function animatePressed(currentColor) {
  $("#" + currentColor).addClass("pressed");
  setTimeout(function() {
       $("#" + currentColor).removeClass("pressed");
   }, 100);
}

function checkAnswer(currentLevel) {
  if (currentLevel === gamePattern[level - 1]) {
    console.log("success");
  } else {
    var wrongSound = new Audio("sounds/wrong.mp3");
    wrongSound.play();
    $("body").addClass("game-over");
    setTimeout(function() {
        $("body").removeClass("game-over");
    }, 200);
    startOver();
  }
}

function startOver() {
  gameHasStarted = false;
  level = 0;
  userClickedPattern = [];
  gamePattern = [];
}
