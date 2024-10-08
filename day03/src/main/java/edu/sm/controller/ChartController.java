package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/chart")
public class ChartController {

    String dir = "chart/";

    @RequestMapping("")
    public String chart(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/chart1")
    public String chart1(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"chart1");
        return "index";
    }
    @RequestMapping("/chart2")
    public String chart2(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"chart2");
        return "index";
    }
    @RequestMapping("/chart3")
    public String chart3(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"chart3");
        return "index";
    }
}