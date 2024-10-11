package edu.sm.controller;


import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
}
