<?php 
	// print_r($_FILES);return;	 
	/*Array
	(
	    [file] => Array
	        (
	            [name] => uploads15285638736643.png
	            [type] => image/png
	            [tmp_name] => C:\Users\Administrator\AppData\Local\Temp\php5A4.tmp
	            [error] => 0
	            [size] => 40006
	        )

	)*/
	 
	/*
		把上传回来的文件，保存到服务端
	*/
		// 获取上传回来的文件
		$file = $_FILES['file'];   //一维数组
		//print_r($file);return;
		/*
		Array
		(
		    [name] => slide_1.jpg
		    [type] => image/jpeg
		    [tmp_name] => C:\Users\Administrator\AppData\Local\Temp\phpF03F.tmp
		    [error] => 0
		    [size] => 101226
		)
		 */
		// 生成一个不会重复的文件名
		/*
			我们在服务端，为了保证上传的文件名不会同名

				时间戳 + 随机数 + 后缀名
		*/
		// 先得到文件的后缀名
		// strrchr(字符串,符号)  得到的是某个符号最后一次出现在字符串的位置开始到字符串结尾的所有字符
		$ext = strrchr($file['name'],".");    //.png
		//尽可能不重复的
		$fileName = time() .date("YmdHis"). rand(10000,99999) . $ext;
		//echo $fileName;return;   //15428836922018112218481217742.jpg
		// 把文件保存到指定的目录
		$bool = move_uploaded_file($file['tmp_name'],"../../static/uploads/" . $fileName);
		//var_dump($bool);  //bool(true)
		// 如果图片上传成功，返回图片的路径，让前端页面可以预览
		$response = ['code'=>0,'msg'=>"操作失败"];
		if($bool){
			$response['code'] = 1;
			$response['msg'] = '操作成功';
			// 把上传的图片的路径带回前端
			// $response['src'] = '/static/uploads/' . $fileName;   
			$response['src'] = '../static/uploads/' . $fileName;   

			/* 

			 /   代表网站根目录
			 ./  代表当前目录
			 ../   代表返回上一级
			*/
		}

		// 以json格式返回
		header("content-type: application/json");
		echo json_encode($response);
 ?>