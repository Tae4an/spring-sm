
package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cust")
public class CustController {

    String dir = "cust/";
    final CustService custService;

    @RequestMapping("")
    public String cust(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(
            Model model,
            @RequestParam("id") String id
    ) throws Exception {
        CustDto custDto = custService.get(id);
        model.addAttribute("cust", custDto);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/update_impl")
    public String updateImpl(
            Model model,
            CustDto custDto
    ) throws Exception {
        custService.modify(custDto);
        return "redirect:/cust/detail?id=" + custDto.getCustId();
    }

    @RequestMapping("/delete_impl")
    public String deleteImpl(Model model, @RequestParam("id") String id
    ) throws Exception {
        custService.delete(id);
        return "redirect:/cust/get";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<CustDto> custs = custService.get();

        model.addAttribute("custs", custs);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "page");
        return "index";
    }

    @RequestMapping("/page")
    public String page(
            Model model,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo
    ) throws Exception {
        PageInfo<CustDto> p;
        p = new PageInfo<>(custService.getPage(pageNo), 5); // 5:하단 네비게이션 개수

        model.addAttribute("custPage", p);
        model.addAttribute("target", "cust");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "page");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "search");
        return "index";
    }

    @RequestMapping("/find_impl")
    public String findImpl(
            Model model,
            Search search,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo

    ) throws Exception {

        PageInfo<CustDto> p;
        p = new PageInfo<>(custService.getFindPage(pageNo,search), 3); // 3:하단 네비게이션 개수

        log.info("============================================="+search.toString());
        model.addAttribute("custPage", p);
        model.addAttribute("search", search);
        model.addAttribute("target", "cust");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "search");
        return "index";
    }

}