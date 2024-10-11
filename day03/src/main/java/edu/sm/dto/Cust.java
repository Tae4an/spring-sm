package edu.sm.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.bind.annotation.RequestMapping;

@Data
@Builder
@RequestMapping()
public class Cust {
    private String id;
    private String pwd;
    private String name;
}
