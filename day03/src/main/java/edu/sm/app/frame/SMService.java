package edu.sm.app.frame;

import java.util.List;

public interface SMService<K, V> {
    void add(V value) throws Exception;

    void modify(V value) throws Exception;

    void delete(K key) throws Exception;

    V get(K key) throws Exception;

    List<V> get() throws Exception;
}
