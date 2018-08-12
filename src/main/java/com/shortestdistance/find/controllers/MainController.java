package com.shortestdistance.find.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
/**
        *This is class is main controller. It gives us pages in response to urls requests
         *  @autor Valentyn Bartko
        *  @version 1.0
        */
public class MainController {
    /**
     * Function that return page n response to url  "/"
     * @return index.ftl
     * @see MainController#index()
     */
    @GetMapping("/")
    public String index(){
        return "index";
    }

}
