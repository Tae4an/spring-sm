package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/js")
public class JsController {

    String dir = "js/";

    @RequestMapping("")
    public String js(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/js1")
    public String js1(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js1");
        return "index";
    }

    @RequestMapping("/js2")
    public String js2(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js2");
        return "index";
    }

    @RequestMapping("/js3")
    public String js3(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js3");
        return "index";
    }

    @RequestMapping("/js4")
    public String j4(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js4");
        return "index";
    }

    @RequestMapping("/js5")
    public String js5(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js5");
        return "index";
    }
    @RequestMapping("/js6")
    public String js6(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "js6");
        return "index";
    }
}