package com.daowen.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

public abstract class FileUploadBase{
    protected Map<String, String> parameters = new HashMap<String, String>();// 保存普通form表单域
    
    protected String encoding = "utf-8"; // 字符编码，当读取上传表单的各部分时会用到该encoding

    protected UploadFileFilter filter = null; // 文件过滤器, 默认为NULL 不过滤
    
    /** *//** *//** *//**
     * The directory in which uploaded files will be stored, if stored on disk.
     */
    protected int sizeThreshold = DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD;

    /** *//** *//** *//**
     * 
     * The maximum size permitted for the complete request, as opposed to
     * 
     * {@link #fileSizeMax}. A value of -1 indicates no maximum.
     * 
     */
    protected long sizeMax = -1;

    /** *//** *//** *//**
     * The directory in which uploaded files will be stored, if stored on disk.
     */
    protected File repository;
    
    public String getParameter(String key) {
        return parameters.get(key);
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    /** *//** *//** *//**
     * 获取上传文件最大的大小，单位为Byte(字节），为-1时表示无限制
     * @return
     */
    public long getSizeMax() {
        return sizeMax;
    }

    /** *//** *//** *//**
     * 设置上传文件最大的大小，单位为Byte(字节），为-1时表示无限制
     * @param sizeMax
     */
    public void setSizeMax(long sizeMax) {
        this.sizeMax = sizeMax;
    }

    public int getSizeThreshold() {
        return sizeThreshold;
    }

    public void setSizeThreshold(int sizeThreshold) {
        this.sizeThreshold = sizeThreshold;
    }

    /** *//** *//** *//**
     * Returns the directory used to temporarily store files that are larger
     * than the configured size threshold.
     * 
     * @return The directory in which temporary files will be located.
     * 
     * @see #setRepository(java.io.File)
     * 
     */
    public File getRepository() {
        return repository;
    }

    /** *//** *//** *//**
     * Sets the directory used to temporarily store files that are larger than
     * the configured size threshold.
     * 
     * @param repository
     *            The directory in which temporary files will be located.
     * 
     * @see #getRepository()
     * 
     */
    public void setRepository(File repository) {
        this.repository = repository;
    }
    
    /** *//** *//** *//**
     * 获取参数列表
     * @return
     */
    public Map<String, String> getParameters() {
        return parameters;
    }

    /** *//** *//** *//**
     * 获取过滤器
     * @return
     */
    public UploadFileFilter getFilter() {
        return filter;
    }

    /** *//** *//** *//**
     * 设置文件过滤器，不符合过滤器规则的将不被上传
     * @param filter
     */
    public void setFilter(UploadFileFilter filter) {
        this.filter = filter;
    }
    
    /** *//** *//** *//**
     * 验证文件是否有效
     * @param item
     * @return
     */
    protected boolean isValidFile(FileItem item){
        return item == null || item.getName() == "" || item.getSize() == 0 || (filter != null && !filter.accept(item.getName())) ? false : true;
    }
}
 
 
 