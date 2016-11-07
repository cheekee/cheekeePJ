package com.cheekee.geustbook.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by songhangyu on 2016-11-07.
 */
@Controller
public class GeustbookController {

    @RequestMapping(value="/geustbookList.do")
    public String geustbookList(){

        return "/geustbook/geustbookList";
    }

}
