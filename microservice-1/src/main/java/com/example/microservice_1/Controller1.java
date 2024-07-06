package com.example.microservice_1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * (C) Copyright 2010-2021 Global Market Technologies. All Rights Reserved.
 * <p/>
 * Created by Dilanka Rathnasiri on 2024-07-05.
 */
@RestController
public class Controller1 {
    @GetMapping("/microservice-1")
    public String getMessage(){
        return "This is the message from microservice 1";
    }
}
