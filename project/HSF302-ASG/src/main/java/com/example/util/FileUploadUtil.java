package com.example.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class FileUploadUtil {

    private static final String UPLOAD_DIR = "D:/uploads/avatar/";

    public static String saveFile(MultipartFile file) {
        try {
            // tạo thư mục nếu chưa tồn tại
            File dir = new File(UPLOAD_DIR);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File dest = new File(dir, fileName);

            file.transferTo(dest);

            return fileName;
        } catch (Exception e) {
            throw new RuntimeException("Upload failed", e);
        }
    }
}
