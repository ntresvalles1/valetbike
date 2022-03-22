console.log("in map.js")
var map = L.map('map').setView([42.299387, -72.565882], 13); //13


L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic3NjaGF0emtpbWNjbGFpbiIsImEiOiJjbDB5bXI1bmUwaXJ5M2tydDgzbjhsZjU0In0.q1dLi4yZolCtGpnAOJLz-w', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'your.mapbox.access.token'
}).addTo(map);

//var marker = L.marker([42.299, -72.565]).addTo(map);



var greenIcon = L.icon({
    iconUrl: 'assets/stationmarker.png',
    //shadowUrl: 'leaf-shadow.png',

    iconSize:     [38, 95], // size of the icon
    //shadowSize:   [50, 64], // size of the shadow
    iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
    //shadowAnchor: [4, 62],  // the same for the shadow
    popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var marker = L.marker([42.299, -72.565], { icon: greenIcon }).addTo(map);

marker.bindPopup("<b>Station Name!</b><br>Docked Bikes: #").openPopup();