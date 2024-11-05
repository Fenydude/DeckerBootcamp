package com.dockerbottcamp.docker.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/v1")
public class DockerTestController {



    @Value("${env.devops}")
    private String devops;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/get-docker")
    private String getDocker(){
        return "Hello world with auto push 2.0 and devops " + devops;
    }


    @GetMapping("/get-sample-data")
    public List<String> getSampleData() {
        String query = "SELECT name FROM sample_table";
        return jdbcTemplate.query(query, (rs, rowNum) -> rs.getString("name"));
    }

    @GetMapping("/get-sam")
    public List<String> getSample() {
        String query = "SELECT name FROM sample_table";
        return jdbcTemplate.query(query, (rs, rowNum) -> rs.getString("name"));
    }

}
