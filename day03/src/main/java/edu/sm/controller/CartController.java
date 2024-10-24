package edu.sm.controller;


import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import edu.sm.app.service.ItemService;
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
    public String addimpl(Model model, CartDto cartDto) throws Exception {
        // 데이터 입력
//        cartDto.setImgName(cartDto.getImage().getOriginalFilename());
        cartService.add(cartDto);

        return "redirect:/cart/get";
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
        log.info("===============================custId--{}", custId);
        List<CartDto> list = cartService.get(custId);
        log.info("===============================List{}", list);
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
