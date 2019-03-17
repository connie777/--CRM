<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>导航栏</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="../../css/fileinput.min.css">--%>
	<!-- MetisMenu CSS -->
	<link href="../../css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="../../css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="../../css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <link href="../../css/crm.css" rel="stylesheet" type="text/css" />
    <%--提示框--%>
    <link rel="stylesheet" href="../../css/spop.min.css" />
    <link rel="stylesheet" href="../../css/simple-line-icons.css">
    <%--confirm美化--%>
    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/flavr.css">
    <%--文件上传--%>
    <link rel="stylesheet" href="../../css/fileinput.css">
    <%--CSS控制样式--%>
    <style>
        .kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
            margin: 0;
            padding: 0;
            border: none;
            box-shadow: none;
            text-align: center;
        }
        .kv-avatar {
            display: inline-block;
        }
        .kv-avatar .file-input {
            display: table-cell;
            width: 269px;
            height: 290px;
        }
        .row{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
	
		<!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
    <%--左上角大logo--%>
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/dashboard/show.action">
            <i class="fa fa-bank"></i>
            CRM客户关系管理系统
        </a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 任务通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			    <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 1</strong> 
								<span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 2</strong> 
								<span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 任务通知 end -->
		<!-- 消息通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown" style="top: -2px;">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="padding: 0px;">
                <img id="top_user_avatar" style="height: 50px;width: 60px;" src="http://localhost:8080/${USER_SESSION.user_avatar}">
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li style="margin-left: 20px;margin-top: 4px;">
                    <i class="fa fa-user fa-fw"></i>用户：${USER_SESSION.user_name}
				</li>
                <li style="margin-left: 20px;margin-top: 4px;margin-bottom: 1px;">
                    <i class="fa fa-briefcase fa-fw"></i>职位：${USER_SESSION.user_position}
                </li>
				<li>
                    <a href="#" onclick="getInfo()" data-toggle="modal" data-target="#myInfoModal">
                    <i class="fa fa-gear fa-fw"></i>设置
                    </a>
                </li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
                <%--一级菜单--%>
				<li>
                    <a href="#" >
                        <i class="fa fa-user-circle fa-fw"></i>
                        客户管理
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath }/customer/list.action" <%--class="active"--%>>
                                <i class="fa fa-user-circle fa-fw"></i>
                                客户信息管理
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/linkman/list.action">
                                <i class="fa fa-address-book fa-fw"></i>
                                客户联系人管理
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/visit/list.action">
                                <i class="fa fa-suitcase fa-fw" ></i>
                                客户拜访管理
                            </a>
                        </li>
                    </ul>

				</li>
                <%--一级菜单--%>
                <li>
                        <a href="#" >
                            <i class="fa fa-database fa-fw" ></i>
                            营销管理
                        </a>

                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath }/market/planList.action">
                                    <i class="fa fa-calendar-check-o fa-fw" ></i> 营销计划管理
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/marketPerform/list.action">
                                    <i class="fa fa-credit-card fa-fw" ></i> 营销业绩管理
                                </a>
                            </li>
                        </ul>

                </li>
                <%--一级菜单--%>
                <c:if test="${USER_SESSION.user_level != 3}">
                <li>
                        <a href="${pageContext.request.contextPath }/contract/list.action">
                            <i class="fa fa-file-text fa-fw" ></i> 合同管理
                        </a>
                </li>
                </c:if>
                <%--一级菜单--%>
                <li>
                    <a href="${pageContext.request.contextPath }/dashboard/show.action">
                        <i class="fa fa-tachometer fa-fw" ></i> Dashboard
                    </a>
                </li>

                <%--一级菜单 全局搜索（暂时无法实现）--%>
                <%--<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div>
				</li>--%>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>

    <%--模态框--%>
    <div class="modal fade" id="myInfoModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 900px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">个人信息编辑</h4>
                </div>
                <div class="modal-body" style="height: 355px;">
                    <form class="form form-vertical" action="#">
                        <div class="row">
                            <div class="col-sm-4 text-center">
                                <div class="kv-avatar">
                                    <div <%--class="file-loading"--%>>
                                        <input class="file-loading" id="user_avatar" name="avatar_file" type="file">
                                    </div>
                                </div>
                                <div class="kv-avatar-hint"><small>图片大小不得超过1500KB</small></div>
                            </div>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for=>用户账号</label>
                                            <input type="text" class="form-control" id="user_code" name="user_code" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label >用户姓名</label>
                                            <input type="text" class="form-control" id="user_name" name="user_name" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label >职位</label>
                                            <input type="text" class="form-control" id="user_position" name="user_position" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label >部门</label>
                                            <input type="text" class="form-control" id="user_department" name="user_department" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label >邮箱</label>
                                            <input type="text" class="form-control" id="user_email" name="user_email">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label >手机号</label>
                                            <input type="text" class="form-control" id="user_phone" name="user_phone" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="updateInfo()">更新个人信息</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</body>
