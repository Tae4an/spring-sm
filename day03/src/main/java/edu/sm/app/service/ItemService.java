package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustRepository;
import edu.sm.app.repository.ItemRepository;
import edu.sm.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements SMService<Integer, ItemDto> {

    final ItemRepository itemRepository;
    @Value("${app.dir.uploadimgdir}")
    private String uploadimgdir;

    @Override
    public void add(ItemDto itemDto) throws Exception {
        FileUploadUtil.saveFile(itemDto.getImage(),uploadimgdir);
        itemRepository.insert(itemDto);
    }

    @Override
    public void modify(ItemDto itemDto) throws Exception {
        if(itemDto.getImage().isEmpty()){
            itemRepository.update(itemDto);
        }else{
            String oldimg = itemDto.getImgName();
            itemDto.setImgName(itemDto.getImage().getOriginalFilename());
            itemRepository.update(itemDto);

            FileUploadUtil.saveFile(itemDto.getImage(),uploadimgdir);
            FileUploadUtil.deleteFile(oldimg,uploadimgdir);
        }
    }

    @Override
    public void delete(Integer key) throws Exception {
        String imgName = itemRepository.selectOne(key).getImgName();
        FileUploadUtil.deleteFile(imgName,uploadimgdir);
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

    public Page<ItemDto> searchItems(int pageNo, String keyword) throws Exception {
        PageHelper.startPage(pageNo,4);
        return itemRepository.searchItems(keyword);
    }
}