package com.shortestdistance.find.models;
import lombok.*;
@lombok.Data

@ToString
@EqualsAndHashCode
/**
 *The class that stores point coordinates and contains a method for calculating the shortest
 * distance between them on the globe
 *  @autor Valentyn Bartko
 *  @version 1.0
 */
public class Data {
    /** Field longitude of first point */
    private double longitudeA;
    /** Field latitude of first point */
    private double latitudeA;
    /** Field longitude of second point */
    private double longitudeB;
    /** Field latitude of second point */
    private double latitudeB;
    /**
     * Function that calculate the shortest distance between two points on Earth
     * @return distance in meters
     * @see Data#distance()
     */
    public double distance() {


        double earthRadius = 6000000; //meters
        double dLat = Math.toRadians(latitudeB-latitudeA);
        double dLng = Math.toRadians(longitudeB-longitudeA);
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.cos(Math.toRadians(latitudeA)) * Math.cos(Math.toRadians(latitudeB)) *
                        Math.sin(dLng/2) * Math.sin(dLng/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        float dist = (float) (earthRadius * c);

        return dist;
    }
    /**
     * Constructor with all arguments
     * @param longitudeA - longitude of first point
     * @param latitudeA - latitude of first point
     * @param longitudeB -longitude of second point
     * @param latitudeB - latitude of second point
     * @see Data#Data(double, double, double, double)
     */
    public Data(double longitudeA, double latitudeA, double longitudeB, double latitudeB) {
        this.longitudeA = longitudeA;
        this.latitudeA = latitudeA;
        this.longitudeB = longitudeB;
        this.latitudeB = latitudeB;
    }
    /**
     * Constructor without arguments -
     * @see Data#Data()
     */
    public Data() {
    }
}
