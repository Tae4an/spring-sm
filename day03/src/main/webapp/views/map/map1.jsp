<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #map{
        width:600px;
        height:500px;
        border:2px solid darkred;
    }
</style>

<script>
    let map1 = {
        map:null,
        marker:null,
        init:function(){
            this.makemap();
            $('#sbtn').click(()=>{
                this.goseoul();
            });
            $('#bbtn').click(()=>{
                this.gobusan();
            });
            $('#jbtn').click(()=>{
                this.gojeju();
            });
        },
        makemap:function(){

            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(36.799165, 127.074981),
                level: 5
            };
            this.map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(36.799165, 127.074981);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '<div>선문대학교</div><img  src="<c:url value="/img/sm.jpg"/> "/>';
            let iwPosition = new kakao.maps.LatLng(36.799165, 127.074981); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('http://sunmoon.ac.kr'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        goseoul:function(){
            this.marker.setMap(null);

            // 37.554472, 126.980841
            var moveLatLon = new kakao.maps.LatLng(37.554472, 126.980841);
            this.map.panTo(moveLatLon);
            var markerPosition  = new kakao.maps.LatLng(37.554472, 126.980841);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });
            this.marker.setMap(this.map);

            let iwContent = '<div>롯데월드</div><img  src="<c:url value="/img/lt.jpg"/> "/>';
            let iwPosition = new kakao.maps.LatLng(37.554472, 126.980841); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('<c:url value="/map/map2"/>'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        gobusan:function(){
            this.marker.setMap(null);

            // 35.175109, 129.175474
            var moveLatLon = new kakao.maps.LatLng(35.175109, 129.175474);
            this.map.panTo(moveLatLon);
            this.marker = null;
            var markerPosition  = new kakao.maps.LatLng(35.175109, 129.175474);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);


            let iwContent = '<div>광안대교</div><img src="<c:url value="/img/bu.jpg"/> "/>';
            let iwPosition = new kakao.maps.LatLng(35.175109, 129.175474); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('<c:url value="/map/map3"/>'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        gojeju:function(){
            this.marker.setMap(null);
            // 33.254564, 126.560944
            var moveLatLon = new kakao.maps.LatLng(33.254564, 126.560944);
            this.map.panTo(moveLatLon);
            this.marker = null;
            var markerPosition  = new kakao.maps.LatLng(33.254564, 126.560944);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '<div>우도</div><img  src="<c:url value="/img/udo.jpg"/> ">';
            let iwPosition = new kakao.maps.LatLng(33.254564, 126.560944); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('<c:url value="/map/map3"/>'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        }
    };
    $(function(){
        map1.init();
    });
</script>

<div class="col-sm-9">

    <h2>Map1 Page</h2>
    <button id="sbtn">Seoul</button>
    <button id="bbtn">Busan</button>
    <button id="jbtn">Jeju</button>
    <div id="map"></div>

</div>