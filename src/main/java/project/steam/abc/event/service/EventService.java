package project.steam.abc.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import project.steam.abc.event.dao.EventDAO;
import project.steam.abc.event.dto.Criteria;
import project.steam.abc.event.dto.EventDTO;

@Service
public class EventService {

	@Autowired
	private EventDAO eventDAO;

	
	//게시물 목록 조회
	public List<EventDTO> eventSelectAll(Criteria cri) throws Exception {
		return eventDAO.selectAll(cri);

	}
	
	//게시물 총 개수
	public int listCount() throws Exception{
		return eventDAO.listCount();
		
	}
	
	

	public EventDTO eventSelect(int eno) {
		return eventDAO.select(eno);

	}

	public void eventInsert(EventDTO eventDTO) {
		try {
			eventDAO.insert(eventDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}

	public void eventUpdate(EventDTO eventDTO) {
		eventDAO.update(eventDTO);
	}

	public void eventDelete(int eno) {
		eventDAO.delete(eno);
	}

	
	
}
