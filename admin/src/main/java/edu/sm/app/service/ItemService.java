package edu.sm.app.service;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustRepository;
import edu.sm.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements SMService<Integer, ItemDto> {

    final ItemRepository itemRepository;

    @Override
    public void add(ItemDto value) throws Exception {
        itemRepository.insert(value);
    }

    @Override
    public void modify(ItemDto value) throws Exception {
        itemRepository.update(value);
    }

    @Override
    public void delete(Integer key) throws Exception {
        itemRepository.delete(key);
    }

    @Override
    public ItemDto get(Integer key) throws Exception {
        return itemRepository.selectOne(key);
    }

    @Override
    public List<ItemDto> get() throws Exception {
        return itemRepository.select();
    }
}