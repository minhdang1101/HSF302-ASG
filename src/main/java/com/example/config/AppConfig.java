package com.example.config;

import jakarta.persistence.EntityManagerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = {"com.example.service", "com.example.repository", "com.example.model"})
@EnableJpaRepositories(basePackages = "com.example.repository")
public class AppConfig {

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUrl("jdbc:postgresql://localhost:5432/hsf302_demo");
        ds.setUsername("postgres");
        ds.setPassword("123456");
        return ds;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean emf =
                new LocalContainerEntityManagerFactoryBean();

        emf.setDataSource(dataSource());
        emf.setPackagesToScan("com.example.model");
        emf.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        emf.setJpaProperties(hibernateProperties());
        emf.setEntityManagerFactoryInterface(jakarta.persistence.EntityManagerFactory.class);

        return emf;
    }

    @Bean
    public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {
        return new JpaTransactionManager(emf);
    }

    private Properties hibernateProperties() {
        Properties props = new Properties();
        props.put("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        props.put("hibernate.show_sql", "true");
        props.put("hibernate.hbm2ddl.auto", "update");
        return props;
    }
}
