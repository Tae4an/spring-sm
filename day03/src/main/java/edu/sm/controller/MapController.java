package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {

    String dir = "map/";

    @RequestMapping("")
    public String map(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }

    @RequestMapping("/map1")
    public String map1(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"ajax1");
        return "index";
    }
    @RequestMapping("/map2")
    public String map2(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"ajax2");
        return "index";
    }
    @RequestMapping("/map3")
    public String ajax3(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"ajax3");
        return "index";
    }
}
