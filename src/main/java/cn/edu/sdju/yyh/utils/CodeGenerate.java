package cn.edu.sdju.yyh.utils;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName CodeGenerate
 * @Description TODO
 * @Author Silence
 * @Date 2019/3/17 13:45
 * @Version 1.0
 **/
public class CodeGenerate {
    public static String codeGenerate(){
        String[] beforeShuffle = new String[] { "2", "3", "4", "5", "6", "7",
                "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
                "W", "X", "Y", "Z" };
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(5, 9);
        return result;
    }
}
