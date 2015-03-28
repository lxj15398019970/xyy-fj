package cn.ld.fj.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 日期工具类
 *
 * @author xjli
 */
public class DateUtil {

    public static String getTimeStampto() {
        SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
        return simple.format(new Date());
    }

    /**
     * 取当前时间格式"yyyyMMddHHmmssSSSS"
     *
     * @return
     */
    public static String getTimeStamp() {
        return date2str(new Date(), "yyyyMMddHHmmssSSS");
    }

    /**
     * 从regex1格式的date字符串转为regex2格式的date字符串
     *
     * @param date
     * @param regex1
     * @param regex2
     * @return
     */
    public static String dateFormateChange(String date, String regex1, String regex2) {
        Date d = null;
        try {
            d = new SimpleDateFormat(regex1).parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new SimpleDateFormat(regex2).format(d);

    }

    /**
     * 把格式为regex的字符串转为date类型的日期
     *
     * @param date
     * @param regex
     * @return
     */
    public static Date str2date(String date, String regex) {
        Date d = null;
        try {
            d = new SimpleDateFormat(regex).parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return d;
    }

    /**
     * 把date类型的日期转为格式为regex的字符串
     *
     * @param date
     * @param regex
     * @return
     */
    public static String date2str(Date date, String regex) {
        SimpleDateFormat simple = new SimpleDateFormat(regex);
        return simple.format(date);
    }

    /**
     * 日期转化为大小写(吉林大学珠海学院文件专用)
     *
     * @param date
     * @return
     */
    public static String dataToUpper(Date date) {
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        int year = ca.get(Calendar.YEAR);
        int month = ca.get(Calendar.MONTH) + 1;
        int day = ca.get(Calendar.DAY_OF_MONTH);
        return numToUpper(year) + "年" + monthToUppder(month) + "月" + dayToUppder(day) + "日";
    }

    /**
     * 将数字转化为大写(吉林大学珠海学院文件专用)
     *
     * @param num
     * @return
     */
    public static String numToUpper(int num) {
        String u[] = {"〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
        char[] str = String.valueOf(num).toCharArray();
        String rstr = "";
        for (int i = 0; i < str.length; i++) {
            rstr = rstr + u[Integer.parseInt(str[i] + "")];
        }
        return rstr;
    }

    /**
     * 月转化为大写
     *
     * @param month
     * @return
     */
    public static String monthToUppder(int month) {
        if (month < 10) {
            return numToUpper(month);
        } else if (month == 10) {
            return "十";
        } else {
            return "十" + numToUpper(month - 10);
        }
    }

    /**
     * 日转化为大写
     *
     * @param day
     * @return
     */
    public static String dayToUppder(int day) {
        if (day < 20) {
            return monthToUppder(day);
        } else {
            char[] str = String.valueOf(day).toCharArray();
            // 三元运算
            return (str[1] == '0') ? numToUpper(Integer.parseInt(str[0] + "")) + "十" : numToUpper(Integer
                    .parseInt(str[0] + "")) + "十" + numToUpper(Integer.parseInt(str[1] + ""));
        }
    }

    public static void main(String[] args) {

        System.out.println(DateUtil.getTimeStamp());
    }

    private static final String[] chinaWeeks = new String[]{"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};

    public static String getChinaWeek(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return chinaWeeks[cal.get(Calendar.DAY_OF_WEEK) - 1];
    }

    public static String getToday(String pattern) {
        Calendar cal = Calendar.getInstance();
        Date today = cal.getTime();
        return formatDate(today, pattern);
    }

    public static String formatDate(Date date, String pattern) {
        if (null == pattern || "".equals(pattern)) {
            pattern = "yyyy-MM-dd";
        }
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        return df.format(date);
    }


    public static Date getUsDate(String str) {
        Date birthDate = null;
        try {
            birthDate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US).parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return birthDate;
    }



}
