package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
    String dir = "product/";

    @RequestMapping("/list")
    public String productList(Model model) {
        log.info("product/list !");
        model.addAttribute("center",dir + "list");
        return "index";
    }
    @RequestMapping("/registration")
    public String productRegistration(Model model) {
        log.info("product/Registration !");
        model.addAttribute("center",dir + "registration");
        return "index";
    }
    @RequestMapping("/update")
    public String productUpdate(Model model) {
        log.info("product/update !");
        model.addAttribute("center",dir + "update");
        return "index";
    }
    @RequestMapping("/delete")
    public String productDelete(Model model) {
        log.info("product/delete !");
        model.addAttribute("center",dir + "delete");
        return "index";
    }
}
