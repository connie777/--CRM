<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--使jsp输出的html时去除多余的空行--%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yh" uri="http://yyh.sdju.edu.cn/common/"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>营销业绩管理</title>
    <%--引入日期选择器--%>
    <link href="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">营销业绩管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- 多条件查询 -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline" method="get"
                          action="${pageContext.request.contextPath }/marketPerform/list.action">
                        <c:if test="${USER_SESSION.user_level != 3}">
                        <div class="form-group "style="margin-right: 20px">
                            <label>营销员</label>
                            <select	class="form-control"  name="perform_user_id">
                                <option value="">--请选择--</option>
                                <c:forEach items="${sellers}" var="item">
                                    <option value="${item.user_id}"
                                            <c:if test="${item.user_id == perform_user_id}"> selected</c:if>>
                                            ${item.user_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        </c:if>

                        <div class="form-group" style="margin-right: 20px">
                            <label>日期</label>
                            <input type="text" class="form-control date-picker"  name="perform_date" value="${perform_date}" readonly/>
                        </div>

                        <button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
                    </form>
                </div>
            </div>
            <%--新建按钮--%>
            <c:if test="${USER_SESSION.user_level != 3}">
            <a href="#" class="btn btn-primary" data-toggle="modal"
               data-target="#newPerformDialog" onclick="clearPerform()"style="margin-bottom: 4px">
                <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
                业绩录入</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/excelExport/exportPerform.action" class="btn btn-primary"  style="margin-bottom: 4px;margin-left: 6px;">
                <i class="fa fa-share fa-lg" style="margin-right: 5px"></i>
                Excel导出</a>
            <%--列表显示 start--%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">营销业绩统计</div>
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>营销员</th>
                                <th>月份</th>
                                <th>销售额</th>
                            </tr>
                            </thead>
                            <tbody style="text-align: center">
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <td>${row.perform_user_name}</td>
                                    <td>
                                            <%--利用jstl的转换出正确的日期格式--%>
                                        <fmt:formatDate value='${row.perform_date}' type='time' pattern='yyyy-MM'/>
                                    </td>
                                    <td>${row.perform_total_amount}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-md-12 text-right">
                            <yh:page url="${pageContext.request.contextPath }/marketPerform/list.action" />
                        </div>
                    </div>
                </div>
            </div>
            <%--列表显示 end--%>

        <!-- 业绩录入模态框 -->
        <div class="modal fade" id="newPerformDialog" tabindex="-1" role="dialog"
             aria-labelledby="myAddModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myAddModalLabel">业绩录入</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="new_perform_form">
                            <div class="form-group">
                                <label for="new_perform_user_id" style="float: left;padding: 7px 15px 0 42px;">营销员</label>
                                <div class="col-sm-10">
                                    <select	class="form-control" id="new_perform_user_id"  name="perform_user_id">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${sellers}" var="item">net
                                            <option value="${item.user_id}">
                                                    ${item.user_name }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_perform_date" class="col-sm-2 control-label">月份</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control date-picker" id="new_perform_date" placeholder="月份" name="perform_date" readonly/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="new_perform_total_amount" class="col-sm-2 control-label">销售额</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="new_perform_total_amount" placeholder="销售额" name="perform_total_amount" />
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="createPerform()">创建</button>
                    </div>
                </div>
            </div>
        </div>

</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<%--引入日期选择器--%>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<%--提示框--%>
<script src="../../js/spop.min.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    //初始化日期插件
    $(function () {
        $(".date-picker").datepicker({
            format: "yyyy-mm",
            language: "zh-CN",
            autoclose: true,
            clearBtn: true,
            startView: 1,
            minViewMode: 1,
            maxViewMode: 2,
        });

    })
    //前端日期格式化函数
    function dateFormat(date){
        if(date!=null){
            var date1=new Date(date);
            return date1.getFullYear()+'-'+(date1.getMonth()+1);
        }
    }
    //清空录入业绩窗口中的数据
    function clearPerform() {
        $("#perform_user_id").val("");
        $("#perform_date").val("");
        $("#perform_total_amount").val("");
    }
    // 录入业绩
    function createPerform() {
        $.ajax({
            url:'${pageContext.request.contextPath }/marketPerform/createPerform.action',
            type:'post',
            data:$('#new_perform_form').serialize(),
            success:function (data) {
                if(data=="SUCCESS"){
                    spop({
                        template: '<h4 class="spop-title">业绩录入成功！</h4>',
                        position: 'top-center',
                        style: 'success',
                        autoclose: 500,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }else{
                    spop({
                        template: '<h4 class="spop-title">业绩录入失败！</h4>',
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
</body>
</html>