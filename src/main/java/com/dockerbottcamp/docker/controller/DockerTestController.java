package com.dockerbottcamp.docker.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1")
public class DockerTestController {

    @Value("${env.devops}")
    private String devops;

    @GetMapping("/get-docker")
    private String getDocker(){
        return "Hello world with auto push and devops " + devops;
    }
}
