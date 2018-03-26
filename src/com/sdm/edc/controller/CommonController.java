package com.sdm.edc.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sdm.edc.form.CommonForm;
import com.sdm.edc.form.Edc8583Form;

@Controller
@RequestMapping(value = "/common/")
public class CommonController {

	@RequestMapping(value = "login")
	public ModelAndView login(@ModelAttribute("form") CommonForm form, BindingResult result,  ModelMap model) {
		System.out.println("Load login");
		return new ModelAndView("/common/login", "form", form);
	}
	
	@RequestMapping(value = "welcome")
	public ModelAndView welcome(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model) {
		System.out.println("Load welcome");
		
		System.out.println(form.getUsername());
		
		if(StringUtils.isNotBlank(form.getUsername()) && !form.getUsername().equals("EDC001")){
			model.addAttribute("success", "");
			model.addAttribute("error", "Invalid login");
			return new ModelAndView("/common/login", "form", form);			
		}
		if(StringUtils.isNotBlank(form.getPassword()) && !form.getPassword().equals("abcd1234")){
			model.addAttribute("success", "");
			model.addAttribute("error", "Invalid login");
			return new ModelAndView("/common/login", "form", form);
		}
		
//		return "redirect:/edc/edc0100sim.sdm";
		return new ModelAndView("redirect:/edc/edc0100sim.sdm", "form", form);
	}
}
