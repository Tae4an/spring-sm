package edu.sm.controller;

import edu.sm.service.RandomDataGenerator;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;
import java.util.Random;

@RestController
@Slf4j
@RequestMapping("/charts")
public class ChartsRestController {


    private JSONArray chartData;

    @PostConstruct
    public void init() {
        createChartData();
    }
    @RequestMapping("/chart1")
    public Object chart1() {
        JSONArray arr = new JSONArray();

        for (int i = 0; i < 5; i++) {
            JSONObject obj = new JSONObject();
            Random r = new Random();
            obj.put("name", "taesan" + i);
            JSONArray arr2 = new JSONArray();
            for (int j = 0; j < 12; j++) {
                arr2.add(r.nextDouble(40) + 1);
            }
            obj.put("data", arr2);
            arr.add(obj);
        }
        log.info(arr.toJSONString());
        return arr;
    }


    @RequestMapping("/create_data")
    public void createChartData() {
        chartData = new JSONArray();
        Random r = new Random();
        String[] genders = {"Male", "Female"};
        int[] years = {2020, 2021, 2022, 2023, 2024};

        for (String gender : genders) {
            for (int year : years) {
                JSONObject yearObj = new JSONObject();
                yearObj.put("name", gender + " " + year);

                JSONArray monthData = new JSONArray();
                for (int month = 1; month <= 12; month++) {
                    int sales = r.nextInt(9900000) + 100000;
                    monthData.add(sales);
                }
                yearObj.put("data", monthData);
                chartData.add(yearObj);
            }
        }
    }

    @RequestMapping("/chart2/{year}")
    public Object chart2(@PathVariable(required = false) Integer year) {
        if (year == null) {
            return chartData;
        }

        JSONArray filteredData = new JSONArray();
        for (Object obj : chartData) {
            JSONObject dataObj = (JSONObject) obj;
            String name = (String) dataObj.get("name");
            if (name.contains(String.valueOf(year))) {
                filteredData.add(dataObj);
            }
        }
        return filteredData;
    }

    @RequestMapping("/chart3/ex1")
    public Object chart3Ex1() {
        JSONArray arr = new JSONArray();
        Random r = new Random();
        String[] names = {"Apples", "Bananas", "Oranges", "Pears", "Grapes"};

        for (String name : names) {
            JSONObject obj = new JSONObject();
            obj.put("name", name);
            JSONArray data = new JSONArray();
            for (int i = 0; i < 12; i++) {
                data.add(r.nextInt(100) + 1);
            }
            obj.put("data", data);
            arr.add(obj);
        }
        return arr;
    }

    @RequestMapping("/chart3/ex2")
    public Object chart3Ex2() {
        JSONArray arr = new JSONArray();
        Random r = new Random();
        String[] names = {"Tokyo", "New York", "London", "Paris", "Beijing"};

        for (String name : names) {
            JSONObject obj = new JSONObject();
            obj.put("name", name);
            obj.put("y", r.nextInt(1000) + 100);
            arr.add(obj);
        }
        return arr;
    }

    @RequestMapping("/chart3/ex3")
    public Object chart3Ex3() {
        JSONArray arr = new JSONArray();
        Random r = new Random();
        String[] categories = {"0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44"};

        for (String category : categories) {
            JSONObject obj = new JSONObject();
            obj.put("name", category);
            JSONArray data = new JSONArray();
            data.add(-(r.nextInt(500) + 100));  // Male (negative value)
            data.add(r.nextInt(500) + 100);    // Female
            obj.put("data", data);
            arr.add(obj);
        }
        return arr;
    }

    @RequestMapping("/chart3/ex4")
    public Object chart3Ex4() {
        JSONArray arr = new JSONArray();
        Random r = new Random();
        String[] browsers = {"Chrome", "Firefox", "Internet Explorer", "Safari", "Edge", "Opera", "Other"};

        double total = 0;
        for (String browser : browsers) {
            double value = r.nextDouble() * 100;
            total += value;
            JSONObject obj = new JSONObject();
            obj.put("name", browser);
            obj.put("y", value);
            arr.add(obj);
        }

        // Normalize to 100%
        for (Object o : arr) {
            JSONObject obj = (JSONObject) o;
            obj.put("y", (double) obj.get("y") / total * 100);
        }

        return arr;
    }

    private String latestData;

    @GetMapping("/getData")
    @ResponseBody
    public String getData() {
        try {
            // RandomDataGenerator를 호출하여 데이터 생성 및 전송
            RandomDataGenerator.generateAndSendData();

            return this.latestData;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error generating data";
        }
    }

    @PostMapping("/receive")
    @ResponseBody
    public void receiveData(@RequestBody String jsonData) {
        this.latestData = jsonData;
        log.info("Random Data:{}", latestData);
    }

}
