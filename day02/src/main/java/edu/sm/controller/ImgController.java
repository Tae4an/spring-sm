package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImgController {
    @RequestMapping("/img")
    public String img(){
        return "img";
    }
}
