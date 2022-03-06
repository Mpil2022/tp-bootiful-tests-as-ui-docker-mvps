package com.example.back;

import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.testng.Assert;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

@SpringBootTest
class BackApplicationTests {

    @Test
    public void currentNumStatusCode(){
        Response response = RestAssured.get("http://localhost:8080/adder/current");
        Assert.assertEquals(response.getStatusCode(),200);
    }

    @Test
    public void addStatusCode(){
        Response response = RestAssured.get("http://localhost:8080/adder/add/0");
        Assert.assertEquals(response.getStatusCode(),200);
    }

    @Test
    public void currentNum(){
        Response response = RestAssured.get("http://localhost:8080/adder/current");
        Assert.assertEquals(Integer.parseInt(response.getBody().asString()),0);
    }

    @Test
    public void add(){
        RestAssured.get("http://localhost:8080/adder/add/10");
        Response response = RestAssured.get("http://localhost:8080/adder/current");
        Assert.assertEquals(Integer.parseInt(response.getBody().asString()),10);
    }

    @Test
    public void getCall(){

        given()
                .when()
                .get("http://localhost:8080/adder/current").
                then()
                .assertThat()
                .contentType(ContentType.JSON)
                .body("", equalTo("0"));
    }
}
