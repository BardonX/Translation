package com.px.transdemo.sysmanage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.util.TransApi;

/**
 * 
 * @ClassName: Query
 * @Description: 翻译请求类
 * @author: Bardon
 * @date: 2017年4月30日 下午3:06:10
 * @version1.0
 */
public class Query extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//常量。。规范是大写 已隐藏id与key
	private static final String APP_ID="201703110000420**";
	private static final String KEY="FTMfX96LmQhL2feHpV**";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String query=req.getParameter("query");
		String from=req.getParameter("from");
		String to=req.getParameter("to");
		String result=getResult(query, from, to);
		resp.getWriter().print(result);
	}
	
	/**
	 * 获取翻译结果
	 * @Title: getResult
	 * @Author: Bardon
	 * @Time: 2017年4月30日 下午3:21:31
	 * @params: @param query
	 * @params: @param from
	 * @params: @param to
	 * @params: @return
	 * @return: String
	 * @throws
	 */
	public static String getResult(String query,String from,String to){	
		TransApi api=new TransApi(APP_ID, KEY);	
		return api.getTransResult(query, from, to);
	}
        //test
	public static void main(String[] args) {
		//jason
		System.out.println(getResult("夏天", "zh", "en"));
		
	}
	

}
