
package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.Item;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {

    String dir = "item/";
    final ItemService itemService;

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
    public String get(
            Model model,
      @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo
    ) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.searchItems(pageNo,""), 5); // 3:하단 네비게이션 개수
        model.addAttribute("itemPage",p);
        model.addAttribute("target", "item");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }

    @RequestMapping("/search")
    public String search(
            Model model,
            @RequestParam("keyword") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo
    ) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.searchItems(pageNo,keyword), 5); // 3:하단 네비게이션 개수
        log.info("======================================="+keyword);
        model.addAttribute("itemPage",p);
        model.addAttribute("keyword", keyword);
        model.addAttribute("target", "item");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }

    @RequestMapping("/add_impl")
    public String addimpl(Model model, ItemDto itemDto) throws Exception {
        // 데이터 입력
        itemDto.setImgName(itemDto.getImage().getOriginalFilename());
        itemService.add(itemDto);

        return "redirect:/item/get";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        ItemDto itemDto = null;

        itemDto = itemService.get(id);
        model.addAttribute("item",itemDto);
        model.addAttribute("center",dir+"detail");


        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model, ItemDto itemDto) throws Exception {
        // id, name, price, imgname, or newimg
        itemService.modify(itemDto);
        return "redirect:/item/detail?id="+itemDto.getItemId();
    }
}