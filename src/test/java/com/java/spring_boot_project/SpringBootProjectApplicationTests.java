package com.java.spring_boot_project;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootProjectApplicationTests {
    @Test
    void contextLoads() {
    }
    static {
    System.setProperty("org.mockito.inline-javaagent", "true");
}
}
