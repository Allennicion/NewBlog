package me.allen.newBlog;

import me.allen.newBlog.annotation.MybatisMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author allen
 */
@SpringBootApplication
@MapperScan(basePackages = "me.allen.newBlog.mapper", annotationClass = MybatisMapper.class)
@EnableScheduling
@EnableCaching
public class NewBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewBlogApplication.class, args);
    }

}
