package me.allen.newBlog.service.impl.upload;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import me.allen.newBlog.constant.UploadConstant;
import me.allen.newBlog.constant.uploader.LayUploader;
import me.allen.newBlog.constant.uploader.MdUploader;
import me.allen.newBlog.constant.uploader.NkUploader;
import me.allen.newBlog.mapper.UploadMapper;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.entity.Upload;
import me.allen.newBlog.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

/**
 * created by allen on 2018/7/17 at 10:33
 * 本地上传的实现类
 *
 * @author allen
 */
@Slf4j
@Service("localUpload")
@Transactional(rollbackFor = Exception.class)
public class LocalUploadServiceImpl extends ServiceImpl<UploadMapper, Upload> implements UploadService<Object> {

    private final UploadMapper uploadMapper;

    @Autowired
    public LocalUploadServiceImpl(UploadMapper uploadMapper) {
        this.uploadMapper = uploadMapper;
    }

    @Override
    public UploadConstant.Method getUploadMethod() {
        return UploadConstant.Method.LOCAL;
    }

    @Override
    public Object doUpload(Long sessionUserId, MultipartFile fileObj, String reqType, Map<Object, Object> paramMap) {
        try {
            Upload upload = baseUpload(sessionUserId, fileObj, paramMap);
            uploadMapper.insert(upload);
            if (LAYUI_UPLOADER.equalsIgnoreCase(reqType)) {
                return new LayUploader().ok("上传成功！", upload.getVirtualPath());
            } else if (NKEDITOR_UPLOADER.equalsIgnoreCase(reqType)) {
                return new NkUploader().ok("上传成功！", upload.getVirtualPath());
            } else if (EDITORMD_UPLOADER.equalsIgnoreCase(reqType)) {
                return new MdUploader().ok("上传成功！", upload.getVirtualPath());
            } else {
                return ResultBeanObj.ok("上传成功！", upload.getVirtualPath());
            }
        } catch (IOException e) {
            e.printStackTrace();
            log.error("上传图片/文件失败，错误信息：{}", e.getMessage());
            if (LAYUI_UPLOADER.equalsIgnoreCase(reqType)) {
                return new LayUploader().err("上传图片/文件失败，错误信息：" + e.getLocalizedMessage());
            } else if (NKEDITOR_UPLOADER.equalsIgnoreCase(reqType)) {
                return new NkUploader().err("上传图片/文件失败，错误信息：" + e.getLocalizedMessage());
            } else if (EDITORMD_UPLOADER.equalsIgnoreCase(reqType)) {
                return new MdUploader().err("上传图片/文件失败，错误信息：" + e.getLocalizedMessage());
            } else {
                return ResultBeanObj.error("上传图片/文件失败，错误信息：" + e.getLocalizedMessage());
            }
        }
    }
}
