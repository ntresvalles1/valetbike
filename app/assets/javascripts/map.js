var map = L.map('map').setView([51.505, -0.09], 13);

googleLayer = L.Google("ROADMAP")
map.addLayer(googleLayer)