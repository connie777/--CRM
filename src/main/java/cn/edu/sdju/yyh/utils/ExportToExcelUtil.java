package cn.edu.sdju.yyh.utils;

import cn.edu.sdju.yyh.po.*;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @ClassName ExportToExcelUtil
 * @Description 导出Excel工具类
 * @Author Silence
 * @Date 2019/3/11 15:43
 * @Version 1.0
 **/
public class ExportToExcelUtil {
    /**
     * 导出Excel
     * @param list   要导出的数据集合
     * @param response  使用response可以导出到浏览器
     * @return
     */
    public static  boolean exportCustomer(List<Customer> list,
                                  HttpServletResponse response){
        String fileName="客户信息表";
        String[] titles={"序号","客户名称","客户来源","所属行业","客户级别","负责人","固话","邮编","地址"};
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    +new String(fileName.getBytes("gb2312"), "ISO-8859-1")  + ".xls");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
            return false;
        }
        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb=new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet=wb.createSheet(fileName);
            //创建表头
            HSSFRow row = sheet.createRow(0);
            //创建单元格以及格式
            HSSFCell hssfCell = null;
            HSSFCellStyle hssfCellStyle=wb.createCellStyle();
            //设置居中格式
            hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //用单元格填充表头
            for (int i = 0; i < titles.length; i++) {
                hssfCell = row.createCell(i);
                hssfCell.setCellValue(titles[i]);//列名
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }
            // 填充工作表
            for (int i = 0; i <list.size() ; i++) {
                row = sheet.createRow(i+1);
                Customer customer=list.get(i);
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(customer.getCust_name()!=null?customer.getCust_name():"");
                row.createCell(2).setCellValue(customer.getCust_source()!=null?customer.getCust_source():"");
                row.createCell(3).setCellValue(customer.getCust_industry()!=null?customer.getCust_industry():"");
                row.createCell(4).setCellValue(customer.getCust_level()!=null?customer.getCust_level():"");
                row.createCell(5).setCellValue(customer.getCust_user_name()!=null?customer.getCust_user_name():"");
                row.createCell(6).setCellValue(customer.getCust_phone()!=null?customer.getCust_phone():"");
                row.createCell(7).setCellValue(customer.getCust_zipcode()!=null?customer.getCust_zipcode():"");
                row.createCell(8).setCellValue(customer.getCust_address()!=null?customer.getCust_address():"");
            }
            //将文件输出
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public static  boolean exportLinkman(List<Linkman> list,
                                          HttpServletResponse response){
        String fileName="联系人列表";
        String[] titles={"序号","联系人姓名","所属客户","性别","办公电话","移动电话","邮箱","QQ","职位","备注"};
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    +new String(fileName.getBytes("gb2312"), "ISO-8859-1")  + ".xls");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
            return false;
        }
        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb=new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet=wb.createSheet(fileName);
            //创建表头
            HSSFRow row = sheet.createRow(0);
            //创建单元格以及格式
            HSSFCell hssfCell = null;
            HSSFCellStyle hssfCellStyle=wb.createCellStyle();
            //设置居中格式
            hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //用单元格填充表头
            for (int i = 0; i < titles.length; i++) {
                hssfCell = row.createCell(i);
                hssfCell.setCellValue(titles[i]);//列名
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }
            // 填充工作表
            for (int i = 0; i <list.size() ; i++) {
                row = sheet.createRow(i+1);
                Linkman linkman=list.get(i);
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(linkman.getLkm_name()!=null?linkman.getLkm_name():"");
                row.createCell(2).setCellValue(linkman.getLkm_cust_name()!=null?linkman.getLkm_cust_name():"");
                row.createCell(3).setCellValue(linkman.getLkm_gender()!=null?linkman.getLkm_gender():"");
                row.createCell(4).setCellValue(linkman.getLkm_phone()!=null?linkman.getLkm_phone():"");
                row.createCell(5).setCellValue(linkman.getLkm_mobile()!=null?linkman.getLkm_mobile():"");
                row.createCell(6).setCellValue(linkman.getLkm_email()!=null?linkman.getLkm_email():"");
                row.createCell(7).setCellValue(linkman.getLkm_qq()!=null?linkman.getLkm_qq():"");
                row.createCell(8).setCellValue(linkman.getLkm_position()!=null?linkman.getLkm_position():"");
                row.createCell(9).setCellValue(linkman.getLkm_memo()!=null?linkman.getLkm_memo():"");
            }
            //将文件输出
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public static boolean exportVisit(List<Visit> list, HttpServletResponse response) {
        String fileName="拜访记录列表";
        String[] titles={"序号","客户名称","联系人姓名","业务员名称","拜访时间","拜访地点","拜访详情"};
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    +new String(fileName.getBytes("gb2312"), "ISO-8859-1")  + ".xls");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
            return false;
        }
        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb=new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet=wb.createSheet(fileName);
            //创建表头
            HSSFRow row = sheet.createRow(0);
            //创建单元格以及格式
            HSSFCell hssfCell = null;
            HSSFCellStyle hssfCellStyle=wb.createCellStyle();
            //设置居中格式
            hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //用单元格填充表头
            for (int i = 0; i < titles.length; i++) {
                hssfCell = row.createCell(i);
                hssfCell.setCellValue(titles[i]);//列名
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }
            // 填充工作表
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            for (int i = 0; i <list.size() ; i++) {
                row = sheet.createRow(i+1);
                Visit visit=list.get(i);
                if(visit.getVisit_time()!=null){
                    String date=simpleDateFormat.format(visit.getVisit_time());
                    row.createCell(4).setCellValue(date!=null?date:"");
                }else {
                    row.createCell(4).setCellValue("");
                }
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(visit.getVisit_cust_name()!=null?visit.getVisit_cust_name():"");
                row.createCell(2).setCellValue(visit.getVisit_lkm_name()!=null?visit.getVisit_lkm_name():"");
                row.createCell(3).setCellValue(visit.getVisit_user_name()!=null?visit.getVisit_user_name():"");
                row.createCell(5).setCellValue(visit.getVisit_addr()!=null?visit.getVisit_addr():"");
                row.createCell(6).setCellValue(visit.getVisit_detail()!=null?visit.getVisit_detail():"");
            }
            //将文件输出
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean exportPlan(List<MarketPlan> list, HttpServletResponse response) {
        String fileName="营销计划列表";
        String[] titles={"序号","计划名称","计划内容","负责人","预计成本","预计收益","开始时间","结束时间","备注"};
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    +new String(fileName.getBytes("gb2312"), "ISO-8859-1")  + ".xls");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
            return false;
        }
        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb=new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet=wb.createSheet(fileName);
            //创建表头
            HSSFRow row = sheet.createRow(0);
            //创建单元格以及格式
            HSSFCell hssfCell = null;
            HSSFCellStyle hssfCellStyle=wb.createCellStyle();
            //设置居中格式
            hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //用单元格填充表头
            for (int i = 0; i < titles.length; i++) {
                hssfCell = row.createCell(i);
                hssfCell.setCellValue(titles[i]);//列名
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }
            // 填充工作表
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            for (int i = 0; i <list.size() ; i++) {
                row = sheet.createRow(i+1);
                MarketPlan marketPlan=list.get(i);
                if(marketPlan.getPlan_start_date()!=null) {
                    String start_date = simpleDateFormat.format(marketPlan.getPlan_start_date());
                    row.createCell(6).setCellValue(start_date!=null?start_date:"");
                }else{
                    row.createCell(6).setCellValue("");
                }
                if(marketPlan.getPlan_end_date()!=null){
                    String end_date=simpleDateFormat.format(marketPlan.getPlan_end_date());
                    row.createCell(7).setCellValue(end_date!=null?end_date:"");
                }else {
                    row.createCell(7).setCellValue("");
                }
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(marketPlan.getPlan_name()!=null?marketPlan.getPlan_name():"");
                row.createCell(2).setCellValue(marketPlan.getPlan_content()!=null?marketPlan.getPlan_content():"");
                row.createCell(3).setCellValue(marketPlan.getPlan_user_name()!=null?marketPlan.getPlan_user_name():"");
                row.createCell(4).setCellValue(marketPlan.getPlan_cost()!=null?marketPlan.getPlan_cost():"");
                row.createCell(5).setCellValue(marketPlan.getPlan_profits()!=null?marketPlan.getPlan_profits():"");


                row.createCell(8).setCellValue(marketPlan.getPlan_remark()!=null?marketPlan.getPlan_remark():"");
            }
            //将文件输出
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean exportPerform(List<MarketPerform> list, HttpServletResponse response) {
        String fileName="营销业绩列表";
        String[] titles={"序号","营销员","月份","销售额"};
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    +new String(fileName.getBytes("gb2312"), "ISO-8859-1")  + ".xls");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
            return false;
        }
        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb=new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet=wb.createSheet(fileName);
            //创建表头
            HSSFRow row = sheet.createRow(0);
            //创建单元格以及格式
            HSSFCell hssfCell = null;
            HSSFCellStyle hssfCellStyle=wb.createCellStyle();
            //设置居中格式
            hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //用单元格填充表头
            for (int i = 0; i < titles.length; i++) {
                hssfCell = row.createCell(i);
                hssfCell.setCellValue(titles[i]);//列名
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }
            // 填充工作表
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM");
            for (int i = 0; i <list.size() ; i++) {
                row = sheet.createRow(i+1);
                MarketPerform marketPerform=list.get(i);
                if(marketPerform.getPerform_date()!=null) {
                    String date = simpleDateFormat.format(marketPerform.getPerform_date());
                    row.createCell(2).setCellValue(date!=null?date:"");
                }else{
                    row.createCell(2).setCellValue("");
                }
                if(marketPerform.getPerform_total_amount()!=null){
                    row.createCell(3).setCellValue(marketPerform.getPerform_total_amount());
                }else {
                    row.createCell(3).setCellValue("");
                }
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(marketPerform.getPerform_user_name()!=null?marketPerform.getPerform_user_name():"");

            }
            //将文件输出
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
