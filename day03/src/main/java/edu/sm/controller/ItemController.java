
package edu.sm.controller;

import edu.sm.app.dto.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {

    String dir = "item/";

    @RequestMapping("")
    public String item(Model model) {
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
        List<Item> items = new ArrayList<>();
        items.add(Item.builder().id(100).price(10000).name("pants1").imgName("img.png").regDate(new Date()).build());
        items.add(Item.builder().id(101).price(20000).name("pants2").imgName("img_1.png").regDate(new Date()).build());
        items.add(Item.builder().id(102).price(30000).name("pants3").imgName("img_2.png").regDate(new Date()).build());
        items.add(Item.builder().id(103).price(40000).name("pants4").imgName("img_3.png").regDate(new Date()).build());
        items.add(Item.builder().id(104).price(50000).name("pants5").imgName("img_4.png").regDate(new Date()).build());

        model.addAttribute("items",items);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
}