package project.steam.abc.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import project.steam.abc.customer.dto.CustomerDTO;
import project.steam.abc.customer.dto.SearchCriteria;
 @Slf4j
@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class CustomerDAO {

	@Autowired
	
//sqlSession 인터페이스의 모든 기능을 구현.
	SqlSessionTemplate sqlSessionTemplate;
	

//전체 조회 + 페이징 
	public List<CustomerDTO> listPage(SearchCriteria searchCriteria) {
		return sqlSessionTemplate.selectList("CustomerListPage",searchCriteria);
	}
	
//게시물 총 갯수 
	public int listCount(SearchCriteria searchCriteria) {
	return sqlSessionTemplate.selectOne("CustomerListCount",searchCriteria);
	}
	
//상세조회
		public  CustomerDTO select(int sno) {
			return sqlSessionTemplate.selectOne("CustomerSelect", sno);
		}
		
//게시글 작성 
		
	public void insert(CustomerDTO customerDTO) {
		log.info("작성DAO 시작");
			sqlSessionTemplate.insert("CustomerInsert", customerDTO);
	}
//게시글 수정 
	public void update(CustomerDTO customerDTO) {
		sqlSessionTemplate.update("CustomerUpdate", customerDTO);
	}

//게시글 삭제 
	public void delete(int sno) {
		sqlSessionTemplate.delete("CustomerDelete", sno);
	}
}
