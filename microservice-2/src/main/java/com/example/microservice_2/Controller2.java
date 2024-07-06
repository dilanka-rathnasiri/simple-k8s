package com.example.microservice_2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;

/**
 * <p>
 * (C) Copyright 2010-2021 Global Market Technologies. All Rights Reserved.
 * <p/>
 * Created by Dilanka Rathnasiri on 2024-07-05.
 */
@RestController
public class Controller2 {
    private WebClient webClient;

    @GetMapping("/microservice-2")
    public String getMessage(){
        this.webClient = WebClient.builder().baseUrl("http://microservice-1-service").build();
        String service1Msg = webClient.get()
                .uri("/microservice-1")
                .retrieve()
                .bodyToMono(String.class)
                .block();
        return String.format("%s\nThis is the message from microservice 2", service1Msg);
    }
}
