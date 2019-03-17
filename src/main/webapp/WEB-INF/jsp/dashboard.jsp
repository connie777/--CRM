<%--
  Created by IntelliJ IDEA.
  User: Silence
  Date: 2019/3/8
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>dashboard</title>
    <style type="text/css">
        .box1{
            border: 1px solid rgb(222, 226, 230);
            width: 231px;
            height: 136px;
            background-color: white;
            float: left;
            margin-top: 15px;
            margin-left: 36px;
            padding: 30px;
            /*position: relative;*/
        }
        .span1{
            margin-bottom: 0.5rem !important;
            display: block !important;
            font-size: 3.3125rem;
            line-height: 1.2;
        }
        .sbox{
            float: left;
        }
        .span2{
            font-size: 16px;
        }
        .sbox1{
            /*position: absolute;
            top:0px;
            right:0px;*/
            float: right;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
    <%@include file="head.jsp" %>
    <div id="page-wrapper" style="background-color: floralwhite;padding: 0px">
        <div class="row" style="padding-left: 14px;">
            <%--4个数据展示框--%>
            <div style="width: 100%;height: 168px">
                <div class="box1">
                    <div class="sbox">
                        <span class="span1" id="total_cust"></span>
                        <span class="span2">客户总数</span>
                    </div>

                    <div class="sbox sbox1">
                        <a href="${pageContext.request.contextPath }/customer/list.action">
                        <i class="fa fa-users fa-3x"></i>
                        </a>
                    </div>
                </div>
                <div class="box1">
                    <div class="sbox">
                        <span class="span1" id="total_visit"></span>
                        <span class="span2">客户拜访次数</span>
                    </div>

                    <div class="sbox sbox1">
                        <a href="${pageContext.request.contextPath }/visit/list.action">
                        <i class="fa fa-handshake-o fa-3x"></i>
                        </a>
                    </div>
                </div>
                <div class="box1">
                    <div class="sbox">
                        <span class="span1" id="total_contract"></span>
                        <span class="span2">合同签订数</span>
                    </div>

                    <div class="sbox sbox1">
                        <a href="${pageContext.request.contextPath }/contract/list.action" id="contract_jump">
                        <i class="fa fa-file-text fa-3x"></i>
                        </a>
                    </div>
                </div>
                <div class="box1">
                    <div class="sbox">
                        <span class="span1" id="total_amount">2332W</span>
                        <span class="span2">销售总额</span>
                    </div>

                    <div class="sbox sbox1">
                        <a href="${pageContext.request.contextPath }/marketPerform/list.action">
                        <i class="fa fa-cny fa-3x"></i>
                        </a>
                    </div>
                </div>
            </div>
            <%--图表展示框--%>
            <div id="echarts" style="
                        width: 1032px;
                        height: 400px;
                        /*margin-top: 40px;*/
                        margin-left: 36px;">

            </div>
        </div>
        <%--右下角弹窗 显示天气信息--%>
        <div id="notice" style="position: fixed;right: 20px;bottom: 3px;border: 3px solid rgb(51, 122, 183);border-radius: 10px;z-index: 9999;background-color: rgb(255, 255, 255);width: 350px;height: 235px;display: none;overflow: hidden">
            <div style="width: 100%;height: 30px;background-color: #6292c8" >
                <img id="close_img" src="../../images/close.png" style="width: 16px;float: right; margin-top: 7px;margin-right: 8px;cursor: pointer;">
            </div>
            <div id="notice_content" style="font-weight: normal;padding: 10px;overflow-y:auto; overflow-x:hidden;height: 270px;">
            </div>
        </div>
        </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="../../js/jquery-1.11.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/metisMenu.min.js"></script>
<script src="../../js/jquery.dataTables.min.js"></script>
<script src="../../js/dataTables.bootstrap.min.js"></script>
<script src="../../js/sb-admin-2.js"></script>
<script src="../../js/echarts.js"></script>
<script src="../../js/fileinput.js"></script>
<script src="../../js/zh.js"></script>
<script src="../../js/spop.min.js"></script>
<script type="text/javascript">
    //是否是第一次进入该页面
    $(function () {
        /*echarts*/
        var myChart = echarts.init(document.getElementById('echarts'));
        var option = {
            title: {
                x: 'center',
                text: '近10个月销售额统计（单位：元）',
                textStyle:{
                    color:'#75fcd7',
                    fontWeight: 'normal',
                    align: 'left',
                    fontFamily:"微软雅黑"
                }
            },
            backgroundColor:'rgb(0, 26, 44)',
            /*grid:{ //柱状图的大小
                x:70,
                /!*bottom:20,
                borderWidth:80*!/
            },*/
            tooltip: {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            /*legend: {
                data:['近10个月销售额（单位：元）']  图例
            },*/
            xAxis: {
                axisTick:{
                    show:false  //刻度消失
                },
                splitLine:{show: false},//去除网格线
                type : 'category',
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color:'#7192ca',
                        width:2
                    }
                },
                data: []
            },
            yAxis: {
                axisTick:{
                    show:false  //刻度消失
                },
                splitLine:{show: false},//去除网格线
                type : 'value',
                nameTextStyle:{
                    color:'#fff'
                },
                axisLabel : {
                    formatter: '{value}',
                    textStyle: {
                        color: '#fff',
                        //fontSize:16
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color:'#7192ca',
                        width:2
                    }
                },
            },
            series: [{
                name: '销售额',
                type: 'bar',
                barWidth : 30,
                itemStyle: {
                    emphasis: {
                        barBorderRadius: [10, 10, 10, 10]//圆角
                    },
                    normal: {
                        color: function (params) {
                            // build a color map as your need.
                            /*var colorList = ['#ec635a', '#ed719e', '#c36ff6', '#736af6', '#7993f7',
                                '#86d4fb', '#91fce7', '#1EAD71', '#5BBB12', '#4B12BB'];*/
                            var colorList =[ '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'];
                            return colorList[params.dataIndex]  //柱状图的颜色
                        },
                        /*label: {
                            show: true, //开启显示
                            position: 'top', //在上方显示
                            textStyle: { //数值样式
                                color: 'black',
                                fontSize: 16
                            }
                        },*/
                    },
                    data: [],

                }
            }]
        }
        myChart.setOption(option);
        //数据加载完之前先显示一段简单的loading动画
        myChart.showLoading();
        var months=[];    //月份数组（实际用来盛放X轴坐标值）
        var amounts=[];    //业绩数组（实际用来盛放Y坐标值）
        //查询echarts要的数据
        $.ajax({
            url:'${pageContext.request.contextPath }/dashboard/getChartData.action',
            type:'get',
            async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            data:{},
            dataType : "json", //返回数据形式为json
            success:function (data) {
                console.log(data);
                if(data.resultList!=null){
                    for(var i=0;i<data.resultList.length;i++){
                        months.push(data.resultList[i].month);
                        amounts.push(data.resultList[i].total_amount);
                    }
                    myChart.hideLoading();//隐藏加载动画
                    myChart.setOption({
                        xAxis: {
                            data: months
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: '销售额',
                            data: amounts
                        }]
                    })
                }else{
                    myChart.hideLoading();//隐藏加载动画
                }

            }
        })
        //查询其他四个数据
        $.ajax({
            url:'${pageContext.request.contextPath }/dashboard/getTotalData.action',
            method:'get',
            dataType:'json',
            success:function (data) {
                console.log(data);
                $('#total_cust').html(data.total_cust);
                $('#total_visit').html(data.total_visit_record);
                $('#total_contract').html(data.total_contract);
                var ta=data.total_sell_amount;
                var total_amount=(ta/10000).toFixed(2)+'w';
                $('#total_amount').html(total_amount);
            }
        })
        //获取天气信息（接口为聚合接口，500次，且用且珍惜~~~）
        var city='上海';
        $citycode=urlencode(city);
        $key='ba0578b988bbd065049bdc266b88c717';
        if('${isFirst}'=='1'){
            $.ajax({
                type:"get",
                url:"http://v.juhe.cn/weather/index?format=2&cityname="+$citycode+"&key="+$key,
                data:{'id':'1'},
                dataType : "jsonp",
                success:function(data){
                    console.log(data);
                    var sk = data.result.sk;
                    var today = data.result.today;
                    var futur = data.result.future;
                    $('#notice_content').html('');
                    $('#notice_content').append('<div style="width:100%;padding: 10px;border-bottom: 1px dashed #004584;">' +
                        '${USER_SESSION.user_name},您好！欢迎使用CRM客户管理系统！'+'<br>'+
                        '今天是'+ today.date_y + ' ' + today.week + '<br>'+
                        today.city+'今日天气 ： '+today.weather+',当前温度'+sk.temp + '℃  , ' + sk.wind_direction + sk.wind_strength + ' , ' + '空气湿度' + sk.humidity+
                        '；穿衣指数 ： '+today.dressing_index+','+today.dressing_advice+'<br>'+
                        '明天天气 ： '+futur[0].weather+',温度'+futur[0].temperature+' ,'+futur[0].wind+
                        '</div>');
                    $('#notice').slideDown(1000);
                    //超时自动执行关闭方法（时间为10秒）
                    setTimeout(autoClose,10000);
                }
            });
        }
        $("#close_img").on("click",function(){
            $("#notice").slideUp("slow");
        })
        if('${USER_SESSION.user_level}'=='3'){
            $('#contract_jump').attr('href', '#');
        }
    })

    //编码转换（需要将中文转成天气接口需要的参数编码)
    function urlencode (str) {
        str = (str + '').toString();
        return encodeURIComponent(str).replace(/!/g, '%21').replace(/'/g, '%27').replace(/\(/g, '%28').
        replace(/\)/g, '%29').replace(/\*/g, '%2A').replace(/%20/g, '+');
    }

    //自动关闭提示框
    function autoClose() {
        $("#notice").slideUp("slow");
    }
</script>

</body>
</html>
