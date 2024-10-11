package edu.sm.controller;


import edu.sm.dto.Item;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime(){
        JSONObject obj = new JSONObject();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime",formatter.format(now));
        return obj;
    }
    @RequestMapping("/getprank")
    public Object prank(){
        JSONArray arr = new JSONArray();
        Random random = new Random();
        for (int i = 10; i < 16; i++) {
            JSONObject obj = new JSONObject();
            obj.put("id", i-9);
            obj.put("name", "아이폰"+i);
            obj.put("price", random.nextInt(10000, 10000000)+1);
            arr.add(obj);
        }
        return arr.get(random.nextInt(arr.size()));

    }
}
