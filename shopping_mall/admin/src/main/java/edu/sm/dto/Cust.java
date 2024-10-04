package edu.sm.dto;

import java.time.LocalDateTime;

public class Cust {
    private String id;
    private String pw;
    private String name;
    private LocalDateTime signUpTime;
    public Cust() {
        this.signUpTime = LocalDateTime.now();
    }
    public Cust(String id, String pw, String name) {
        this();
        this.id = id;
        this.pw = pw;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Cust{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
