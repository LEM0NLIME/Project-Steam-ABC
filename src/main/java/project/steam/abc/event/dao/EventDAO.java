package project.steam.abc.event.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.steam.abc.event.dto.Criteria;
import project.steam.abc.event.dto.EventDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class EventDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//게시물 목록 조회
	public List<EventDTO> selectAll(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectList("EventselectAll", cri);

	}
	
	//게시물 총 개수
	public int listCount() throws Exception{
		return sqlSessionTemplate.selectOne("EventlistCount");
		
		
	}
	

	public EventDTO select(int eno) {
		return sqlSessionTemplate.selectOne("Eventselect", eno);

	}
	
	@Transactional
	
	public void insert(EventDTO eventDTO) {
		sqlSessionTemplate.insert("Eventinsert", eventDTO);
	}
	
	public void update (EventDTO eventDTO) {
		sqlSessionTemplate.update("Eventupdate", eventDTO);
	}

	public void delete(int eno) {
		sqlSessionTemplate.delete("Eventdelete",eno);
	}
}
