package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**  
 * Description： 
 * Author:lucktyy@gmail.com
 * Date:2014-9-19上午09:26:16
 */
public class GetOssFileUtil {

	private static final String prefix = "http://myshopxx.oss.aliyuncs.com/";
	
	public static void downOssFile(String path,String outputDir) {
		InputStream is = null;
		File outF = null;
		FileOutputStream fos = null;
		try {
			URL url = new URL(prefix+path);
			URLConnection connection = url.openConnection();
			is = connection.getInputStream();
			
			outF = new File(outputDir+path);
			
			File dir = new File(outF.getParent());
			if(!dir.exists()){
				dir.mkdirs();
			}
			
			fos = new FileOutputStream(outF);
			byte[]b = new byte[1024];
			int off = 0;
			int len = 100;
			while((off = is.read(b,0,len))!=-1){
				fos.write(b,0,off);
			}
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fos.flush();
				fos.close();
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
//	  String file = "http://myshopxx.oss.aliyuncs.com//20140304/1393902455326_3.jpg";
//	  String outDir = "G:/";	
//	  downOssFile(file,outDir);
	  
	  String a [] = initData();
	  for(int i=0;i<a.length;i++){
		  String file = a[i];	
		  String outDir = "G:\\s\\";	
		  downOssFile(file,outDir);
	  }
	}
	

	public  static String[] initData(){
		String []a = {
			"67dd74e0gw1f20c2g76rqj20c8085dgb.jpg"
		};
		return a;
	}
	
	{  
//		找不到的图片
//		http://myshopxx.oss.aliyuncs.com//20140226/1393422674246_3.jpg
//		http://myshopxx.oss.aliyuncs.com//20140226/1393422674564_3.jpg
//		http://myshopxx.oss.aliyuncs.com//20140226/1393422674908_3.jpg
//		http://myshopxx.oss.aliyuncs.com//20140226/1393423350334_3.jpg
//		http://myshopxx.oss.aliyuncs.com//20140226/1393423350965_3.jpg
//		http://myshopxx.oss.aliyuncs.com//20140226/1393423351312_3.jpg
	}
}
