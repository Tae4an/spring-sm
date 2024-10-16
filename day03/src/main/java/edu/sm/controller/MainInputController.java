package edu.sm.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainInputController {

    @RequestMapping("/logout_impl")
    public String logoutImpl(HttpSession session, Model model) {
        if(session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/login_impl")
    public String loginImpl(
            Model model,
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            HttpSession session
    ) {

        log.info("ID:{}", id);
        log.info("PWD:{}", pwd);

        if (id.equals("aaa") && pwd.equals("111")){
            session.setAttribute("loginid", id);
            return "redirect:/";
        }else {
            model.addAttribute("center","login");
            model.addAttribute("error", "Invalid ID or Password");
            return "index";
        }
    }
    @RequestMapping("/register_impl")
    public String registerImpl(
            Model model,
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            @RequestParam("name") String name,
            HttpSession session
    ) {

        log.info("ID:{}", id);
        log.info("PWD:{}", pwd);
        log.info("NAME:{}", name);

        session.setAttribute("loginid", id);

        model.addAttribute("center","registerok");
        model.addAttribute("id", id);
        return "index";
    }
    @RequestMapping("/signup_impl")
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
