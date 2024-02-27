package root.team.com.service.global;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public interface GlobalService {

	default Date dateUpdate(Date date) {
		return null;
	}

	default String fileNameUpdate(MultipartFile imgFile, String saveDirectory) {
		return null;
	}
}
