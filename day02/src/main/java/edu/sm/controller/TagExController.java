package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TagExController {
    @RequestMapping("/tagEx")
    public String tagEx(){
        return "tagEx";
    }
}
