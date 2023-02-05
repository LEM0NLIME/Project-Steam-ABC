package project.steam.abc.mypage.applicationdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.steam.abc.mypage.applicationdto.ApplicationDTO;
import project.steam.abc.mypage.applicationdto.ApplicationPageDTO;
import project.steam.abc.mypage.applicationdto.ApplicationSearchDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ApplicationDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ApplicationDTO> aplSelectAll() {
		return sqlSessionTemplate.selectList("aplSelectAll");
	}
	
	public ApplicationDTO aplSelectDetail(int aplno) {
		return sqlSessionTemplate.selectOne("aplSelectDetail", aplno);
	}
	
	public List<ApplicationDTO> aplSelectMy(ApplicationDTO applicationDTO) {
		return sqlSessionTemplate.selectList("aplSelectMy", applicationDTO);
	}
	
	public List<ApplicationDTO> aplListPage(ApplicationSearchDTO searchDTO) {
		return sqlSessionTemplate.selectList("aplListPage", searchDTO);
	}
	
	public int aplListCount(ApplicationSearchDTO searchDTO) {
		return sqlSessionTemplate.selectOne("aplListCount", searchDTO);
	}
	
	public List<ApplicationDTO> aplListPageMy(ApplicationPageDTO applicationPageDTO) {
		return sqlSessionTemplate.selectList("aplListPageMy", applicationPageDTO);
	}
	
	public int aplListCountMy(ApplicationPageDTO applicationPageDTO) {
		return sqlSessionTemplate.selectOne("aplListCountMy", applicationPageDTO);
	}
	
	@Transactional
	public void aplInsert(ApplicationDTO applicationDTO) {
		sqlSessionTemplate.insert("aplInsert", applicationDTO);
	}
	
	public void aplUpdate(ApplicationDTO applicationDTO) {
		sqlSessionTemplate.update("aplUpdate", applicationDTO);
	}
	
	public void aplDelete(int aplno) {
		sqlSessionTemplate.delete("aplDelete", aplno);
	}

}
