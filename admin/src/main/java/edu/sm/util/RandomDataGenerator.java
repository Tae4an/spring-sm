package edu.sm.util;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Random;

@Slf4j
public class RandomDataGenerator {

    public static void generateAndSendData() throws Exception {
        JSONArray data = createJsonData();
        String jsonString = data.toJSONString();

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("http://127.0.0.1:80/charts/receive"))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonString))
                .build();

        client.send(request, HttpResponse.BodyHandlers.ofString());
    }

    private static JSONArray createJsonData() {
        JSONArray arr = new JSONArray();
        Random r = new Random();
        for (int i = 0; i < 5; i++) {
            JSONObject obj = new JSONObject();
            obj.put("name", "taesan" + i);
            JSONArray arr2 = new JSONArray();
            for (int j = 0; j < 12; j++) {
                arr2.add(r.nextDouble(40) + 1);
            }
            obj.put("data", arr2);
            arr.add(obj);
        }
        return arr;
    }
}