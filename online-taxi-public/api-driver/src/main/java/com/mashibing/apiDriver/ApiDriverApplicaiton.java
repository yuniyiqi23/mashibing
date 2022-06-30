package com.mashibing.apiDriver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ApiDriverApplicaiton {
    public static void main(String[] args) {
        SpringApplication.run(ApiDriverApplicaiton.class);
    }

    @GetMapping("/test")
    public String test(){
        return "api-driver";
    }
}
