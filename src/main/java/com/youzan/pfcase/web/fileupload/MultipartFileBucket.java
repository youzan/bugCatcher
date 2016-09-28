package com.youzan.pfcase.web.fileupload;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by sunjun on 16/9/28.
 */
public class MultipartFileBucket {

    private MultipartFile multipartFile;

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }
}
