package project.steam.abc.mypage.applicationservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import project.steam.abc.mypage.applicationdao.ApplicationDAO;
import project.steam.abc.mypage.applicationdto.ApplicationDTO;
import project.steam.abc.mypage.applicationdto.ApplicationPageDTO;
import project.steam.abc.mypage.applicationdto.ApplicationSearchDTO;

@Service
public class ApplicationService {
	
	@Autowired
	private ApplicationDAO applicationDAO;
	
	public List<ApplicationDTO> aplSelectAll() {
		return applicationDAO.aplSelectAll();
	}
	
	public ApplicationDTO aplSelectDetail(int aplno) {
		return applicationDAO.aplSelectDetail(aplno);
	}
	
	public List<ApplicationDTO> aplSelectMy(ApplicationDTO applicationDTO) {
		return applicationDAO.aplSelectMy(applicationDTO);
	}
	
	public List<ApplicationDTO> aplListPage(ApplicationSearchDTO searchDTO) {
		return applicationDAO.aplListPage(searchDTO);
	}
	
	public int aplListCount(ApplicationSearchDTO searchDTO) {
		return applicationDAO.aplListCount(searchDTO);
	}
	
	public List<ApplicationDTO> aplListPageMy(ApplicationPageDTO applicationPageDTO) {
		return applicationDAO.aplListPageMy(applicationPageDTO);
	}
	
	public int aplListCountMy(ApplicationPageDTO applicationPageDTO) {
		return applicationDAO.aplListCountMy(applicationPageDTO);
	}
	
	public void aplInsert(ApplicationDTO applicationDTO) {
		try {
			applicationDAO.aplInsert(applicationDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	public void aplUpdate(ApplicationDTO applicationDTO) {
		applicationDAO.aplUpdate(applicationDTO);
	}
	
	public void aplDelete(int aplno) {
		applicationDAO.aplDelete(aplno);
	}

}
