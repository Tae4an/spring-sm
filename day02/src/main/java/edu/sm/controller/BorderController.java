package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BorderController {

    @RequestMapping("/border")
    public String border(){
        return "border";
    }
}
