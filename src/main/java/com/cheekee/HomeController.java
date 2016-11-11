package com.cheekee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by songhangyu on 2016-11-04.
 */
@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public String home() {

        return "/index";
    }

    @RequestMapping(value = "/admin")
    public String loginForm() {

        return "/admin/loginForm";
    }

    @RequestMapping(value = "/login.do")
    public String login() {

        return "/index";
    }

}