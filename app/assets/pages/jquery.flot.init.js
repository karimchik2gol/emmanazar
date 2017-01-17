var info = [];

Date.prototype.yyyymmdd = function() {
	var mm = this.getMonth() + 1; // getMonth() is zero-based
	var dd = this.getDate();

	return [this.getFullYear(),
	        (mm>9 ? '' : '0') + mm,
	        (dd>9 ? '' : '0') + dd
       ].join('/');
};

function get_nums() {
	var arr = [], ticks = [];
	i = 0;
	$.each($(".datas").data("cont"), function(index, value){
	  var cur = $(this);
	  created_at = new Date(cur[0]["created_at"]).yyyymmdd();
	  info.push({"order_count": cur.length, "date": index})
	  arr.push([i, cur.length]);
	  ticks.push([i, index])
	  i++;
	})
	return [arr, ticks];
}

jQuery(document).ready(function() {
	! function($) {
    "use strict";

    var FlotChart = function() {
      this.$body = $("body")
      this.$realData = []
    };
    //creates plot graph
    FlotChart.prototype.createPlotGraph = function(selector, data1, ticks, labels, colors, borderColor, bgColor) {
      //shows tooltip
      $.plot($(selector), [{
        data : data1,
        label : labels[0],
        color : colors[0]
      }], {
        series : {
          lines : {
            show : true,
            fill : true,
            lineWidth : 3,
            fillColor : {
              colors : [{
                opacity : 0.4
              }, {
                opacity : 0.4
              }]
            }
          },
          points : {
            show : false
          },
          shadowSize : 0
        },

        grid : {
          hoverable : true,
          clickable : true,
          borderColor : borderColor,
          tickColor : "#f9f9f9",
          borderWidth : 1,
          labelMargin : 10,
          backgroundColor : bgColor
        },
        legend : {
          position : "ne",
          margin : [0, -24],
          noColumns : 0,
          labelBoxBorderColor : null,
          labelFormatter : function(label, series) {
            // just add some space to labes
            return '' + label + '&nbsp;&nbsp;';
          },
          width : 30,
          height : 2
        },
        yaxis : {
          tickColor : 'transparent',
          tickLength: 0,
          font : {
            color : '#bdbdbd'
          }
        },
        xaxis : {
          ticks: ticks,
          tickColor : '#transparent',
          tickLength: 0,
          font : {
            color : '#bdbdbd'
          }
        },
        tooltip : true,
        tooltipOpts : {
          content : function(label, xval, yval, flotItem){
            var current = info[xval];
            return "Orders: " + current["order_count"] +"<br>Date: " + current["date"]
          },
          shifts : {
            x : -60,
            y : 25
          },
          defaultTheme : false
        }
      });
    },
    //end plot graph
    //initializing various charts and components
    FlotChart.prototype.init = function() {
      //plot graph data
      var result = get_nums();
      var uploads = result[0];
      var ticks = result[1];
      var plabels = ["Info", "Orders per day"];
      var pcolors = ['#188ae2', '#10c469'];
      var borderColor = 'transparent';
      var bgColor = 'transparent';
      this.createPlotGraph("#order-stats", uploads, ticks, plabels, pcolors, borderColor, bgColor);
    },

    //init flotchart
    $.FlotChart = new FlotChart, $.FlotChart.Constructor =
    FlotChart

  }(window.jQuery),

  //initializing flotchart
  function($) {
    "use strict";
    $.FlotChart.init()
  }(window.jQuery);
});