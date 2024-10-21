package edu.sm.car;

import edu.sm.app.dto.CarDto;
import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class CarInsertTest {
    @Autowired
    CarService carService;

    @Test
    void testInsertCar() {
        CarDto carDto = CarDto.builder()
                .carName("TestCar")
                .carPrice(50000)
                .carColor("Blue")
                .carType("Sedan")
                .carImg("test_car.jpg")
                .productionDate(LocalDateTime.now())
                .build();
        try {
            carService.add(carDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}