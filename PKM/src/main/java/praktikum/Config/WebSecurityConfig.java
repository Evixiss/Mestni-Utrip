package praktikum.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity web) throws  Exception{
//        web.ignoring().antMatchers("/resources/**");
        web.ignoring().antMatchers("/main/resources/**");


    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()

                .antMatchers("/", "/index").permitAll()
                .antMatchers("/", "/aktualno").permitAll()
                .antMatchers("/", "/klubi").permitAll()
                .antMatchers("/", "/kultura").permitAll()
                .antMatchers("/", "/narava").permitAll()
                .antMatchers("/", "/registracija").permitAll()
                .antMatchers("/", "/restavracije").permitAll()
                .antMatchers("/", "/sport").permitAll()

                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/index")
                .permitAll()
                .and()
                .logout()
                .permitAll();
    }

    @Bean
    @Override
    public UserDetailsService userDetailsService() {
        UserDetails user =
                User.withDefaultPasswordEncoder()
                        .username("user")
                        .password("password")
                        .roles("USER")
                        .build();

        return new InMemoryUserDetailsManager(user);
    }
}