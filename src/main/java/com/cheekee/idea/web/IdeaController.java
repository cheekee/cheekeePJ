package com.cheekee.idea.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by songhangyu on 2016-11-07.
 */
@Controller
public class IdeaController {

    @RequestMapping(value="/ideaList.do")
    public String ideaList(){

        return "/idea/ideaList";
    }
}
