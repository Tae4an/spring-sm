<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #map {
        width: 600px;
        height: 500px;
        border: 2px solid darkred;
    }
</style>
<script>
    let map3 = {
        init: function () {
            this.makeMap(36.799165, 127.074981, '선문대학교', 'sm.jpg', 400);
            // 37.554472, 126.980841
            $('#sbtn').click(() => {
                this.makeMap(37.554472, 126.980841, '롯데월드', 'lt.jpg', 100);
            });
            // 35.175109, 129.175474
            $('#bbtn').click(() => {
                this.makeMap(35.175109, 129.175474, '광안대교', 'bu.jpg', 200);
            });
            // 33.254564, 126.560944
            $('#jbtn').click(() => {
                this.makeMap(33.254564, 126.560944, '우도', 'udo.jpg', 300);
            });
        },
        makeMap: function (lat,lng,title,img,target) {
            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 5
            };
            let map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(lat, lng);
            let marker = new kakao.maps.Marker({
                map: map,
                position: markerPosition,
                title: 'title'
            });

            let iwContent = '<p>'+title+'</p>';
            iwContent += '<img  src = "<c:url value="/img/'+img+'"/> ">';
            let iwPosition = new kakao.maps.LatLng(lat,lng);
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
            kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(marker,'click',clickHandler(target));

            function clickHandler(target){
                return function(){
                    location.href='<c:url value="/map/go?target='+target+'"/>';
                };
            };

            function overHandler(map,marker,infowindow){
                return function(){
                    infowindow.open(map, marker);
                };
            };
            function outHandler(infowindow){
                return function(){
                    infowindow.close();
                };
            };
        },
        markers:function (target){
            // lat, lng, title. img, code
            let datas = [];

        }
    };

    $(function () {
        map3.init();
    });
</script>
<div class="col-sm-9">

    <h2>Map3 Page</h2>
    <button id="sbtn">Seoul</button>
    <button id="bbtn">Busan</button>
    <button id="jbtn">Jeju</button>
    <div id="map"></div>
</div>