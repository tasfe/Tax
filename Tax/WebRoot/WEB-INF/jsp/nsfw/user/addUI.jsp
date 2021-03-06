<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>用户管理</title>
     <script type="text/javascript" src="${basePath }js/datepicker/WdatePicker.js"></script>
     <script type="text/javascript">
     	function doVerification(){
     		var account = $("#accountID").val();
     		$.ajax({
     			type : "POST",
     			url : "${basePath}nsfw/user_verification.action?time="+new Date().getTime(),
     			data : "user.account="+account,
     			success : function(msg){
     				if("true" != msg){
     					alert("您输入的账号应经存在，请重新输入！");
     					$("#accountID").focus();
     				}
     				
     			}
     		})
     	}
     	
     	function doSubmit(){
     	 var falg = true;
     		if($("#userNameID").val() == ""){
     			alert("用户名不能为空。");
     			$("#userNameID").focus();
     			falg = false;
     		}
     		if($("#passwordID").val() == ""){
     			alert("密码不能为空。");
     			$("#passwordID").focus();
     			falg = false;
     		}
     		var account = $("#accountID").val();
     		var id = $("#userId").val();
     		$.ajax({
     			type : "POST",
     			url : "${basePath}nsfw/user_verification.action?time="+new Date().getTime(),
     			data : "user.account="+account+"&user.id="+id,
     			success : function(msg){
     				if("true" != msg){
     					alert("您输入的账号应经存在，请重新输入！");
     					$("#accountID").focus();
     				}
     				else{
	     				if(falg){
	     					document.forms[0].submit();
	     				}
     				}
     			}
     		})
     	}
     </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath}nsfw/user_add.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div></div>
    <div class="tableH2">新增用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
            <td><s:select name="user.dept" list="#{'部门A':'部门A','部门B':'部门B'}"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
                <input type="file" name="headImg"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><s:textfield name="user.userName" id="userNameID" value=""/> </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><s:textfield name="user.account" id="accountID" onchange="doVerification()"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><s:textfield name="user.password" id="passwordID"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <td><s:radio list="#{'true':'男','false':'女'}" name="user.sex" value="true"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td>
            	<s:checkboxlist list="roleList" name="roleId" listKey="id" listValue="name"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><s:textfield name="user.email"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><s:textfield name="user.mobile"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td><s:textfield id="birthday" name="user.birthday"  readonly="true" 
            onfocus="WdatePicker({'skin':'default','dateFmt':'yyyy-MM-dd'});">
            	<s:param name="value"><s:date name="user.birthday" format="yyyy-MM-dd"/></s:param>
            	</s:textfield>
            </td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">状态：</td>
            <td><s:radio list="#{'1':'有效','0':'无效'}" name="user.state" value="1"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><s:textarea name="user.memo" cols="75" rows="3"/></td>
        </tr>
    </table>
    <div class="tc mt20">
        <input type="button" class="btnB2" onclick="doSubmit()" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>