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
    let map2 = {
        init:function(){
            this.makemap(37.554472, 126.980841,'남산','s1.jpg',100);

            $('#sbtn').click(()=>{
                // 37.554472, 126.980841
                this.makemap(37.554472, 126.980841,'남산','s1.jpg',100);
            });
            $('#bbtn').click(()=>{
                // 35.175109, 129.175474
                this.makemap(35.175109, 129.175474,'해운대','s2.jpg',200);
            });
            $('#jbtn').click(()=>{
                // 33.254564, 126.560944
                this.makemap(33.254564, 126.560944,'서귀포','s3.jpg',300);
            });
        },
        makemap:function(lat,lng,title, img, target){
            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 7
            };
            let map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(lat,lng);
            let marker = new kakao.maps.Marker({
                map:map,
                position: markerPosition
            });

            let iwContent = '<p>'+title+'</p>';
            iwContent += '<img style="width:150px;" src="<c:url value="/img/'+img+'"/> ">';
            let iwPosition = new kakao.maps.LatLng(lat,lng); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
            kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(marker,'click',clickHandler(target));

            function clickHandler(target){
                return function(){

                    location.href='<c:url value="/map/go?target='+target+'"/> ';
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
            this.markers(target, map);
        },
        markers:function(target, map){
            // lat, lng, title, img, code
            let datas = [];
            if(target == 100){
                datas = [
                    {lat:37.564472, lng:126.990841, title:'조림', img:'food1.jpg', code:101},
                    {lat:37.544472, lng:126.970841, title:'조림2', img:'food2.jpg', code:102},
                    {lat:37.564472, lng:126.970841, title:'들기름', img:'food3.jpg', code:103}
                ];
            }else if(target == 200){
                datas = [
                    {lat:35.175109, lng:129.195474, title:'돼지 국밥', img:'food4.jpg', code:104},
                    {lat:35.155109, lng:129.175474, title:'조림2', img:'food5.jpg', code:105},
                    {lat:35.175109, lng:129.175474, title:'들기름', img:'food6.jpg', code:106}
                ];
            }else{
                datas = [
                    {lat:33.254564, lng: 126.580944, title:'흑돼지', img:'food7.jpg', code:107},
                    {lat:33.274564, lng: 126.560944, title:'고기국수', img:'food8.jpg', code:108},
                    {lat:33.254564, lng: 126.560944, title:'연돈', img:'food9.jpg', code:109}
                ];
            }
            let imgsrc = '<c:url value="/img/img_5.png"/> ';


            $(datas).each(function(index, item){
                let imgsize = new kakao.maps.Size(30,30);
                let markerimg = new kakao.maps.MarkerImage(imgsrc, imgsize);
                let markerposition = new kakao.maps.LatLng(item.lat, item.lng);
                let marker = new kakao.maps.Marker({
                    map: map,
                    position:markerposition,
                    image:markerimg
                });
                let iwContent = '<p>'+item.title+'</p>';
                iwContent += '<img style="width:150px;" src="<c:url value="/img/'+item.img+'"/> ">';
                let iwPosition = new kakao.maps.LatLng(item.lat,item.lng); //인포윈도우 표시 위치입니다
                let infowindow = new kakao.maps.InfoWindow({
                    position : iwPosition,
                    content : iwContent
                });
                kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
                kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
                kakao.maps.event.addListener(marker,'click',clickHandler(item.code));

                function clickHandler(target){
                    return function(){

                        location.href='<c:url value="/map/go?target='+target+'"/> ';
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
            });

        }
    };

    $(function(){
        map2.init();
    });
</script>
<div class="col-sm-9">

    <h2>Map5 Page</h2>
    <button id="sbtn">Seoul</button>
    <button id="bbtn">Busan</button>
    <button id="jbtn">Jeju</button>
    <div id="map"></div>

</div>