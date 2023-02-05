package project.steam.abc.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.steam.abc.customer.dao.CustomerDAO;
import project.steam.abc.customer.dto.CustomerDTO;
import project.steam.abc.customer.dto.SearchCriteria;
@Slf4j
@Service
public class CustomerService {

	//의존관계를 자동으로 설정한다.
	@Autowired
	private  CustomerDAO customerDAO;
	

	
//전체 목록 + 페이징 

public List<CustomerDTO> listPage(SearchCriteria searchCriteria){
	return customerDAO.listPage(searchCriteria);
}

//게시물 총 갯수 
public int listCount(SearchCriteria searchCriteria) {
	return customerDAO.listCount(searchCriteria);
}

//상세 조회 
	public CustomerDTO csSelect(int sno) {
		return customerDAO.select(sno);
	}
	
//게시글 작성
	public void csInsert(CustomerDTO customerDTO) {
		log.info("작성서비스 시작");
		try {
			customerDAO.insert(customerDTO);
			} catch(DataIntegrityViolationException e) {
			e.printStackTrace( );
			}
	}
	
//게시글 수정 
		public void csUpdate(CustomerDTO customerDTO) {
			customerDAO.update(customerDTO);
	}

//게시글 삭제 
		public void csDelete(int sno) {
			customerDAO.delete(sno);
		}
	
}

