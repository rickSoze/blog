package com.wh.config;

import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;

@Configuration
public class ShiroConfig {



    @Bean
    public IniRealm iniRealm(){
        IniRealm iniRealm = new IniRealm("classpath:users.ini");
        return iniRealm;
    }

    @Bean
    public DefaultWebSecurityManager defaultWebSecurityManager(IniRealm iniRealm){
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setRealm(iniRealm);
        return defaultWebSecurityManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(DefaultWebSecurityManager defaultWebSecurityManager){
        ShiroFilterFactoryBean filter = new ShiroFilterFactoryBean();
        filter.setSecurityManager(defaultWebSecurityManager);

        HashMap<String, String> filterMap = new HashMap<>();

        filterMap.put("/","anon");
        filterMap.put("/index","anon");
        filterMap.put("/toLogin","anon");
        filterMap.put("/toMain","anon");
        filterMap.put("/showBlogG","anon");
        filterMap.put("/addCom","anon");
        filterMap.put("/login","anon");

        filterMap.put("/layui/**","anon");
        filterMap.put("/js/**","anon");
        filterMap.put("/image/**","anon");

        filterMap.put("/**","authc");

        filterMap.put("/logout","logout");

        filter.setFilterChainDefinitionMap(filterMap);

        filter.setLoginUrl("/toLogin");
        filter.setUnauthorizedUrl("/toLogin");


        return filter;

    }



}
