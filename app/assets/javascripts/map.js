

$(function () {


    function initializeMap(data) {

      var stations = $.parseJSON(data);
      //var geoJSON = L.geoJSON(stations)
      var map = L.map('map').setView([42.299387, -72.565882], 13); //13

    

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic3NjaGF0emtpbWNjbGFpbiIsImEiOiJjbDB5bXI1bmUwaXJ5M2tydDgzbjhsZjU0In0.q1dLi4yZolCtGpnAOJLz-w', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: 'your.mapbox.access.token'
    }).addTo(map);

    var stationIcon = L.icon({
        className: 'custom-div-icon',
        iconUrl: 'assets/marker-icon.png',
        shadowUrl: 'assets/marker-shadow.png',
        //iconUrl: 'assets/bikeicon.png',
        //html: "<div style='background-color:#c30b82;' class='marker-pin'></div><i class='material-icons'>weekend</i>",
        iconSize:     [20, 33], // size of the icon
        iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
        popupAnchor:  [-3, -76], // point from which the popup should open relative to the iconAnchor
    });

    

    for (var i=0; i<stations["length"]; i+=1){
        var s = stations[i.toString()];
        if (s["geometry"]["coordinates"][0] != null && s["geometry"]["coordinates"][1] != null){
            console.log(s["properties"]["name"]);
            var stationmarker = L.marker([s["geometry"]["coordinates"][0], s["geometry"]["coordinates"][1]], { icon: stationIcon }).addTo(map);
            //stationmarker.bindPopup(s["properties"]["name"]).openPopup();
            //"<b>Hello world!</b><br>I am a popup."
            var message = "<b>" + s["properties"]["name"] + "</b><br> Available Bikes: " + s["properties"]["docked_bikes"] + "/" + s["properties"]["docks"];
            stationmarker.bindPopup(message).openPopup();

            
        }
    }

    console.log(stations);
    console.log(stations["0"])
     
    };
  
    $.ajax({
      type: 'GET',
      url: 'stations/map',
      dataType: 'text',
      success: initializeMap
    });
  });
