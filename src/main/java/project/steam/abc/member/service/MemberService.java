package project.steam.abc.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.steam.abc.member.dao.MemberDAO;
import project.steam.abc.member.dto.MemberDTO;
import project.steam.abc.member.dto.PreMemberDTO;
import project.steam.abc.member.pagedto.MemberPageDTO;

@Service
public class MemberService {

	@Autowired
	
	private MemberDAO memberDAO;
	
	public List<MemberDTO> memberInquiryAll(MemberPageDTO pageDTO) {
		
		return memberDAO.inquiryAll(pageDTO);
		
		}
	
		public MemberDTO memberInquiryDetail(String eid) {
			
		return memberDAO.inquryDeatil(eid);
		
		}
		
		public PreMemberDTO memberPreInquiryDetail(String eid) {
			
		return memberDAO.preInquiryDetail(eid);
		
		}
		
		public void memberInsert(MemberDTO memberDTO) {
			
		memberDAO.memberInsert(memberDTO);
		
		}
		
		public void memberUpdate(MemberDTO memberDTO) {
			
		memberDAO.memberUpdate(memberDTO);
		
		}
		
		public void memberDelete(String eid) {
			
		memberDAO.memberDelete(eid);
		
		}
		
		public int countMembers() {
			
		return memberDAO.countMembers();
		
		}
		
		public int idCheck(MemberDTO memberDTO) {
			
		return memberDAO.idCheck(memberDTO);
			
		}
		
		public MemberDTO memberIdSearch(MemberDTO memberDTO) {
			
		return memberDAO.memberIdSearch(memberDTO);
		
		}
		
		public MemberDTO memberPwSearchAsEmail(MemberDTO memberDTO) {
			
			return memberDAO.memberPwSearchAsEmail(memberDTO);
			
			}
		
		public MemberDTO memberPwSearchAsPhoneNum(MemberDTO memberDTO) {
			
			return memberDAO.memberPwSearchAsPhoneNum(memberDTO);
			
			}
		
		public void memberUpdateAsEmail(MemberDTO memberDTO) {
			
			memberDAO.memberUpdateAsEmail(memberDTO);
		}
		
		public void memberUpdateAsPhoneNum(MemberDTO memberDTO) {
			
			memberDAO.memberUpdateAsPhoneNum(memberDTO);
		}
		
}
