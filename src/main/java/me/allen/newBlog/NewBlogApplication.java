package me.allen.newBlog;

import me.allen.newBlog.annotation.MybatisMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author allen
 */
@SpringBootApplication(exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
@MapperScan(basePackages = "me.allen.newBlog.mapper", annotationClass = MybatisMapper.class)
@EnableScheduling
@EnableCaching
@ServletComponentScan(basePackages="me.allen.newBlog")
public class NewBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewBlogApplication.class, args);
    }

}
