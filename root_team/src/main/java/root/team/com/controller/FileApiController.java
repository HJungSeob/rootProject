package root.team.com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/tui-editor")
public class FileApiController {
	
	@PostMapping("/image-upload.do")
	public String uploadEditorImage(@RequestParam final MultipartFile image, HttpServletRequest request) {
		
		String uploadDir = request.getServletContext().getRealPath("resources/uploads/");
		
		if (image.isEmpty()) {
			return "";
		}
		String orgFilename = image.getOriginalFilename(); // 원본 파일 명
		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // 난수 생성
		String extension = orgFilename.substring(orgFilename.lastIndexOf(".") + 1); // 확장자 추출
		String saveFilename = uuid + "." + extension; // 디스크에 저장할 파일명
		String fileFullPath = Paths.get(uploadDir, saveFilename).toString(); // 디스크에 저장할 파일의 전체 경로

		// uploadDir에 해당되는 디렉터리가 없으면, uploadDir에 포함되는 전체 디렉터리 생성
		File dir = new File(uploadDir);
        if (dir.exists() == false) {
            dir.mkdirs();
        }
		
        try {
            // 파일 저장 (write to disk)
            File uploadFile = new File(fileFullPath);
            image.transferTo(uploadFile);
            return saveFilename;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        
	}
	
	// /image-print 경로에 대한 GET 요청에 대한 응답으로 GIF, JPEG, PNG 이미지를 반환할 수 있도록 설정
	@GetMapping(value = "/image-print.do", produces = { MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    public byte[] printEditorImage(@RequestParam final String filename, HttpServletRequest request) {
		
		String uploadDir = request.getServletContext().getRealPath("resources/uploads/");
		
        // 업로드된 파일의 전체 경로
        String fileFullPath = Paths.get(uploadDir, filename).toString();

        // 파일이 없는 경우 예외 throw
        File uploadedFile = new File(fileFullPath);
        if (uploadedFile.exists() == false) {
            throw new RuntimeException();
        }

        try {
            // 이미지 파일을 byte[]로 변환 후 반환
            byte[] imageBytes = Files.readAllBytes(uploadedFile.toPath());
            return imageBytes;

        } catch (IOException e) {
            // 예외 처리는 따로 해주는 게 좋습니다.
            throw new RuntimeException(e);
        }
    }
}
