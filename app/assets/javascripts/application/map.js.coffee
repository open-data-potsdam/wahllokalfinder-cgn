$ ->
  if $('#map').length

    normal = L.icon({
        iconUrl: '/assets/marker1.png',
        iconSize: [15, 15],
        popupAnchor: [0, -15],
    })

    wheel_chair = L.icon({
        iconUrl: '/assets/marker2.png',
        iconSize: [17, 17],
        popupAnchor: [0, -15],
    })

    wheelchair_stations = $("#map").data("wheelchairStations")
    non_wheel_chair_stations = $("#map").data("withoutWheelchairStations")
    map = L.map "map"

    L.tileLayer('http://{s}.tile.cloudmade.com/1ba1e2b7e9634ec099cf42a4edde6c51/107053/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a></a>',
        maxZoom: 16
    }).addTo(map)

    points = []

    for result in wheelchair_stations
      marker = L.marker(result.geo, { icon: wheel_chair }).addTo(map)
      marker.bindPopup("<img src='/assets/rollstuhl.png' style='margin-right:10px;width:26px;float:left'>#{result.name}")
      points.push result.geo

    for result in non_wheel_chair_stations
      marker = L.marker(result.geo, { icon: normal }).addTo(map)
      marker.bindPopup("#{result.name}")
      points.push result.geo

    map.fitBounds(points)
    # map.setView([51.505, -0.09], 13)
    #map.fitWorld()
