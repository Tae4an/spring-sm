package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {
    String dir = "customer/";

    @RequestMapping("/list")
    public String customerList(Model model) {
        log.info("customer/list !");
        model.addAttribute("center",dir + "list");
        return "index";
    }
    @RequestMapping("/registration")
    public String customerRegistration(Model model) {
        log.info("customer/Registration !");
        model.addAttribute("center",dir + "registration");
        return "index";
    }
    @RequestMapping("/update")
    public String customerUpdate(Model model) {
        log.info("customer/update !");
        model.addAttribute("center",dir + "update");
        return "index";
    }
    @RequestMapping("/delete")
    public String customerDelete(Model model) {
        log.info("customer/delete !");
        model.addAttribute("center",dir + "delete");
        return "index";
    }

}
