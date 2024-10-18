package edu.sm.app.service;

import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CartRepository;
import edu.sm.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SMService<Integer, CartDto> {

    final CartRepository cartRepository;

    @Override
    public void add(CartDto value) throws Exception {
        cartRepository.insert(value);
    }

    @Override
    public void modify(CartDto value) throws Exception {
        cartRepository.update(value);
    }

    @Override
    public void delete(Integer key) throws Exception {
        cartRepository.delete(key);
    }

    @Override
    public CartDto get(Integer key) throws Exception {
        return cartRepository.selectOne(key);
    }

    @Override
    public List<CartDto> get() throws Exception {
        return cartRepository.select();
    }
}