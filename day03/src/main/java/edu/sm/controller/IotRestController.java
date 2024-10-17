package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/iot")
public class IotRestController {
    @RequestMapping("/power")
    public Object power(
            @RequestBody String data
    ) {
        log.info(data);
        return 1;
    }

}
