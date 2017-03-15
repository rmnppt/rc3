HTMLWidgets.widget({

  name: 'C3BarChart',

  type: 'output',

  factory: function(el, width, height) {

    // create an empty chart
    var chart = null;

    return {

      renderValue: function(x) {

        // if the chart does not exist, create it via c3.generate
        if(chart===null){

            keys = _.keys(x.dataset);

          	chart = c3.generate({
          		bindto: el,
          		data: {
          			json: [],
          			keys: {
          				value: keys
          			},
          			type: 'bar',
        		  },
        		  bar: {
                width: {
                  ratio: x.ratio
                }
        		  }
           });
        }

        // at this stage the chart always exists
        // get difference in keys
        var old_keys = _.keys(chart.x());
        var new_keys = _.keys(x.dataset);
        var diff     = _.difference(old_keys,new_keys);

        // update the data and colors
        chart.load({
          json  : x.dataset,
          colors: x.colors,

          // unload data that we don't need anymore
          unload: diff
        });
      }
    };
  }
});
