$(document).ready(function() {
    var timestamps;
    var outcomeArray;
    var sets = [];
    var setStart = 0;
    var totalconsumed = 0;
    var target = 2000;
    var total_consumed_today;
    var water_height = 372;

    var getTodayData = function(){

      var url ='/todayData';

      $.ajax({
        url: url,
      }).done(function(result) {
        console.log(result.total[0].total_consumed*1000);
        total_consumed_today = result.total[0].total_consumed*1000;
        waterBottleClassPercentage = 1.0 - (total_consumed_today/target);
        // waterBottleClassPercentage= 0.8;
        water_height= water_height * waterBottleClassPercentage;
        $('.water').css('height', water_height+'px');
      //   console.log(result.outcome);
      //   timestamps = result.change;
      //   outcomeArray = result.outcome;
      //
      //     // # if i+1 > i .split arrays at index of i+1
      // for (var i = 0; i < outcomeArray.length; i++) {
      //   if(outcomeArray[i] < outcomeArray[i+1]){ //refill detected
      //     sets.push(outcomeArray.slice(setStart, i+1));
      //     setStart= i+1;
      //   } else if (i === outcomeArray.length -1){
      //     sets.push(outcomeArray.slice(setStart));
      //   }
      // }
      // console.log(sets);// # for each array do array.first -array.last. Sum those differences for the total water consumed.
      // for (var j = 0; j < sets.length; j++) {
      //     totalconsumed += (_.first(sets[j]) - _.last(sets[j]));
      // }
      // console.log(totalconsumed);
      // // Total water consumed divided by Goal = in Sass how much of the div container to show.

    });
    };

    var getHistoricalData = function() {

        var url = '/historicalData';

        $.ajax({
            url: url,
        }).done(function(data) {
            console.log(data.totalArray);
            console.log(data.totalArray[0].date);
            console.log(data.totalArray[0].total_consumed);
            // getTodayData();
            var dateAxis = [];
            var consumedAxis = [];
            for (var i = 0; i < data.totalArray.length; i++) {
              dateAxis.push(data.totalArray[i].date);
              consumedAxis.push(data.totalArray[i].total_consumed);
              if (consumedAxis[i] == target){
                consumedAxis[i]={
                    y: consumedAxis[i],
                    marker: {
                        symbol: 'url(/assets/quench2o_logo.png)'
                    }
              };
            }
          }
            console.log(dateAxis.pop(), consumedAxis.pop());



            $(function() {
                $('#container').highcharts({
                    chart: {
                        type: 'spline'
                    },
                    title: {
                        text: "Katrina's Water Intake"
                    },
                    subtitle: {
                        text: 'Last 7 days'
                    },
                    xAxis: {
                        categories: dateAxis

                    },
                    yAxis: {
                        title: {
                            text: 'mL'
                        },
                        labels: {
                            formatter: function() {
                                return this.value + 'mL';
                            }
                        }
                    },
                    tooltip: {
                        crosshairs: true,
                        shared: true
                    },
                    plotOptions: {
                        spline: {
                            marker: {
                                radius: 4,
                                lineColor: '#ddd',
                                lineWidth: 1
                            }
                        }
                    },
                    series: [{
                        name: 'Target',
                        color: '#ccc',
                        marker: {
                            symbol: 'square'
                        },
                        data: [2000, 2000, 2000, 2000, 2000, 2000, 2000]

                    }, {
                        name: 'Achieved',
                        marker: {
                            symbol: 'diamond'
                        },

                        data: consumedAxis
                    }]
                });
            });
        });
    };

    setInterval(function() {
    getTodayData();
  }, 60000);
    getHistoricalData();
});
