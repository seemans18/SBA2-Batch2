package com.eval.coronakit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	

	@SuppressWarnings("deprecation")
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
	
	 	UserBuilder builder =  User.withDefaultPasswordEncoder();
	 	auth.inMemoryAuthentication()
	 		.withUser(builder.username("Admin").password("admin").roles("ADMIN"))
	 		.withUser(builder.username("First").password("abc").roles("USER"))
	 		.withUser(builder.username("Second").password("abc").roles("USER"));
	} 
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*http.authorizeRequests().antMatchers("/").permitAll().and()
        .authorizeRequests().antMatchers("/console/**").permitAll();
		http.csrf().disable();
		http.headers().frameOptions().disable();*/
		
		// Add Your Application Based Security config here
		http.authorizeRequests() // start defining the rule
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/user/**").hasRole("USER")
		.and() // how auth should take place
			// .httpBasic()
			.formLogin() // form-based auth
			.loginPage("/custom-login") // custom login form
			.loginProcessingUrl("/validate") // implementation is provided free
			//.defaultSuccessUrl("/home")
			.permitAll() // allow to access login form
		.and()
			.logout().permitAll() //  have a provision for logout (free implementation of /logout url)
		.and()
			.exceptionHandling()
			.accessDeniedPage("/custom-error");
	}
	
	// third party JWT Token/OAuth
		@Override
		public void configure(WebSecurity web) throws Exception {
			// TODO Auto-generated method stub
			super.configure(web);
		}
}

