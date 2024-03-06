package root.team.com.service.global;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import root.team.com.common.PageNav;

public interface GlobalService {

	default Date dateUpdate(Date date) {
		return null;
	}

	default String fileNameUpdate(MultipartFile imgFile, String saveDirectory) {
		return null;
	}

	default PageNav setPageNav(PageNav pageNav, int pageNum, int pageBlock , int rows_page){
		return null;
	}
}
