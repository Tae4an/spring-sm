package edu.sm.cust.frame;

public interface SMService < K,V> {
    void register(V value);
    void modify(V value);
    void remove(K key);

}
