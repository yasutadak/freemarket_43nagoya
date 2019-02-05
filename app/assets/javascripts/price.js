$("#sell-price").on("keyup", function(){
  var commission = val() * 0.1;
  $("#commission").text("¥" + commission);
});
