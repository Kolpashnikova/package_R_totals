HTMLWidgets.widget({

  name: 'totals',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        var newSvg = document.getElementById(el.id);
        newSvg.innerHTML += '<div id="glassContainer" style: "height: 80vh; margin: auto;"><div class="glassWrapper"></div></div>';
          var totals = x.data;

            var act = x.act;

            var colors = x.colors;

            var s = "";
            if(colors != null){
              if (Object.keys(totals).length > colors.length) {
                newSvg.innerHTML = "Not enough colors entered";
                throw new Error("Not enough colors entered");
              }
            }

            if (Object.keys(totals).length > act.length) {
                newSvg.innerHTML = "Not enough activity codes entered";
                throw new Error("Not enough activity codes entered");
            }

            for (var k = 1; k <= Object.keys(totals).length; k++) {
                s += '<div class="glass-' + String(k) +'"><svg id="fillgauge' + String(k) + '" style="width: 100%; height:100%"></svg></div>'
            }

            var div = document.getElementsByClassName("glassWrapper");
            div[0].innerHTML += s;

            if(Object.keys(totals).length % 3 ==0){
                var glass = document.getElementsByClassName("glass-1");
                glass[0].style.gridRow = "1";
            } else if(Object.keys(totals).length % 2 ==0){
                var glass = document.getElementsByClassName("glass-1");
                glass[0].style.gridRow = "1";
                var rowHeight = 80/(Object.keys(totals).length/2);
                div[0].style.gridTemplateColumns = "repeat(2, 50vh)";
                div[0].style.gridTemplateRows = "repeat(auto-fill, " + String(rowHeight) + "vh)";
            } else if((Object.keys(totals).length + 2) % 3 ==0){
                var glass = document.getElementsByClassName("glass-1");
                glass[0].style.gridRow = "1/4";
            }


            var max = totals[String(1)];

            for (var i = 2; i <= Object.keys(totals).length; i++) {
                if (totals[String(i)] > max) max = totals[String(i)];
            }

            var gauges = new Array(Object.keys(totals).length);
            for (let j = 1; j <= Object.keys(totals).length; j++) {
                gauges[j] = {"config": liquidFillGaugeDefaultSettings(),
                "gauge": null}
                gauges[j]["config"].maxValue = 100;
                gauges[j]["config"].minValue = 0;
                if(colors == null){
                    gauges[j]["config"].circleColor = "#" + fullColorHex(colorsNeededNumbers(j)[0]);
                    gauges[j]["config"].waveColor = "#" + fullColorHex(colorsNeededNumbers(j)[0]);
                    gauges[j]["config"].textColor = "#" + fullColorHex(colorsNeededNumbers(j)[2]);
                    gauges[j]["config"].waveTextColor = "#" + fullColorHex(colorsNeededNumbers(j)[1]);
                } else {
                    gauges[j]["config"].circleColor = colors[j-1][0];
                    gauges[j]["config"].waveColor = colors[j-1][0];
                    gauges[j]["config"].textColor = colors[j-1][2];
                    gauges[j]["config"].waveTextColor = colors[j-1][1];
                }
            }


            for (let j = 1; j <= Object.keys(totals).length; j++) {
                gauges[j]["gauge"] = loadLiquidFillGauge("fillgauge" + String(j), totals[String(j)], gauges[j]["config"], act[j-1]);
            }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
