package edu.sm.controller;

import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CarSearchDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Item;
import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
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
    public String get(Model model) throws Exception {
        List<CarDto> cars = carService.get();
        model.addAttribute("cars",cars);
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
//            @RequestParam("carName") String name
            @RequestParam("keyword") String keyword
    ) throws Exception {
//        List<CarDto> cars = carService.findByName(name);
        List<CarDto> cars = carService.searchCars(keyword);

        model.addAttribute("cars",cars);
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
