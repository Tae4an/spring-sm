package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CarSearchDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService implements SMService<Integer, CarDto> {

    final CarRepository carRepository;

    @Override
    public void add(CarDto value) throws Exception {
        carRepository.insert(value);
    }

    @Override
    public void modify(CarDto value) throws Exception {
        carRepository.update(value);
    }

    @Override
    public void delete(Integer key) throws Exception {
        carRepository.delete(key);
    }

    @Override
    public CarDto get(Integer key) throws Exception {
        return carRepository.selectOne(key);
    }

    @Override
    public List<CarDto> get() throws Exception {
        return carRepository.select();
    }
    public List<CarDto> findByName(String name) throws Exception {
        return carRepository.findByName(name);
    }

    public Page<CarDto> searchCars(int pageNo,String keyword) throws Exception {
        PageHelper.startPage(pageNo,4);
        return carRepository.searchCars(keyword);
    }


}