<script src="../../js/jquery-1.11.3.min.js"></script>
<%--<script src="../../js/bootstrap.min.js"></script>--%>

<script type="text/javascript">
    $(function () {
        /*var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
            'onclick="alert(\'Call your custom code here.\')">' +
            '<i class="glyphicon glyphicon-tag"></i>' +
            '</button>';*/
        //初始化上传控件
        $('#user_avatar').fileinput({
            language:"zh",
            overwriteInitial: true,
            maxFileSize: 1500,
            showClose: false,
            showCaption: false,
            showBrowse: false,
            browseOnZoneClick: true,
            removeLabel: '',
            removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
            removeTitle: 'Cancel or reset changes',
            /*elErrorContainer: '#kv-avatar-errors-2',
            msgErrorClass: 'alert alert-block alert-danger',*/
            defaultPreviewContent: '<img style="width:160px;height:160px" src="http://localhost:8080/${USER_SESSION.user_avatar}" alt="Your Avatar"><h6 class="text-muted">点击更换头像</h6>',
            layoutTemplates: {main2: '{preview} ' /*+  btnCust */+ ' {remove} {browse}'},
            allowedFileExtensions: ["jpg", "png", "gif","jpeg"]
        });
    })
    //给模态框赋值
    function getInfo() {
        $('#user_code').val('${USER_SESSION.user_code}');
        $('#user_name').val('${USER_SESSION.user_name}');
        $('#user_position').val('${USER_SESSION.user_position}');
        $('#user_department').val('${USER_SESSION.user_department}');
        $('#user_email').val('${USER_SESSION.user_email}');
        $('#user_phone').val('${USER_SESSION.user_phone}');
    }
    // 更新用户信息
    function updateInfo() {
        var file_obj=document.getElementById('user_avatar').files[0];
        var fd = new FormData();
        fd.append('user_code', $('#user_code').val());
        /*fd.append('user_name',$('#user_name').val());*/
        /*fd.append('user_position',$('#user_position').val());*/
        /*fd.append('user_department',$('#user_department').val());*/
        fd.append('user_email',$('#user_email').val());
        fd.append('user_phone',$('#user_phone').val());
        if(file_obj!=null){
            fd.append('avatar_file',file_obj);
        }
        $.ajax({
            url:'${pageContext.request.contextPath }/updateUserInfo.action',
            type:'post',
            data:fd,
            processData:false,  //tell jQuery not to process the data
            contentType: false,  //tell jQuery not to set contentType
            success:function (data) {
                if(data=="SUCCESS"){
                    spop({
                        template: '<h4 class="spop-title">用户信息更新成功！</h4>',
                        position: 'top-center',
                        style: 'success',
                        autoclose: 2000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }else{
                    spop({
                        template: '<h4 class="spop-title">用户信息更新失败！</h4>',
                        position: 'top-center',
                        style: 'error',
                        autoclose: 2000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }
            }
        })
    }
</script>
</html>