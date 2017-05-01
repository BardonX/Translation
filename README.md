# Translation
跟Summer老师学习的java多国语言互译系统
该系统是一个简单的web系统
其核心代码主要是用了百度翻译的工具包，将前台传过来的要翻译的语言query、语言类型from、要翻译成的语言to三个参数进行处理，返回new TransApi(id,key).getTransResult(query,from,to);返回的是一个json格式的数据串，前台使用ajax技术进行异步操作，使用$.parseJSON(data)返回一个json，显示在页面。这里同时使用了音频标签，当点击小图片，会读出翻译的语言 var obj1 =$('<audio src=http://fanyi.baidu.com/gettts?lan='+to+'&text='+str+'&spd=5&source=web autoplay></audio>');
一个简单的小项目，也是对之前的知识做到温故知新吧！
