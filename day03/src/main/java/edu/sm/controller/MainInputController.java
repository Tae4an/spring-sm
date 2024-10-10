package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainInputController {

    @RequestMapping("/loginimpl")
    public String loginimpl(
            Model model,
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd
    ) {

        log.info("ID:{}", id);
        log.info("PWD:{}", pwd);

        return "index";
    }
}
