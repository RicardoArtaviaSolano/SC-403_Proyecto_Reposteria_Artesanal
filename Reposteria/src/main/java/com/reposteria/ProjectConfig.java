/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.reposteria;

import java.util.Locale;
import org.springframework.boot.autoconfigure.web.WebProperties.LocaleResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

public class ProjectConfig implements WebMvcConfigurer{
    /*los siguientes metodos son para incorporar el tema de internacionalizacion*/
    
    /*localeResolver se utiliza para crear una sesion de cambio de idioma*/
    
//    @Bean 
//    public LocaleResolver localeResolver(){
//        slr.setDefaultLocale(defaultLocale:Locale.getDefault());
//        slr.setLocalAttributeName(localAttributeName: "session.current.locale");
//        slr.setTimeZoneAttibuteName(timeZoneAttributeName:"session.current.time");
//        return slr;
//    }
    
    /*localeChangeInterceptor se utliza para crear un interceptro de idioma*/
    
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor(){
        var lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }
    
    @Override
    public void addInterceptors (InterceptorRegistry registro){
        registro.addInterceptor(localeChangeInterceptor());
    }
    
    @Bean("messageSource")
    public MessageSource messageSource(){
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
}
