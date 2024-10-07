package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InlineController {
    @RequestMapping("/inline")
    public String inline(){
        return "inline";
    }
}
