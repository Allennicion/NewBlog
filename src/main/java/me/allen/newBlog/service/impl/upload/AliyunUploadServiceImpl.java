package me.allen.newBlog.service.impl.upload;

import cn.hutool.core.util.ObjectUtil;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.Bucket;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import me.allen.newBlog.constant.NBV5;
import me.allen.newBlog.constant.UploadConstant;
import me.allen.newBlog.constant.uploader.LayUploader;
import me.allen.newBlog.constant.uploader.MdUploader;
import me.allen.newBlog.constant.uploader.NkUploader;
import me.allen.newBlog.enums.ObjectKeyEnum;
import me.allen.newBlog.mapper.ParamMapper;
import me.allen.newBlog.mapper.UploadMapper;
import me.allen.newBlog.model.entity.Param;
import me.allen.newBlog.model.entity.Upload;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.NumberUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 阿里云文件上传Service
 * created by allen on 2018/7/17 at 14:46
 *
 * @author allen
 */
@Slf4j
@Service("aliyunUpload")
@Transactional(rollbackFor = Exception.class)
public class AliyunUploadServiceImpl extends ServiceImpl<UploadMapper, Upload> implements UploadService<Object> {

    private final ParamMapper paramMapper;

    // 阿里云客户端
    private OSSClient ossClient;

    private String BACKET_NAME;
    private String fileName = getFileNameNew() + ".jpg";
    private String floder = createNewDir();

    @Autowired
    public AliyunUploadServiceImpl(ParamMapper paramMapper) {
        this.paramMapper = paramMapper;
    }

    @Override
    public UploadConstant.Method getUploadMethod() {
        return UploadConstant.Method.QINIU;
    }

