<%--
  Created by IntelliJ IDEA.
  User: 16095
  Date: 2022/4/9
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>

        $.ajax({
            url:" ",
            type:"post",
            dataType:"json",
            data:{

            },
            success:function (reg) {
                if (reg.state==1){
                    alert(reg.msg);
                } else {
                    alert(reg.msg)
                }

            }
        })

    </script>
</head>
<body>

</body>
</html>
