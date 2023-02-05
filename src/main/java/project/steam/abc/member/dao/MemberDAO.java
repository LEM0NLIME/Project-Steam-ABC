package project.steam.abc.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.steam.abc.member.dto.MemberDTO;
import project.steam.abc.member.dto.MemberDTO2;
import project.steam.abc.page.dto.PageDTO;

@Repository
public class MemberDAO {

	@Autowired
	
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberDTO> inquiryAll(PageDTO pageDTO) {
		
		return sqlSessionTemplate.selectList("memberInquiryAll", pageDTO);
	
	}
	
	public MemberDTO inquryDeatil(String eid) {
		
		return sqlSessionTemplate.selectOne("memberInquiryDetail", eid);
		
	}
	
	public MemberDTO2 preInquiryDetail(String eid) {
		
		return sqlSessionTemplate.selectOne("preMemberInquiryDetail", eid);
		
	}
	
	public void memberInsert(MemberDTO memberDTO) {
		
		sqlSessionTemplate.insert("memberInsert", memberDTO);
		
	}
	
	public void memberUpdate(MemberDTO memberDTO) {
		
		sqlSessionTemplate.update("memberUpdate", memberDTO);
		
	}
	
	public void memberDelete(String eid) {
			
		sqlSessionTemplate.delete("memberDelete", eid);
		
	}
	
	public int countMembers() {
		
		return sqlSessionTemplate.selectOne("countMembers");
	}
	
	public int idCheck(MemberDTO memberDTO) {
		
		return sqlSessionTemplate.selectOne("idCheck", memberDTO);
	}
	
	public MemberDTO memberIdSearch(MemberDTO memberDTO) {
		
		return sqlSessionTemplate.selectOne("memberIdSearch", memberDTO);
	}
	
	public MemberDTO memberPwSearchAsEmail(MemberDTO memberDTO) {
		
		return sqlSessionTemplate.selectOne("memberPwSearchAsEmail", memberDTO);
	}
	
	public MemberDTO memberPwSearchAsPhoneNum(MemberDTO memberDTO) {
		
		return sqlSessionTemplate.selectOne("memberPwSearchAsPhoneNum", memberDTO);
	}
	
	public void memberUpdateAsEmail(MemberDTO memberDTO) {
		
		sqlSessionTemplate.update("memberUpdateAsEmail", memberDTO);
	}
	
	public void memberUpdateAsPhoneNum(MemberDTO memberDTO) {
		
		sqlSessionTemplate.update("memberUpdateAsPhoneNum", memberDTO);
	}
	
}
