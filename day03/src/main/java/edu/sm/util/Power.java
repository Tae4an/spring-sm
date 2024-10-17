package edu.sm.util;


import java.util.Random;

public class Power {
    public static void main(String[] args) {
        String url = "http://127.0.0.1/iot/power";
        String data = "100.0";
        Random rand = new Random();
        for (int i = 0; i < 100; i++) {
            double num = rand.nextDouble() * 5;
            HttpSendData.send(url, num+"");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        HttpSendData.send(url,data);
    }
}