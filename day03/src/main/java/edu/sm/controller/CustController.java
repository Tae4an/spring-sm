
package edu.sm.controller;

import edu.sm.app.dto.Cust;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/cust")
public class CustController {

    String dir = "cust/";

    @RequestMapping("")
    public String cust(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model) {
        List<Cust> custs = new ArrayList<>();
        custs.add(Cust.builder().id("id01").pwd("pwd01").name("james01").build());
        custs.add(Cust.builder().id("id02").pwd("pwd02").name("james02").build());
        custs.add(Cust.builder().id("id03").pwd("pwd03").name("james03").build());
        custs.add(Cust.builder().id("id04").pwd("pwd04").name("james04").build());
        custs.add(Cust.builder().id("id05").pwd("pwd05").name("james05").build());

        model.addAttribute("custs",custs);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
}