package edu.sm.cust.dto;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class Cust {
    private String id;
    private String pw;
    private String name;
    private LocalDateTime signUpTime;
}
