function initializeConfigTab(elements) {
  let container = document.getElementById('config_values');
  for (let config in elements) {
    let new_line = document.createElement("p");
    let nice_name = elements[config].nice_name;
    new_line.innerHTML = nice_name;
    let button_line = document.createElement("div");
    button_line.id = config;
    button_line.className = "radio-toolbar";
    for (let key in elements[config].values) {
      let button = document.createElement("input");
      button.type = "radio";
      button.id = nice_name + "_" + key;
      button.name = nice_name;
      let label = document.createElement("label");
      label.htmlFor = button.id;
      label.innerHTML = elements[config].values[key];
      button.value = key;
      button_line.appendChild(button);
      button_line.appendChild(label);
    }
    new_line.appendChild(button_line);
    container.appendChild(new_line);
  }
  setInterval(getCurrentConfig, 5000);
}


google.charts.load('current', {'packages':['gauge']});
google.charts.setOnLoadCallback(drawPMChart);
google.charts.setOnLoadCallback(drawWeatherCharts);

function openTab(evt, tabName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

function getConfigValues() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      initializeConfigTab(JSON.parse(this.responseText));
    }
  };
  xhttp.open("GET", "/get_config_options", true);
  xhttp.send();
}

function populateData(config_data) {
  let parsed_response = JSON.parse(config_data);
  let parsed_data = parsed_response.data;
  document.getElementById("data_temp").innerHTML = parsed_data.temp.toFixed(1);
  document.getElementById("data_hum").innerHTML = parsed_data.hum.toFixed(1);
  document.getElementById("data_press").innerHTML = parsed_data.bmp.toFixed(0);
  document.getElementById("data_pm1").innerHTML = parsed_data.pm1;
  document.getElementById("data_pm25").innerHTML = parsed_data.pm25;
  document.getElementById("data_pm10").innerHTML = parsed_data.pm10;
  document.getElementById("last_update").innerHTML = parsed_response.last_update;
  document.getElementById("last_update_age").innerHTML = parsed_response.age;
  let update_age_box = document.getElementById("update_age_box");
  if (parsed_response.age < 90) {
    update_age_box.style.backgroundColor = "#0F9D58";
  } else if (parsed_response.age < 900) {
    update_age_box.style.backgroundColor = "#F4B400";
  } else {
    update_age_box.style.backgroundColor = "#DB4437";
  }

  pm1_data.setValue(0, 1, parsed_data.pm1);
  pm25_data.setValue(0, 1, parsed_data.pm25);
  pm10_data.setValue(0, 1, parsed_data.pm10);
  pm1_chart.draw(pm1_data, pm_chart_options);
  pm25_chart.draw(pm25_data, pm_chart_options);
  pm10_chart.draw(pm10_data, pm_chart_options);

  humidity_data.setValue(0,1, parsed_data.hum.toFixed(1));
  humidity_chart.draw(humidity_data, humidity_chart_options);
  temp_data.setValue(0, 1, parsed_data.temp.toFixed(1));
  temp_chart.draw(temp_data, temp_chart_options);
  pressure_data.setValue(0,1, parsed_data.bmp.toFixed(0));
  pressure_chart.draw(pressure_data, pressure_chart_options);
}

function getCurrentData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      populateData(this.responseText);
    }
  };
  xhttp.open("GET", "/current_data", true);
  xhttp.send();
}

function populateConfig(config_data) {
  for (let key in config_data) {
    let button_line = document.getElementById(key);
    for (let i = 0; i < button_line.childElementCount; i++) {
      if (button_line.children[i].value == config_data[key][0]) {
        button_line.children[i].checked = true;
      }
    }
  }
}

function getCurrentConfig() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      populateConfig(JSON.parse(this.responseText));
    }
  };
  xhttp.open("GET", "/current_config", true);
  xhttp.send();
}

var pm1_data;
var pm25_data;
var pm10_data;
var temp_data;
var humidity_data;
var pressure_data;

var pm_chart_options;
var temp_chart_options;
var humidity_chart_options;
var pressure_chart_options;


var pm1_chart;
var pm25_chart;
var pm10_chart;
var temp_chart;
var humidity_chart;
var pressure_chart;

function drawPMChart() {
  pm1_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['PM 1.0 (ug/m3)', 0],
  ]);
  pm25_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['PM 2.5 (ug/m3)', 0],
  ]);
  pm10_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['PM 10 (ug/m3)', 0],
  ]);

  pm_chart_options = {
     redFrom: 200, redTo: 500,
     redColor: '#DB4437', // Google red
     yellowFrom:50, yellowTo: 200,
     yellowColor: '#F4B400', // Google yellow
     greenFrom:0, greenTo:200,
     greenColor: '#0F9D58', // Google green
     minorTicks: 10,
     majorTicks: ['', '', '', '', '', ''],
     max: 500,
     min: 0,
  };

  pm1_chart = new google.visualization.Gauge(document.getElementById('pm1_chart'));
  pm1_chart.draw(pm1_data, pm_chart_options);
  pm25_chart = new google.visualization.Gauge(document.getElementById('pm25_chart'));
  pm25_chart.draw(pm25_data, pm_chart_options);
  pm10_chart = new google.visualization.Gauge(document.getElementById('pm10_chart'));
  pm10_chart.draw(pm10_data, pm_chart_options);
};

function drawWeatherCharts() {
  temp_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['Temp (C)', 0]
  ]);

  humidity_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['Humidity (%)', 0]
  ]);

  pressure_data = google.visualization.arrayToDataTable([
     ['Label', 'Value'],
     ['Pressure (mbar)', 0]
  ]);


  temp_chart_options = {
     redFrom: 30, redTo: 40,
     greenFrom: -10, greenTo: 10,
     greenColor: '#4285F4', // Google blue
     minorTicks: 5,
     majorTicks: [-10,0,10,20,30,40],
     max: 40,
     min: -10,
  };

  humidity_chart_options = {
     redFrom: 0, redTo: 35,
     greenFrom: 65, greenTo: 100,
     greenColor: '#0F9D58', // Google green
     minorTicks: 10,
     majorTicks: ['','','','','', ''],
     max: 100,
     min: 0,
  };

  pressure_chart_options = {
     redFrom: 923, redTo: 973,
     redColor: 'white',
     yellowFrom: 974, yellowTo: 1053,
     yellowColor: '#0F9D58', // Google green
     greenFrom: 1053, greenTo: 1103,
     greenColor: 'white',
     minorTicks: 20,
     majorTicks: [],
     max: 1103,
     min: 923,
  };

  temp_chart = new google.visualization.Gauge(document.getElementById('temp_chart'));
  temp_chart.draw(temp_data, temp_chart_options);
  humidity_chart = new google.visualization.Gauge(document.getElementById('humidity_chart'));
  humidity_chart.draw(humidity_data, humidity_chart_options);
  pressure_chart = new google.visualization.Gauge(document.getElementById('pressure_chart'));
  pressure_chart.draw(pressure_data, pressure_chart_options);
};

