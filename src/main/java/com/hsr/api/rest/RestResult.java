package com.hsr.api.rest;

import java.util.Map;

import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class RestResult {
    private final HttpStatus httpStatus;
    private final Map<String, String> data;
}
