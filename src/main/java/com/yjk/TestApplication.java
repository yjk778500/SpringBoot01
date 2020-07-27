package com.yjk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//表示启动项
@SpringBootApplication
public class TestApplication {
	//启动项目   使用了热部署
public static void main(String[] args) {
	SpringApplication.run(TestApplication.class, args);
}
}
