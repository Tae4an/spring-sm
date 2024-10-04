package edu.sm.frame;

public interface SMRepository <K,V>{
    void insert(V value);
    void update(V value);
    void delete(K key);


}
