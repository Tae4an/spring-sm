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
    @RequestMapping("/signupimpl")
    public String signupimpl(
            Model model,
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            @RequestParam("pwd_confirm") String pwd_confirm,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam(value = "birthdate", required = false) String birthdate,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "interests", required = false) String interests
    ) {
        log.info("ID: {}", id);
        log.info("PWD: {}", pwd);
        log.info("PWD_CONFIRM: {}", pwd_confirm);
        log.info("NAME: {}", name);
        log.info("EMAIL: {}", email);
        log.info("BIRTHDATE: {}", birthdate);
        log.info("PHONE: {}", phone);
        log.info("GENDER: {}", gender);
        log.info("INTERESTS: {}", interests);

        return "index";
    }
}
