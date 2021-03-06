package com.animalshelter.sidebar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.animalshelter.common.service.CommonService;
import com.animalshelter.sidebar.model.*;
import com.animalshelter.sidebar.service.SidebarService;

@Controller
public class SidebarController {

	@Autowired
	private SidebarService sidebarService;
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "/sidebar/naverpay.animal", method = RequestMethod.GET)
	public String naverpay(@RequestParam Map<String, String> map, HttpServletRequest request, HttpSession session) {
		
		return "pay/naverform";
		
	}
	
	@RequestMapping(value = "/sidebar/pparcel.animal", method = RequestMethod.GET)
	public String pparcel(@RequestParam Map<String, String> map, HttpServletRequest request, HttpSession session) {

		String email;//(String) session.getAttribute("email");
		email=(String) session.getAttribute("email");
		map.put("email", email);
		List<ParcelDto> list;
		map.put("pg", "1");
		
		list = sidebarService.pparcel(map);
		
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/mymissinglist";
	}
	
	
	@RequestMapping(value = "/sidebar/pick.animal", method = RequestMethod.GET)
	public String pick(@RequestParam Map<String, String> map, HttpServletRequest request, HttpSession session) {
		
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		List<ParcelDto> list;
		map.put("pg", "1");
		list = sidebarService.pick(map);
		System.out.println("ll");
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/mymissinglist";
	}
	
	@RequestMapping(value = "/sidebar/missing.animal", method = RequestMethod.GET)
	public String missing(@RequestParam Map<String, String> map, HttpServletRequest request, HttpSession session) {

		if (map.get("acode") != null) {
			request.setAttribute("sidebar", "sidebar");
		} else {
			request.setAttribute("sidebar", "side");
		}
		request.setAttribute("sidebar", map.get("acode"));
		
		map.put("pg", "1");

		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/mymissinglist";
	}

	@RequestMapping(value = "/sidebar/missing.animal", method = RequestMethod.POST)
	@ResponseBody
	public String missing(@RequestParam Map<String, String> map,HttpServletRequest request,HttpSession session,Model model) {
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		List<MissingDto> list;
		String ee = map.get("sidebar");
		email=(String) session.getAttribute("email");
		list = sidebarService.missingList(map);

		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (MissingDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("kind", dto.getKind());
			article.put("seq", dto.getSeq());
			article.put("age", dto.getAge());
			article.put("petsize", dto.getPetsize());
			article.put("location", dto.getLocation());
			article.put("subject", dto.getSubject());
			jarray.put(article);
		}
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		json.put("members", jarray);
		return json.toString();

	}

	@RequestMapping(value = "/sidebar/articlelist.animal", method = RequestMethod.GET)
	public String articlelist(@RequestParam Map<String, String> map, HttpServletRequest request) {

		if (map.get("acode") != null) {
			request.setAttribute("sidebar", "sidebar");
		} else {
			request.setAttribute("sidebar", "side");
		}
		request.setAttribute("sidebar", map.get("acode"));
		
		map.put("pg", "1");
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/myarticlelist";
	}

	@RequestMapping(value = "/sidebar/applylist.animal", method = RequestMethod.GET)
	public String applylist(@RequestParam Map<String, String> map, HttpServletRequest request) {

		map.put("pg", "1");
		request.setAttribute("sidebar", map.get("acode"));
		
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/myarticlelist";
	}

	@RequestMapping(value = "/sidebar/applylist.animal", method = RequestMethod.POST)
	@ResponseBody
	public String articlelist(@RequestParam Map<String, String> map,HttpServletRequest request,HttpSession session) {
		List<ApplyDto> list;
		String ee = map.get("apply");
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		list = sidebarService.applyList(map);
	
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (ApplyDto dto : list) {
			
			JSONObject article = new JSONObject();
			article.put("seq", dto.getSeq());
			article.put("subject", dto.getSubject());
			article.put("tel", dto.getTel());
			article.put("location", dto.getAddr1());
			article.put("applyemail", dto.getApplyemail());
			System.out.println(dto.getSeq()+dto.getSubject()+dto.getTel()+dto.getAddr1()+dto.getApplyemail());
			jarray.put(article);
			
		}
		
		json.put("members", jarray);
		return json.toString();

	}
	
	
	@RequestMapping(value = "/sidebar/articlelist.animal", method = RequestMethod.POST)
	@ResponseBody
	public String articlelist(@RequestParam Map<String, String> map,HttpSession session) {
		List<BoardDto> list;
		String ee = map.get("sidebar");
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		list = sidebarService.articleList(map);

		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (BoardDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("subject", dto.getSubject());
			article.put("seq", dto.getSeq());
			article.put("content", dto.getContent());
			article.put("boardtype", dto.getBoardtype());
			article.put("hit", dto.getHit());
			article.put("joindate", dto.getJoindate());
			article.put("email", dto.getEmail());
			jarray.put(article);
		}
		json.put("members", jarray);
		return json.toString();

	}

	@RequestMapping(value = "/sidebar/attention.animal", method = RequestMethod.GET)
	public String attention(@RequestParam Map<String, String> map, HttpServletRequest request) {
		request.setAttribute("sidebar", map.get("acode"));		
		map.put("pg", "1");

		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/myattentionpet";
	}

	@RequestMapping(value = "/sidebar/attention.animal", method = RequestMethod.POST)
	@ResponseBody
	public String attention(@RequestParam Map<String, String> map, HttpServletRequest request,HttpSession session) {
		List<ParcelDto> list;
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		String ee = map.get("sidebar");
		if (ee.equals("sidebar")) {
			list = sidebarService.picklist(map);
		} else {
			list = sidebarService.picklist(map);
		}
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (ParcelDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("seq", dto.getSeq());
			article.put("subject", dto.getSubject());
			article.put("kind", dto.getKind());
			article.put("age", dto.getAge());
			article.put("weight", dto.getWeight());
			article.put("location", dto.getLocation());

			jarray.put(article);
		}
		json.put("members", jarray);
		// System.out.println(json.toString());
		return json.toString();
	}

	@RequestMapping(value = "/sidebar/donation.animal", method = RequestMethod.GET)
	public String donation(@RequestParam Map<String, String> map, HttpServletRequest request) {
		if (map.get("acode") != null) {
			request.setAttribute("sidebar", "sidebar");
		} else {
			request.setAttribute("sidebar", "side");
		}
		request.setAttribute("sidebar", map.get("acode"));
		
		map.put("pg", "1");
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/mydonationlist";
	}

	@RequestMapping(value = "/sidebar/donation.animal", method = RequestMethod.POST)
	@ResponseBody
	public String donation(@RequestParam Map<String, String> map,HttpSession session) {
		List<DonationDto> list;
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		String ee = map.get("sidebar");
		if (ee.equals("sidebar")) {
			list = sidebarService.mydonation(map);
		} else {
			list = sidebarService.donation(map);
		}
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (DonationDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("seq", dto.getSeq());
			article.put("centername", dto.getCentername());
			article.put("gatheringfee", dto.getGatheringfee());
			article.put("cdonationfee", dto.getCdonationfee());
			article.put("cdonationpurpose", dto.getCdonationpurpose());
			article.put("seq", dto.getSeq());
			jarray.put(article);
		}
		json.put("members", jarray);
		return json.toString();
	}

	@RequestMapping(value = "/sidebar/volunteer.animal", method = RequestMethod.GET)

	public String volunteer(@RequestParam Map<String, String> map, HttpServletRequest request) {
		if (map.get("acode") != null) {
			request.setAttribute("sidebar", "sidebar");
		} else {
			request.setAttribute("sidebar", "side");
		}
		request.setAttribute("sidebar", map.get("acode"));
		
		map.put("pg", "1");
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/myvolunteerlist";
	}

	@RequestMapping(value = "/sidebar/volunteer.animal", method = RequestMethod.POST)
	@ResponseBody
	public String volunteer(@RequestParam Map<String, String> map,HttpSession session) {
		 String email=(String) session.getAttribute("email");
		 map.put("email", email);
		List<VolunteerDto> list;	
		String ee = map.get("sidebar");
		if (ee.equals("sidebar")) {
			list = sidebarService.myvolunteer(map);
		} else {
			list = sidebarService.volunteer(map);
		}
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (VolunteerDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("seq", dto.getSeq());
			article.put("centername", dto.getCentername());
			article.put("volunteerkind", dto.getVolunteerkind());
			article.put("volunteerdate", dto.getVolunteerdate());
			article.put("centerlocation", dto.getCenterlocation());
			article.put("tel", dto.getTel());

			jarray.put(article);
		}
		json.put("members", jarray);
		return json.toString();
	}

	@RequestMapping(value = "/sidebar/parcel.animal", method = RequestMethod.GET)

	public String parcel(@RequestParam Map<String, String> map, HttpServletRequest request) {

		if (map.get("acode") != null) {
			request.setAttribute("sidebar", "sidebar");
		} else {
			request.setAttribute("sidebar", "side");
		}
		request.setAttribute("sidebar", map.get("acode"));
		map.put("pg", "1");
		PageNavigation navigator = commonService.makePageNavigation(map);
		navigator.setRoot(request.getContextPath());
		navigator.setKey(map.get("key"));
		navigator.setWord(map.get("word"));
		navigator.setNavigator();
		request.setAttribute("navigator", navigator);
		return "mypage/myparcellist";
	}

	@RequestMapping(value = "/sidebar/parcel.animal", method = RequestMethod.POST)
	@ResponseBody
	public String parcel(@RequestParam Map<String, String> map, Model model,HttpSession session) {
		List<ParcelDto> list;
		String email=(String) session.getAttribute("email");
		map.put("email", email);
		String ee = map.get("sidebar");
		if (ee.equals("sidebar")) {
			list = sidebarService.myparcel(map);
		} else {
			list = sidebarService.parcel(map);
		}
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (ParcelDto dto : list) {
			JSONObject article = new JSONObject();
			article.put("seq", dto.getSeq());
			article.put("subject", dto.getSubject());
			article.put("kind", dto.getKind());
			article.put("age", dto.getAge());
			article.put("weight", dto.getWeight());
			article.put("location", dto.getLocation());

			jarray.put(article);
		}
		json.put("members", jarray);
		return json.toString();
	}
}