    @Override
    public Object doUpload(String sessionUserId, MultipartFile fileObj, String reqType, Map<Object, Object> paramMap) {
        //初始化OSSClient
        getOssClient();

        log.info("上传[" + fileObj.getContentType() + "]类型文件");
        try {
            String md5key = uploadObject2OSS(ossClient, fileName, fileObj.getInputStream(), floder);
            log.info("上传至阿里云服务器成功！，上传后的文件MD5数字唯一签名：[{}]", md5key);
            if (LAYUI_UPLOADER.equalsIgnoreCase(reqType)) {
                return new LayUploader().ok("上传至阿里云服务器成功！", md5key);
            } else if (NKEDITOR_UPLOADER.equalsIgnoreCase(reqType)) {
                return new NkUploader().ok("上传成功！", md5key);
            } else if (EDITORMD_UPLOADER.equalsIgnoreCase(reqType)) {
                return new MdUploader().ok("上传成功！", md5key);
            } else {
                return ResultBeanObj.ok("上传成功！", md5key);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return ResultBeanObj.error("上传至阿里云服务器失败");
    }

    @Override
    public Upload baseUpload(String sessionUserId, MultipartFile fileObj, Map<Object, Object> paramMap) {
        //初始化OSSClient
        getOssClient();
        log.info("上传[" + fileObj.getContentType() + "]类型文件");

        try {
            String md5key = uploadObject2OSS(ossClient, fileName, fileObj.getInputStream(), floder);
            log.info("上传至阿里云服务器成功！，上传后的文件MD5数字唯一签名：[{}]", md5key);

            Upload u = Upload.builder()
                    .diskPath("")
                    .virtualPath(md5key)
                    .upload(new Date())
                    .type(fileObj.getContentType())
                    .userId(sessionUserId)
                    .build();

            Object okc = paramMap.get("objectKey");
            if (ObjectUtil.isNotEmpty(okc)) {
                u.setObjectKey(ObjectKeyEnum.getObjectKeyEnumByCode(NumberUtils.parseNumber(okc.toString(), Integer.class)));
            }
            Object okcId = paramMap.get("objectKeyId");
            if (ObjectUtil.isNotEmpty(okcId)) {
                u.setObjectKeyId(okcId.toString());
            }
            return u;
        } catch (IOException e) {
            throw new RuntimeException("上传文件至阿里云失败", e);
        }

    }

    /**
     * 阿里云初始化
     * @return
     */
    private void getOssClient() {
        BACKET_NAME = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.ALIYUN_BUCKET)).getValue();
        String accessKey = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.ALIYUN_ACCESS_KEY)).getValue();
        String secretKey = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.ALIYUN_SECRET_KEY)).getValue();
        String endpoint = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.ALIYUN_ENDPOINT)).getValue();
        //密钥配置
        //初始化OSSClient
        ossClient = new OSSClient(endpoint,accessKey, secretKey);
    }

    /**
     * 创建存储空间
     * @param ossClient      OSS连接
     * @param bucketName 存储空间
     * @return
     */
    public String createBucketName(OSSClient ossClient,String bucketName){
        //存储空间
        final String bucketNames=bucketName;
        if(!ossClient.doesBucketExist(bucketName)){
            //创建存储空间
            Bucket bucket=ossClient.createBucket(bucketName);
            log.info("创建存储空间成功");
            return bucket.getName();
        }
        return bucketNames;
    }

    /**
     * 删除存储空间buckName
     * @param ossClient  oss对象
     * @param bucketName  存储空间
     */
    public void deleteBucket(OSSClient ossClient, String bucketName){
        ossClient.deleteBucket(bucketName);
        log.info("删除" + bucketName + "Bucket成功");
    }

    /**
     * 创建模拟文件夹
     * @param ossClient oss连接
     * @param bucketName 存储空间
     * @param folder   模拟文件夹名如"qj_nanjing/"
     * @return  文件夹名
     */
    public  String createFolder(OSSClient ossClient,String bucketName,String folder){
        //文件夹名
        final String keySuffixWithSlash =folder;
        //判断文件夹是否存在，不存在则创建
        if(!ossClient.doesObjectExist(bucketName, keySuffixWithSlash)){
            //创建文件夹
            ossClient.putObject(bucketName, keySuffixWithSlash, new ByteArrayInputStream(new byte[0]));
            log.info("创建文件夹成功");
            //得到文件夹名
            OSSObject object = ossClient.getObject(bucketName, keySuffixWithSlash);
            String fileDir=object.getKey();
            return fileDir;
        }
        return keySuffixWithSlash;
    }

    /**
     * 根据key删除OSS服务器上的文件
     * @param ossClient  oss连接
     * @param bucketName  存储空间
     * @param folder  模拟文件夹名 如"qj_nanjing/"
     * @param key Bucket下的文件的路径名+文件名 如："upload/cake.jpg"
     */
    public void deleteFile(OSSClient ossClient, String bucketName, String folder, String key){
        ossClient.deleteObject(bucketName, folder + key);
        log.info("删除" + bucketName + "下的文件" + folder + key + "成功");
    }

    /**
     * 上传图片至OSS
     * @param ossClient  oss连接
     * @param folder 模拟文件夹名 如"qj_nanjing/"
     * @return String 返回的唯一MD5数字签名
     * */
    public String uploadObject2OSS(OSSClient ossClient, String fileName, InputStream is, String folder) throws IOException {
        String resultStr = null;
        //文件名
        //String fileName = file.getName();
        //文件大小
        //Long fileSize = file.length();
        //创建上传Object的Metadata
        ObjectMetadata metadata = new ObjectMetadata();
        //上传的文件的长度
        metadata.setContentLength(is.available());
        //指定该Object被下载时的网页的缓存行为
        metadata.setCacheControl("no-cache");
        //指定该Object下设置Header
        metadata.setHeader("Pragma", "no-cache");
        //指定该Object被下载时的内容编码格式
        metadata.setContentEncoding("utf-8");
        //文件的MIME，定义文件的类型及网页编码，决定浏览器将以什么形式、什么编码读取文件。如果用户没有指定则根据Key或文件名的扩展名生成，
        //如果没有扩展名则填默认值application/octet-stream
        metadata.setContentType(getContentType(fileName));
        //指定该Object被下载时的名称（指示MINME用户代理如何显示附加的文件，打开或下载，及文件名称）
        //metadata.setContentDisposition("filename/filesize=" + fileName + "/" + fileSize + "Byte.");
        //上传文件   (上传文件流的形式)
        PutObjectResult putResult = ossClient.putObject(BACKET_NAME, folder + "/" + fileName, is, metadata);
        //解析结果
        resultStr = putResult.getETag();

        return resultStr;
    }

    /**
     * 通过文件名判断并获取OSS服务文件上传时文件的contentType
     * @param fileName 文件名
     * @return 文件的contentType
     */
    public  String getContentType(String fileName){
        //文件的后缀名
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        if(".bmp".equalsIgnoreCase(fileExtension)) {
            return "image/bmp";
        }
        if(".gif".equalsIgnoreCase(fileExtension)) {
            return "image/gif";
        }
        if(".jpeg".equalsIgnoreCase(fileExtension) || ".jpg".equalsIgnoreCase(fileExtension)  || ".png".equalsIgnoreCase(fileExtension) ) {
            return "image/jpeg";
        }
        if(".html".equalsIgnoreCase(fileExtension)) {
            return "text/html";
        }
        if(".txt".equalsIgnoreCase(fileExtension)) {
            return "text/plain";
        }
        if(".vsd".equalsIgnoreCase(fileExtension)) {
            return "application/vnd.visio";
        }
        if(".ppt".equalsIgnoreCase(fileExtension) || "pptx".equalsIgnoreCase(fileExtension)) {
            return "application/vnd.ms-powerpoint";
        }
        if(".doc".equalsIgnoreCase(fileExtension) || "docx".equalsIgnoreCase(fileExtension)) {
            return "application/msword";
        }
        if(".xml".equalsIgnoreCase(fileExtension)) {
            return "text/xml";
        }
        //默认返回类型
        return "image/jpeg";
    }

    /**
     * 为文件重新命名，命名规则为当前系统时间毫秒数
     */
    private String getFileNameNew() {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return fmt.format(new Date());
    }

    /**
     * 以当前日期为名，创建新文件夹
     */
    private String createNewDir() {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
        return fmt.format(new Date());
    }
}
