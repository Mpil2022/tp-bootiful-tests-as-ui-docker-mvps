package com.example.back.controller;

import com.example.back.service.AdderService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("adder")
@CrossOrigin()
public class AdderController {

    private AdderService adderService;

    public AdderController(AdderService adderService) {
        super();
        this.adderService = adderService;
    }

    @GetMapping("current")
    public int currentNum() {
        return adderService.currentBase();
    }

    @GetMapping("add/{num}")
    public int add(@PathVariable int num) {
        return adderService.add(num);
    }
}
