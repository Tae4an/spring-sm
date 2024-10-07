package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {

    @RequestMapping("/")
    public String main(Model model){
        log.info("MainController");

        // Database를 가져온다
        model.addAttribute("data", "Hello World");
        model.addAttribute("num", 1);
        return "index";
    }
}
