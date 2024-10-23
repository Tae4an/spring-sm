package edu.sm.app.repository;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface ItemRepository extends SMRepository<Integer, ItemDto> {
}