$(function () {

  if ( $( '#container' ).length ) {
    var chartus;
    var strategy_id = $('#container').data('strategy_id')

    $.getJSON('/requests/chart_data/' + strategy_id, function (data) {
      chartus = Highcharts.stockChart('container', {

        chart: {
          type: 'candlestick',
          events: {
            load: function () {

              setInterval(function () {
                $.ajax({
                  url: '/requests/last_chart_data/' + strategy_id,
                  success: function(point) {

                    var series = chartus.series[0],
                      shift = series.data.length > 100; // shift if the series is
                                                        // longer than 20

                    // add the point
                    chartus.series[0].addPoint(point, true, shift);
                  },
                  cache: false
                });
              }, 10000);
            }
          }
        },

        rangeSelector: {
          buttons: [{
            type: 'hour',
            count: 1,
            text: '1h'
          }, {
            type: 'day',
            count: 1,
            text: '1D'
          }, {
            type: 'all',
            count: 1,
            text: 'All'
          }],
          selected: 2,
          inputEnabled: true
      },


        title: {
          text: 'Forexus'
        },

        series: [{
          type: 'candlestick',
          name: 'Oanda',
          data : data,
          dataGrouping : {
            enable: false
          }
        }]
      });
    })
  }
});
