package edu.sm.controller;


import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CartService;
import edu.sm.app.service.ItemService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
@Slf4j
public class CartController {

    private final CartService cartService;
    private final ItemService itemService;
    String dir = "cart/";

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/add_impl")
    public String addimpl(Model model, CartDto cartDto, HttpSession session) throws Exception {
        // 세션에서 로그인된 사용자 ID 가져오기
        CustDto cust = (CustDto) session.getAttribute("loginid");

        if (cust == null) return "redirect:/login"; // 로그인 페이지로 리다이렉트

        // CartDto에 로그인된 사용자 ID 설정
        cartDto.setCustId(cust.getCustId());

        // 데이터 입력
        cartService.add(cartDto);
        return "redirect:/item/get";
    }

    @ResponseBody
    @RequestMapping("/update_quantity")
    public String  update(Model model, CartDto cartDto) {
        // id, name, price, imgname, or newimg
        try {
            cartService.modify(cartDto);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }
    @RequestMapping("/delete")
    public String delete(Model model, CartDto cartDto) throws Exception {
        cartService.delete(cartDto);
        return "redirect:/cart/get";
    }

    @RequestMapping("/get")
    public String get(
            Model model,
            @RequestParam("custId") String custId
    ) throws Exception {
        List<CartDto> list = cartService.get(custId);
        model.addAttribute("cartlist",list);
        model.addAttribute("center",dir+"get");

        return "index";
    }
//    @RequestMapping("/detail")
//    public String detail(Model model, CartDto cartDto) throws Exception {
//        itemService.get(cartDto.getItemId());
//        model.addAttribute("cart",cart);
//        model.addAttribute("center",dir+"detail");
//
//
//        return "index";
//    }
}
