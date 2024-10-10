package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
    String dir = "board/";

    @RequestMapping("/list")
    public String boardList(Model model) {
        log.info("board/list !");
        model.addAttribute("center",dir + "list");
        return "index";
    }
    @RequestMapping("/registration")
    public String boardRegistration(Model model) {
        log.info("board/Registration !");
        model.addAttribute("center",dir + "registration");
        return "index";
    }
    @RequestMapping("/update")
    public String boardUpdate(Model model) {
        log.info("board/update !");
        model.addAttribute("center",dir + "update");
        return "index";
    }
    @RequestMapping("/delete")
    public String boardDelete(Model model) {
        log.info("board/delete !");
        model.addAttribute("center",dir + "delete");
        return "index";
    }
}
