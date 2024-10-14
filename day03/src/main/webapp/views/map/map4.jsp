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
    let map4 = {
        init: function () {
            this.makeMap(36.799165, 127.074981, '선문대학교', 'sm.jpg', 400);

            // 검색 버튼에 이벤트 리스너 추가
            $('#searchBtn').click(() => {
                const keyword = $('#keywordInput').val();
                this.searchKeyword(keyword);
            });
        },
        makeMap: function (lat, lng, title, img, target) {
            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 10
            };
            this.map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(lat, lng);
            let marker = new kakao.maps.Marker({
                map: this.map,
                position: markerPosition,
                title: 'title'
            });

            let iwContent = '<p>' + title + '</p>';
            iwContent += '<img src="<c:url value="/img/'+img+'"/>">';
            let iwPosition = new kakao.maps.LatLng(lat, lng);
            this.infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            kakao.maps.event.addListener(marker, 'mouseover', this.overHandler(this.map, marker, this.infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', this.outHandler(this.infowindow));
            kakao.maps.event.addListener(marker, 'click', this.clickHandler(target));
        },
        searchKeyword: function(keyword) {
            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }

            // 장소 검색 객체를 생성합니다
            let ps = new kakao.maps.services.Places();

            // 키워드로 장소를 검색합니다
            ps.keywordSearch(keyword, this.placesSearchCB.bind(this));
        },
        placesSearchCB: function(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    this.displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                this.map.setBounds(bounds);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                alert('검색 결과가 존재하지 않습니다.');
            } else if (status === kakao.maps.services.Status.ERROR) {
                alert('검색 결과 중 오류가 발생했습니다.');
            }
        },
        displayMarker: function(place) {
            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: this.map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });

            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', () => {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                this.infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                this.infowindow.open(this.map, marker);
            });
        },
        overHandler: function(map, marker, infowindow) {
            return function () {
                infowindow.open(map, marker);
            };
        },
        outHandler: function(infowindow) {
            return function () {
                infowindow.close();
            };
        },
        clickHandler: function(target) {
            return function () {
                location.href = '<c:url value="/map/go?target='+target+'"/>';
            };
        },
        markers: function (target) {
            // lat, lng, title. img, code
            let datas = [];
        }
    };

    $(function () {
        map4.init();
    });
</script>
<div class="col-sm-9">
    <h2>Map4 Page</h2>
    <input type="text" id="keywordInput" placeholder="검색할 키워드를 입력하세요">
    <button id="searchBtn">검색</button>
    <div id="map"></div>
</div>