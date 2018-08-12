package com.shortestdistance.find.models;

import org.junit.Test;

import static org.junit.Assert.*;

public class DataTest {

    @Test
    public void distance() {
        Data data=new Data(0,0,0,0);
        Double actual =data.distance();
        double expected = 0;
        assertEquals(expected,actual,0.000005);
    }
    @Test
    public void distance2() {
        Data data=new Data(13,14,13,14);
        Double actual =data.distance();
        double expected = 0;
        assertEquals(expected,actual,0.000005);
    }
    @Test
    public void distance3() {
        Data data=new Data(10,10,10,20);
        Double actual =data.distance();
        double expected = 1047197.5625 ;
        assertEquals(expected,actual,0.000005);
    }
}