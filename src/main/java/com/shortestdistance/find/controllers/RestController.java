package com.shortestdistance.find.controllers;

import com.shortestdistance.find.models.Data;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@org.springframework.web.bind.annotation.RestController
/**
 *This is class is rest controller. It gives us some data in response to urls requests
 *  @autor Valentyn Bartko
 *  @version 1.0
 */
public class RestController {
    /**
     * Function that return som data in response to url  "/find"
     * @return distance between points in Earth in meters
     * @param datas -object with coordinates
     * * @see RestController#Find(Data)
     */
    @PutMapping ("/find")
    public Double Find(@RequestBody Data datas){
        return datas.distance();
    }

}
