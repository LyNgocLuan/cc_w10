package cc_w10;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;

import cc_w10.service.StorageProperties;

@SpringBootApplication(scanBasePackages={"cc_w10"})
@EnableConfigurationProperties(StorageProperties.class)
public class Application extends SpringBootServletInitializer {

	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(Application.class, args);
	}
}