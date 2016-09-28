package com.youzan.pfcase.web.fileupload;

import com.youzan.pfcase.web.fileupload.storage.StorageFileNotFoundException;
import com.youzan.pfcase.web.fileupload.storage.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import javax.validation.Valid;
import java.io.IOException;
import java.util.stream.Collectors;

/**
 * Created by sunjun on 16/9/27.
 */
@Controller
@RequestMapping("fileupload")
public class FileUploadController {

    @Autowired
    private StorageService storageService;

    @Autowired
    private MultipartFileBucketValidator multipartFileBucketValidator;

    @InitBinder("multipartFileBucket")
    protected void initBinderMultipartFileBucket(WebDataBinder binder) {
        binder.setValidator(multipartFileBucketValidator);
    }

    @ModelAttribute
    public MultipartFileBucket setUpForm() {
        return new MultipartFileBucket();
    }

    //file list
    @RequestMapping(method = RequestMethod.GET)
    public String listUploadedFiles(Model model) throws IOException {

        model.addAttribute("active_fileUpload", true);
        model.addAttribute("files", storageService
                .loadAll()
                .map(path ->
                        MvcUriComponentsBuilder
                                .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
                                .build().toString())
                .collect(Collectors.toList()));

        return "fileupload/uploadForm";
    }

    //download file
    @RequestMapping(value = "/files/{filename:.+}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity
                .ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+file.getFilename()+"\"")
                .body(file);
    }

    //upload file
    @RequestMapping(method = RequestMethod.POST)
    public String handleFileUpload(@Valid MultipartFileBucket multipartFileBucket, BindingResult result, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("active_fileUpload", true);
            model.addAttribute("files", storageService
                    .loadAll()
                    .map(path ->
                            MvcUriComponentsBuilder
                                    .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
                                    .build().toString())
                    .collect(Collectors.toList()));

            return "fileupload/uploadForm";
        }
        storageService.store(multipartFileBucket.getMultipartFile());

        return "redirect:/fileupload";
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
        return ResponseEntity.notFound().build();
    }

}


