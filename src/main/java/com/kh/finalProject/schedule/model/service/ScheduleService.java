package com.kh.finalProject.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.schedule.model.vo.Schedule;

public interface ScheduleService {

	public List<Schedule> getCalendar(Map resultMap);
}
