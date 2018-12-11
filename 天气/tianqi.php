<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <script src="../../static/assets/vendors/jquery/jquery.js"></script>
    <script>
        $.ajax({
            type:"GET",
            url:"http://v.juhe.cn/weather/index",
            typedata:"json",
            key:"207f7a074eecbbf504d5c6ae90531828",
            cityname:"武汉"
            success:function(res){
                console.log(res);
            }
        })
    </script>
</body>
</html>