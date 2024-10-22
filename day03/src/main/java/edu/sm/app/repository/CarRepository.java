
package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CarSearchDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CarRepository extends SMRepository<Integer, CarDto> {
    List<CarDto> findByName(String name);
    Page<CarDto> searchCars(String keyword);
}
