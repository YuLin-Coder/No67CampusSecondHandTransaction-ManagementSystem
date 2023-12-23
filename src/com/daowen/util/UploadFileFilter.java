 
package com.daowen.util;

public interface UploadFileFilter {
    /** *//** *//** *//**
     * 通过文件名后缀判断文件是否被接受
     * @param filename 文件名，不包括路径
     * @return
     */
    public boolean accept(String filename);
    
    
}
