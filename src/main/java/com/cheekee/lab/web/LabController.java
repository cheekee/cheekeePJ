package com.cheekee.lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by songhangyu on 2016-11-07.
 */
@Controller
public class LabController {

    @RequestMapping(value="/labList.do")
    public String labList(){

        return "/lab/labList";
    }

}
