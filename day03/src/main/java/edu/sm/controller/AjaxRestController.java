package edu.sm.controller;


import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Marker;
import edu.sm.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AjaxRestController {
    final CustService custService;

    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime", formatter.format(now));
        return obj;
    }

    @RequestMapping("/getprank")
    public Object prank() {
        JSONArray arr = new JSONArray();
        Random random = new Random();
        for (int i = 10; i < 16; i++) {
            JSONObject obj = new JSONObject();
            obj.put("id", i - 9);
            obj.put("name", "아이폰" + i);
            obj.put("price", random.nextInt(10000, 10000000) + 1);
            arr.add(obj);
        }
        return arr.get(random.nextInt(arr.size()));

    }

    @RequestMapping("/check_id")
    public int getId(
            @RequestParam("r_id") String id
    ) throws Exception {
        CustDto custDto =custService.get(id);
        if (custDto != null) {
            return 1;
        }else {
            return 0;
        }
    }

    @RequestMapping("/get_markers")
    public Object getMarkers(
            @RequestParam("target") int target
    ) {
        log.info("Tager" + target);
        List<Marker> markers = new ArrayList<>();
        if (target == 100) {
            markers.add(new Marker(37.511209, 127.1298058, "조림", "food1.jpg", 101));
            markers.add(new Marker(37.531209, 127.1098058, "조림2", "food2.jpg", 102));
            markers.add(new Marker(37.511209, 127.1098058, "들기름", "food3.jpg", 103));
        } else if (target == 200) {
            markers.add(new Marker(35.154564, 129.124745, "돼지국밥", "food4.jpg", 201));
            markers.add(new Marker(35.124564, 129.114745, "메밀소바", "food5.jpg", 202));
            markers.add(new Marker(35.154564, 129.114745, "회", "food6.jpg", 203));
        } else {
            markers.add(new Marker(33.503939, 126.944134, "흑돼지", "food7.jpg", 301));
            markers.add(new Marker(33.523939, 126.954134, "고기국수", "food8.jpg", 302));
            markers.add(new Marker(33.503939, 126.954134, "연돈 돈까스", "food9.jpg", 303));
        }
        log.info(markers.toString());

        return markers;
    }

    @RequestMapping("/get_bike")
    public Object getBike() {
        JSONObject obj = new JSONObject();
        double lat = 36.799076;

        double lng = 127.075007;
        Random random = new Random();
        float num = random.nextFloat(1);
        lat += num/10;
        lng += num/10;
        obj.put("lat", lat);
        obj.put("lng", lng);
        return obj;
    }
}
