
package edu.sm.controller;

import edu.sm.app.dto.CustDto;
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
        List<CustDto> custs = new ArrayList<>();
        custs.add(CustDto.builder().custId("id01").custPwd("pwd01").custName("james01").build());
        custs.add(CustDto.builder().custId("id02").custPwd("pwd02").custName("james02").build());
        custs.add(CustDto.builder().custId("id03").custPwd("pwd03").custName("james03").build());
        custs.add(CustDto.builder().custId("id04").custPwd("pwd04").custName("james04").build());
        custs.add(CustDto.builder().custId("id05").custPwd("pwd05").custName("james05").build());

        model.addAttribute("custs",custs);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
}