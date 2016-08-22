package com.youzan.pfcase.web.my;

import com.google.common.base.Function;
import com.google.common.collect.Maps;

import com.youzan.pfcase.domain.*;
import com.youzan.pfcase.service.AccountService;
import com.youzan.pfcase.service.CaselistService;
import com.youzan.pfcase.service.TaskService;
import com.youzan.pfcase.service.TaskcaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MyController {

	@Autowired
	protected AccountService accountService;

	@Autowired
	protected TaskService taskService;

	@Autowired
	protected TaskcaseService taskcaseService;

	@Autowired
	protected CaselistService caselistService;

	@RequestMapping(method = RequestMethod.GET)
	public String my(ModelMap model) throws Exception {
//		Account account = accountService.getAccount("admin");
//		model.addAttribute("message", account.getPassword());

//		try {
//			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			Account account = userDetails.getAccount();
//			model.addAttribute("message", account.getEmail());
//		} catch (Exception e) {
//			model.addAttribute("message", "请登录.");
//		}


		List<Task> allTask = taskService.getAllTask();
		Map<String, Task> taskMap = Maps.uniqueIndex(allTask, new Function<Task, String>() {
			@Override
			public String apply(Task task) {
				return Integer.toString(task.getTaskid());
			}
		});
		model.addAttribute("taskMap", taskMap);

		//

		List<Taskcase> allTaskcase = taskcaseService.getAllTaskcase();
		Map<String, List<Taskcase>> taskcaseMap = new HashMap<String, List<Taskcase>>();
		for (Taskcase taskcase : allTaskcase) {
			String taskid = Integer.toString(taskcase.getTaskid());
			if (taskcaseMap.containsKey(taskid)) {
				taskcaseMap.get(taskid).add(taskcase);
			} else {
				List taskcaseList = new ArrayList<Taskcase>();
				taskcaseList.add(taskcase);
				taskcaseMap.put(Integer.toString(taskcase.getTaskid()), taskcaseList);
			}
		}
		model.addAttribute("taskcaseMap", taskcaseMap);




		//

		List<Caselist> allCaselist = caselistService.getAllCaselist();
		Map<String, Caselist> caselistMap = Maps.uniqueIndex(allCaselist, new Function<Caselist, String>() {
			@Override
			public String apply(Caselist caselist) {
				return Integer.toString(caselist.getCaseid());
			}
		});
		model.addAttribute("caselistMap", caselistMap);


		model.addAttribute("active_my", true);


























		return "my";
	}
}