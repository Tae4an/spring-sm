package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {

    final CustService custService;

    @RequestMapping("/logout_impl")
    public String logoutImpl(HttpSession session, Model model) {
        if (session != null) {
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
    ) throws Exception {
        CustDto custDto = custService.get(id);

        if (custDto != null && custDto.getCustPwd().equals(pwd)) {
            session.setAttribute("loginid", custDto);
            return "redirect:/";
        } else {
            model.addAttribute("center", "login");
            model.addAttribute("error", "Invalid ID or Password");
            return "index";
        }
    }

    @RequestMapping("/register_impl")
    public String registerImpl(
            Model model,
            CustDto custDto,
            HttpSession session
    ) throws Exception {

        log.info("Cust Info:{}", custDto);
        custService.add(custDto);
        session.setAttribute("loginid", custDto);

        model.addAttribute("center", "registerok");
        model.addAttribute("id", custDto.getCustId());
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
