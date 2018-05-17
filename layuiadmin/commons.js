//var domain = "http://localhost/";
var domain = "http://47.98.232.164/";
var sessionLoginUser = sessionStorage.getItem("loginUser");
if(undefined == sessionLoginUser ||
	null == sessionLoginUser ||
	"" == sessionLoginUser){
		window.location.href = "/layuiAdmin/views/login.html";
	//return false;
}
var loginUser = JSON.parse(sessionLoginUser);
document.getElementById("login_user").innerHTML = loginUser.loginName;

layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).use(['element', 'table'], function(){
	var $ = layui.$
	,layer = layui.layer;

	$.ajaxSetup({
		contentType:"application/json;charset=utf-8",
		statusCode: {
			401: function() {
				layer.msg('未登录，请先登录');
				window.location.href = "/layuiAdmin/views/login.html";
			},
			404: function() {
				layer.msg("数据获取/输入失败，没有此服务。404");
			},
			504: function() {
				layer.msg("数据获取/输入失败，服务器没有响应。504");
			},
			500: function() {
				layer.msg("服务器有误。500");
			},
			502: function() {
			   layer.msg("网关超时。502");
			}
		}
	});

	$.ajax({
		type: 'GET',
		contentType: "application/json;",
		url: domain + "api/user/auth",
		success: function(result){
			if(result.code == 0){
				
			} else {
				layer.alert(result.msg);
				window.location.href = "/layuiAdmin/views/login.html";
			}
		},
		error: function () {
			console.log("网络错误！");
		}
	});
});
