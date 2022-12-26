package com.yogosha.controllers;

import com.yogosha.entities.Mission;
import com.yogosha.services.MissionService;
import com.yogosha.services.Security;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Base64;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MissionController
{
	private MissionService missionService;
	
	@Autowired
	public void setMissionService(MissionService missionService) {
		this.missionService = missionService;
	}
	
	@RequestMapping(value = {"/latest_mission"}, method = {RequestMethod.GET})
	public String list(@CookieValue(value = "latest_mission", defaultValue = "") String latest_mission, Model model) {
		if (latest_mission.length() == 0) {
			model.addAttribute("latest_mission", "No recent mission detected");
		} else {
			try {
				byte[] decodedBytes = Base64.getDecoder().decode(latest_mission);
				ByteArrayInputStream ini = new ByteArrayInputStream(decodedBytes);
				Security inp = new Security(ini);
				Mission result = null;
				result = (Mission)inp.readObject();
				model.addAttribute("latest_mission", result.getMission());
			}
			catch (IllegalArgumentException ex) {
				model.addAttribute("latest_mission", "An Error has occured");
				ex.printStackTrace();
			} catch (IOException e) {
				model.addAttribute("latest_mission", "An Error has occured");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				model.addAttribute("latest_mission", "An Error has occured");
				e.printStackTrace();
			}
		}
		return "missions";
	}
	
	@RequestMapping({"/mission/new"})
	public String newMission(Model model) {
		return "missionform";
	}
	
	@RequestMapping(value = {"/mission"}, method = {RequestMethod.POST})
	public String saveMission(HttpServletResponse response, HttpServletRequest req) {
		Mission mission = new Mission(req.getParameter("mission"), req.getParameter("category"), req.getParameter("anime"));
		this.missionService.saveMission(mission);
		
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		
		try {
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
			objectOutputStream.writeObject(mission);
			objectOutputStream.close();
			String cookie = Base64.getEncoder().encodeToString(byteArrayOutputStream.toByteArray());
			Cookie latest_mission = new Cookie("latest_mission", cookie);
			response.addCookie(latest_mission);
		} catch (IOException e) {
			Cookie latest_mission = new Cookie("latest_mission", "");
			e.printStackTrace();
			response.addCookie(latest_mission);
		}
		return "redirect:/latest_mission";
	}
}