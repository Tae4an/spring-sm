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
class CarUpdateTest {
    @Autowired
    CarService carService;

    @Test
    void testUpdateCar() {
        try {
            CarDto carDto = CarDto.builder()
                    .carId(11)
                    .carName("UpdatedCar")
                    .carPrice(55000)
                    .carColor("Red")
                    .carType("SUV")
                    .carImg("updated_car.jpg")
                    .productionDate(LocalDateTime.now())
                    .build();

            carService.modify(carDto);
        } catch (Exception e) {
            log.error("테스트 중 오류 발생", e);
            throw new RuntimeException(e);
        }
    }
}