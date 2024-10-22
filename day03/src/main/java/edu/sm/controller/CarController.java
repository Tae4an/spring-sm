package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.*;
import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/car")
public class CarController {
    private final CarService carService;
    String dir = "car/";

    @Value("${app.dir.uploadimgdir}")
    private String uploadBaseDir;

    public CarController(CarService carService) {
        this.carService = carService;
    }

    @RequestMapping("")
    public String chart(Model model) {
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
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.searchCars(pageNo,""), 5); // 3:하단 네비게이션 개수
        model.addAttribute("carPage",p);
        model.addAttribute("target", "car");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(
            Model model,
            @RequestParam("id") int id
    ) throws Exception {
        CarDto carDto = carService.get(id);
        model.addAttribute("car", carDto);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";
    }
    @RequestMapping("/update_impl")
    public String updateImpl(
            Model model,
            CarDto carDto
    ) throws Exception {
        carService.modify(carDto);
        return "redirect:/car/detail?id="+carDto.getCarId();
    }
    @RequestMapping("/delete_impl")
    public String deleteImpl(Model model,  @RequestParam("id") int id
    ) throws Exception {
        carService.delete(id);
        return "redirect:/car/get";
    }

    @RequestMapping("/search")
    public String search(
            Model model,
            @RequestParam("keyword") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo
    ) throws Exception {
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.searchCars(pageNo,keyword), 5); // 3:하단 네비게이션 개수
        log.info("======================================="+keyword);
        model.addAttribute("carPage",p);
        model.addAttribute("keyword", keyword);
        model.addAttribute("target", "car");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }

    @RequestMapping("/insert_impl")
    public String insertImpl(Model model,  CarDto carDto) throws Exception {
        carService.add(carDto);
        return "redirect:/car/get";
    }


}
