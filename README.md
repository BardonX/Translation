功能名称:多国语言翻译系统
核心类：src---com.px.transdemo.sysmanage.action---Query.java

Query.java ------翻译请求类

public static String getResult(String query,String from,String to)
功能：翻译语言
输入：String query---------待翻译的语言
      String from--------待翻译语言的语种
         String to-------要翻译成的语种
输出：String api.getTransResult(query, from, to) Api对象需要导入WebRoot---WEB-INF--lib---Summer.jar包（谭州教育Summer老师封装的jar包）

实际就是调用百度翻译接口，需要注册账号申请接口服务，获取ID与KEY
