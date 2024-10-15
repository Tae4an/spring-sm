<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #map1 {
        width: 600px;
        height: 500px;
        border: 1px solid indianred;
    }

    #map2 {
        width: 400px;
        height: 300px;
        border: 1px solid indianred;
    }

    .map-container {
        display: flex;
        gap: 20px; /* map1과 map2 사이의 간격 */
    }
</style>
<script>
    let about = {
        marker: null,
        init: function () {
            this.map1();
            this.map2();
        },
        map1: function () {
            let mapContainer = document.getElementById('map1');
            let mapOption = {
                center: new kakao.maps.LatLng(36.799076, 127.075007),
                level: 7
            };

            let map = new kakao.maps.Map(mapContainer, mapOption);

            let mapTypeControl = new kakao.maps.MapTypeControl();

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition = new kakao.maps.LatLng(36.799076, 127.075007);

            let marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);


            setInterval(() => {
                $.ajax({
                    url: '<c:url value="/get_bike"/>',
                    success: (response)=> {
                    this.makeMarker(map, response.lat, response.lng);
                    }
                });

            }, 1000);
        },
        makeMarker: function (map, lat, lng) {

            if (this.marker != null) {
                this.marker.setMap(null);
            }
            let imgsrc = '<c:url value="/img/bike.jpg"/>';
            let imgsize = new kakao.maps.Size(30, 30);
            let markerimg = new kakao.maps.MarkerImage(imgsrc, imgsize);
            let markerposition = new kakao.maps.LatLng(lat, lng);
            this.marker = new kakao.maps.Marker({
                map: map,
                position: markerposition,
                image: markerimg
            });

        },
        map2: function () {
            let mapContainer = document.getElementById('map2');
            let mapOption = {
                center: new kakao.maps.LatLng(34.299195, 126.527765),
                level: 5
            };

            let map = new kakao.maps.Map(mapContainer, mapOption);

            let mapTypeControl = new kakao.maps.MapTypeControl();

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition = new kakao.maps.LatLng(34.299195, 126.527765);

            let marker = new kakao.maps.Marker({
                position: markerPosition
            });

            marker.setMap(map);
        }
    };
    $(function () {
        about.init();
    });
</script>
<div class="col-sm-10">

    <h2>About Page</h2>
    <div class="map-container">
        <div id="map1"></div>
        <div id="map2"></div>
    </div>

</div>