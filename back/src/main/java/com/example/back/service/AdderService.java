package com.example.back.service;

import org.springframework.stereotype.Service;

@Service
public class AdderService {

    private int num;

    public int currentBase() {
        return num;
    }

    public int add(int adder) {
        this.num = this.num + adder;
        return this.num;
    }
}
