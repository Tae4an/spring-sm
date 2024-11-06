<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #map {
        width: 600px;
        height: 500px;
        border: 2px solid darkred;
        margin: 0 auto;
    }

    #wh, #wh2 {
        font-family: Arial, sans-serif;
        font-size: 18px;
        color: #333;
        line-height: 1.5;
        margin-bottom: 20px;
        padding: 10px;
        border-left: 4px solid #007bff;
        background-color: #f8f9fa;
    }
</style>
<script>
    let center = {
        map: null,
        marker: null,
        init: function () {
            $.ajax({
                url: '<c:url value="/weather"/>',
                success: (result) => {
                    let wtext = result.response.body.items.item[0].wfSv;
                    $('#wh').text(wtext);
                },
            });
            $.ajax({
                url: '<c:url value="/weather2"/>',
                success: (result) => {
                    let wtext = result.name + ' ' + result.weather[0].description;
                    $('#wh2').text(wtext);
                    let lat = result.coord.lat;
                    let lon = result.coord.lon;
                    this.makemap(lat, lon);
                },
            });
        },
        makemap: function (lat, lon) {

            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lon),
                level: 5
            };
            this.map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(lat, lon);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '';
            let iwPosition = new kakao.maps.LatLng(lat, lon); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            kakao.maps.event.addListener(this.marker, 'mouseover', overHandler(this.map, this.marker, infowindow));
            kakao.maps.event.addListener(this.marker, 'mouseout', outHandler(infowindow));

            function clickHandler(target) {
                return function () {
                    location.href = target;
                };
            };

            function overHandler(map, marker, infowindow) {
                return function () {
                    infowindow.open(map, marker);
                };
            };

            function outHandler(infowindow) {
                return function () {
                    infowindow.close();
                };
            };
        }

    };
    $(function () {
        center.init();
        center_websocket.init();
    });
</script>

<div class="col-sm-10" style="text-align: center">

    <h2>날씨</h2>
    <p id="wh"></p>
    <p id="wh2"></p>
    <div id="map"></div>


</div>