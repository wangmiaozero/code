

### echo可以输出字符串，它可以同时输出多个字符串,以,分隔

### print:它也可以输出字符串,它只能输出一个值

### print('abc');

### print_r():更多的用来输出复杂类型：它可以输出复杂数据的key和值

 print_r([1,2,3]);

###var_dump():可以输出复杂类型，它可以输出复杂类型数据的key和value,同时还可以获取value的长度

 var_dump(["abc","a","qq"]);

        # 它也可以进行单行注释，只不过很少用
    
        /* 
        多行注释中可以创建多行文本说明
        开头和结束与js一样
        */
### 声明变量：

  特点：
  1.所有变量的声明必须以$符号做为前缀
  2.变量名区分大小写
  3.变量名的组成由字符，数字，下划线构成

类似js中的弱类型，php在声明变量的时候无需关注类型，系统会根据值进行自动的判断
 $age = 20; //声明变量并同时赋值
  echo $age;
  $name = 'jack';
 echo $name;
  $gender; //相当于变量的声明
 在php中如果声明变量没有赋值，那么这个值默认为null

 ### isset():判断变量是否存在，判断变量是否定义了，同时它还可以判断变量的值是否为null

### 输出结果的细节：在php中如果输出true,那么结果为1，如果输出false,输出结果为null

### empty():判断变量是否为空值，为空的值有：""  0 "0",null,false,array().如果值为以上中的某一个，则返回值

在php中，+只能运算符，意味着当出现+的时候，系统会自动的将+两边的数据转换为数值
    // echo '我的名字叫'+$name;
    // echo "11"+"aa";
    // 在php中字符串连接符使用.
    // echo '我的名字叫'.$name;

$arr = array(1,2,3,true,"abc");

// 关联数组：以键值对的方式来描述数据，类似于js中的对象 {key:value,key:value...}
    // 语法：array($key=>$value,$key=>$value...)
    // $arr = array(
    //     "name" => "jack",
    //     "age" => 20,
    //     "gender" => true
    // );

###count():获取指定数组的长度

 ### unset():它也可以用来删除数组中的某个成员。但是删除了数组的元素之后，并不会对数组元素的索引产生影响，元素还会保留之前的索引。意味着它只是删除了索引位置的元素，并没有动态的改变数组的长度。

 ### global就是用来添加对外部成员的引用注意点：不能在引用的同时对变量赋值，如果想赋值，则需要换下一行赋值

 print_r($GLOBALS); 当前脚本中定义的全局变量也会存储在这个超全局变量中

 定义常量的语法：define(常量名称，常量值，标记是否对大小写敏感false)

### include:1.如果文件载入失败，也不会影响后续代码的执行  2.如果重复载入文件那么被载入的文件的代码会真正的重复执行

   ### include_once:1.如果文件载入失败，也不会影响后续代码的执行 2.如果重复载入文件，最终也只会载入一次

  ### require：1.如果文件载入失败，那么后续不再执行  2.如果重复载入文件那么被载入的文件的代码会真正的重复执行

   ### require_once:1.如果文件载入失败，那么后续不再执行 2.如果重复载入文件，最终也只会载入一次

 ### strlen():可以获取指定字符串的长度

### mb_strlen():没有设置编码就使用当前php的默认编码

### time():从 Unix 纪元（格林威治时间 1970-01-01 00:00:00）到当前时间的秒数

 ### header("Content-Type:text/html");

### header("Content-Type:image/jpeg");

 设置当前页面的返回值的类型是图片格式，意味着后期浏览器接收了返回值之后，会按照图片格式进行解析

### file_get_contents:读取文件内容，如果读取成功，就会返回一个字符串类型的值（文件内容），如果读取失败，就会返回false;

### file_put_contents(文件路径，需要写入的内容,FILE_APPEND ):将指定的内容写入到文件,同时返回当前成功写入的字符的数量

   FILE_APPEND:设置当前的写入方式为追加

### $_GET可以用来接收客户端以get方式传递的参数，注意只能接收以get方式传递的数据

###如果是以post方式发送请求，那么就以$_POST来接收参数

 print_r($_POST);

action:就是提交的目标地址 $_SERVER["PHP_SELF"]:可以获取当前文件的路径.它可以自动的获取当前文件的路径，避免由于文件名称或者路径改变带来的手动修改代码的问题
 json:javascript object notation:js对象的描述
语法特点：
// 1.要求属性和值都使用""包含，除非属性值是数字
// 2.json文件不能包含任何的注释
// 3.没有undefined

### 读取数据文件--json

$jsonStr = file_get_contents("music.json");
将json字符串转换为php数组

###json_decode:可以将json格式的字符串转换为php数组或者对象。如果发现json格式的数据是使用[]描述的，那么就可以将这个字符串转换为数组，如果是{}描述那么就可以转换为对象.方法的第二个参数的作用是确认转换的数据格式，默认转换为对象，如果写true,那么会将数据转换为数组

### json_encode:可以将php数组或者对象转换为json格式的字符串



 ### mysql_fetch_row()：返回索引数组

  ### mysql_fetch_assoc()：返回关联数组。

 ### mysql_fetch_array()：返回混合数组。



# Call to undefined function mysql_connect() 解决方法汇总

2018年09月11日 19:54:27 [To_Drill](https://me.csdn.net/zzf1510711060) 阅读数：102 标签： [mysql	](http://so.csdn.net/so/search/s.do?q=mysql&t=blog)[php	](http://so.csdn.net/so/search/s.do?q=php&t=blog)[mysql_connect()	](http://so.csdn.net/so/search/s.do?q=mysql_connect()&t=blog)[centos](http://so.csdn.net/so/search/s.do?q=centos&t=blog)

版权声明：https://blog.csdn.net/zzf1510711060	https://blog.csdn.net/zzf1510711060/article/details/82631254

# **方式一：**

在PHP代码中使用phpinfo()函数查看PHP基本信息

从PHP5.0开始mysql_connect()就不推荐使用了，到PHP7.0就直接被废弃了，如果PHP为7.0及以上版本的话用mysqli_connect()代替

# **方式二：**

安装的php缺少mysql模块导致

**CentOs安装mysql模块:**

yum install php-mysql -y

如果安装了之后报下面的警告

Headers and client library minor version mismatch. Headers:

这是由于高版本的MySQL，低版本的MySQL Client API引起的

这时候可以先卸载刚才的php-mysql

yum remove php-mysql -y

然后

yum install php-mysqlnd -y

最后重启apache

systemctl restart httpd

**Ubuntu安装mysql模块:**

apt-get install php5-mysql 

sudo dpkg-reconfigure php5-mysql 

sudo /etc/init.d/mysql restart

sudo /etc/init.d/apache2 restart

# 方式三：

如果前两种方法都不能解决，试着在php.ini配置文件中打开mysql模块的扩展

php.ini文件中查找 ;extension="有关的mysql模块" 把前面的;去掉

然后确保extension的dir指向的是扩展存放的目录

windows一般在ext下面，centos在/usr/lib64/php/modules下面

以上信息都可以在phpinfo打印出的信息查找到

不过我遇到这个问题的时候，只需要安装php-mysql模块就好了，并不需要修改php.ini

我的环境是centos7，php版本是php5.4

 

