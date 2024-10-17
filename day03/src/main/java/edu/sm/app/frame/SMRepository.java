package edu.sm.app.frame;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SMRepository<K, V> {
    void insert(V value) throws Exception;

    void update(V value) throws Exception;

    void delete(K key) throws Exception;

    V selectOne(K key) throws Exception;

    List<V> select() throws Exception;

}
