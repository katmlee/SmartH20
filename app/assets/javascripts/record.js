$(document).ready(function() {
  var timestamps;
  var outcomeArray;
  var sets=[];
  var setStart = 0;
  var totalconsumed = 0;

  var getTodayData = function(){

    var url ='/todayData';

    $.ajax({
      url: url,
    }).done(function(result) {
      console.log(result.outcome);
      timestamps = result.change;
      outcomeArray = result.outcome;

        // # if i+1 > i .split arrays at index of i+1
    for (var i = 0; i < outcomeArray.length; i++) {
      if(outcomeArray[i] < outcomeArray[i+1]){ //refill detected
        sets.push(outcomeArray.slice(setStart, i+1));
        setStart= i+1;
      } else if (i === outcomeArray.length -1){
        sets.push(outcomeArray.slice(setStart));
      }
    }
    console.log(sets);
    for (var j = 0; j < sets.length; j++) {
        totalconsumed += (_.first(sets[j]) - _.last(sets[j]));
    }
    console.log(totalconsumed);

  });
  };

  getTodayData();



  // # for each array do array.first -array.last. Sum those differences for the total water consumed. Total water consumed divided by Goal = in Sass how much of the div container to show.

});
