package root.team.com.service.global;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;

@Service("gFileNameUpdate")
@AllArgsConstructor
public class GlobalFileNameUpdateService implements GlobalService {

	public String fileNameUpdate(MultipartFile imgFile, String saveDirectory) {
		
		MultipartFile uploadFile = imgFile;

		String saveFilename = null;
		System.out.println("여기있음");
		if (uploadFile.getSize() != 0) {// 게시글 등록시 첨부파일을 업로드한 경우

			String orgFilename = uploadFile.getOriginalFilename(); // 원본 파일 명
			String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // 난수 생성
			String extension = orgFilename.substring(orgFilename.lastIndexOf(".") + 1); // 확장자 추출
			saveFilename = uuid + "." + extension; // 디스크에 저장할 파일명
			String fileFullPath = saveDirectory + saveFilename; // 디스크에 저장할 파일의 전체 경로

			File dir = new File(saveDirectory);
			if (dir.exists() == false) {
				dir.mkdirs();
			}

			try {
				uploadFile.transferTo(new File(fileFullPath));
			} catch (Exception e) {
				System.out.println("파일 저장 중 예외 발생");
			}
		}
		return saveFilename;
	}

}
