package edu.sm.controller;

import edu.sm.util.FileUploadUtil;
import edu.sm.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@Slf4j
public class MainController {
    @Value("${app.key.weatherKey}")
    private String weatherKey;

    @Value("${app.key.weatherKey2}")
    private String weatherKey2;

    @Value("${app.url.server-url}")
    private String serverUrl;
    @RequestMapping("/")
    public String main(Model model) {
        log.info("MainController");

        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        model.addAttribute("center", "about");
        return "index";
    }

    @RequestMapping("/webcam")
    public String webCam(Model model) {
        model.addAttribute("center", "webcam");
        return "index";

    }

    @ResponseBody
    @RequestMapping("/weather")
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("108",weatherKey);
    }
    @ResponseBody
    @RequestMapping("/weather2")
    public Object wh2(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather2("1835847",weatherKey2);
    }
    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","websocket");
        return "index";
    }
    @RequestMapping("/chat")
    public String chat(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","chat");
        return "index";
    }
    @RequestMapping("/webrtc")
    public String webrtc(Model model) {
        model.addAttribute("serverurl", serverUrl);
        model.addAttribute("roomId", "1");    // 하드코딩된 roomId
        model.addAttribute("center", "webrtc");
        return "index";
    }
}