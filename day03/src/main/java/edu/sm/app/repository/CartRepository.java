package edu.sm.app.repository;

import edu.sm.app.dto.CartDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface CartRepository extends SMRepository<Integer, CartDto> {
}