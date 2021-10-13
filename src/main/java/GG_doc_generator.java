import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

// TODO: 2021/10/13
//1、从官网读取数据
//2、添加版本号
//3、从官网更新常量而不是给定的本地数据

//htmlElement -> objectElement
//首先进行粗处理，每个对象保存3条String，分别是链接、head、body
public class GG_doc_generator {
    public static void main(String[] args) throws IOException {

        ArrayList<ObjectElement> objectElements;

        objectElements = 读取本地文件(new File("doc.txt"));

        保存Doc(objectElements, new File("gg_doc.lua"));
    }

    public static ArrayList<ObjectElement> 读取本地文件(File file) throws IOException {
        Document document = Jsoup.parse(file, "utf-8");

        //保存所有的html对象
        ArrayList<Element[]> htmlElements = new ArrayList<>();
        ArrayList<ObjectElement> objectElements = new ArrayList<>();

        Element start = document.select("a").first();

        Element p = start;
        while (p != null) {
            Element[] elements = new Element[3];
            for (int i = 0; i < elements.length; i++) {
                elements[i] = p;

                p = p.nextElementSibling();
            }
            htmlElements.add(elements);
        }


        int sizeOfHtmlElementsOrObjectElements = htmlElements.size();

        //初始化分配内存
        {
            for (int i = 0; i < sizeOfHtmlElementsOrObjectElements; i++) {
                objectElements.add(new ObjectElement());
            }

            assert htmlElements.size() == objectElements.size();
        }

        for (int i = 0; i < sizeOfHtmlElementsOrObjectElements; i++) {
            ObjectElement objectElement = objectElements.get(i);
            Element[] threeHtmlElements = htmlElements.get(i);

            Element htmlElement;

            //处理第一个html
            htmlElement = threeHtmlElements[0];
            objectElement.officialLink = "https://gameguardian.net/help/classgg.html#" + htmlElement.attr("id");

            //处理第二个html
            htmlElement = threeHtmlElements[1];
            objectElement.functionName = htmlElement.text().replaceAll("\\(\\)", "");

            //处理第三个html
            htmlElement = threeHtmlElements[2];

            Element e;
            //第一个标签，处理param.type, param.name, param.defaultValue
            e = htmlElement.select(".memproto").first().select("tbody").first();
            //获取所有的paramtype标签
            Elements elements1 = e.select(".paramtype");

            //添加param.type, param.name, param.defaultValue
            Param[] params = new Param[elements1.size()];
            for (int j = 0; j < elements1.size(); j++) {
                Param param = params[j] = new Param();
                Element element1 = elements1.get(j);

                param.type = element1.text();
                //获取参数名和默认值（如果有的话）
                Element paramname_element = element1.nextElementSiblings().select(".paramname").first();
                param.name = paramname_element.select("em").first().text();

                //如果有默认值
                if (paramname_element.select("code").first() != null) {
                    String a_str = paramname_element.select("code").first().text();

                    //如果有超链接
                    if (paramname_element.select(".el").first() != null) {

                        String link = paramname_element.select(".el").first().attr("href");
                        param.defaultValue = "[" + a_str + "]" + "(https://gameguardian.net/help/" + link + ")";
                    } else {
                        //没有超链接
                        param.defaultValue = a_str;
                    }
                }
            }
            objectElement.params = params;

//            System.out.println(objectElement.functionName);
//            elements1.forEach(System.out::println);
//            System.out.println(elements1.size());

//            System.out.println();
            //第二个标签,处理param.description,functionDescription,returnDescription
            e = htmlElement.select(".memdoc").first();
            //处理函数描述functionDescription
            StringBuilder functionDescription = new StringBuilder();
            Elements select = e.select("p");
            for (int j = 0; j < select.size(); j++) {
                //将标签替换为使用markdown包裹
                String str_p = select.get(j).outerHtml()
                        .replaceAll("\n", "")
                        //如果前面有字母紧跟则添加空格
                        .replaceAll("([a-zA-Z])<code>", "$1 <code>")
                        .replaceAll("</code>([a-zA-Z])", "<code> $1")
                        .replaceAll("</?code>", "***")
                        //删除p标签
                        .replaceAll("</?p>", "")
                        //处理超链接
                        .replaceAll("<a.*?href=\"(.*?)\".*?>(.*?)</a>", "[$2]($1)")
                        //补充网址
                        .replaceAll("classgg.html", "https://gameguardian.net/help/classgg.html");
                if (j != 0) {
                    functionDescription.append("\n---***\n");
                }
                functionDescription.append("---" + str_p);
            }
            objectElement.functionDescription = functionDescription.toString();

            //处理param.description
            //如果有参数
            if (e.select(".params").first() != null) {
                Element tbody = e.select(".params").first().select(".params").first()
                        .select("tbody").first();
//                System.out.println(tbody);
                //先获取每个tr
                Elements trs = tbody.select("tr");
                for (int j = 0; j < trs.size(); j++) {
                    Element tr = trs.get(j);
                    //第二个td是参数描述
                    String paramDescription = tr.select("td").last().outerHtml()
                            //将code标签转为markdown
                            .replaceAll("([a-zA-Z])<code>", "$1 <code>")
                            .replaceAll("</code>([a-zA-Z])", "<code> $1")
                            .replaceAll("</?code>", "***")
                            .replaceAll("</?td>", "");

                    objectElement.params[j].description = paramDescription;
                }
            } else {
                //没有参数
            }

            //处理returnDescription
            //有返回值
            if (htmlElement.select(".section.return").first() != null) {
                String returnDescription = htmlElement.select(".section.return").first().select("dd").first().outerHtml()
                        //将code标签转为markdown
                        .replaceAll("([a-zA-Z])<code>", "$1 <code>")
                        .replaceAll("</code>([a-zA-Z])", "<code> $1")
                        .replaceAll("</?code>", "***")
                        //处理超链接
                        .replaceAll("<a.*?href=\"(.*?)\".*?>(.*?)</a>", "[$2]($1)")
                        //补充网址
                        .replaceAll("classgg.html", "https://gameguardian.net/help/classgg.html")
                        //删除dd标签
                        .replaceAll("</?dd>", "")
                        //去除换行
                        .replaceAll("\n", "");
                objectElement.returnDescription = returnDescription;
            } else {
                //没有返回值
            }
        }
        objectElements.forEach(System.out::println);

        return objectElements;
    }

    public static void 保存Doc(List<ObjectElement> objectElements, File file) {
        try (PrintWriter printWriter = new PrintWriter(file)) {
            printWriter.println(署名());
            printWriter.println(gg常量及基本类型());

            objectElements.forEach(printWriter::println);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String 署名() {
        Date date = new Date();
        String dateStr = "";
        try {
            dateStr = SimpleDateFormat.getDateInstance().format(date) + " " + SimpleDateFormat.getTimeInstance().format(date) + " UTC+8";
        } catch (Exception e) {
            e.printStackTrace();
        }

        String str = "---@author 刘海旭 qq1244653065\n" +
                "---@require EmmyLua-v1.3.6.219\n" +
                "---create time:" + dateStr + "\n";

        return str;
    }

    public static String gg常量及基本类型() {
        String str = "---@class int **int数据类型**\n" +
                "---@class double **double数据类型**\n" +
                "---@class bool **bool数据类型**\n" +
                "---@class true **真**\n" +
                "---@class false **假**\n" +
                "---@class long **long数据类型**\n" +
                "---@class mixed **混合数据类型**\n" +
                "---@class gg\n" +
                "gg = { ANDROID_SDK_INT = nil,\n" +
                "       ASM_ARM = nil,\n" +
                "       ASM_ARM64 = nil,\n" +
                "       ASM_THUMB = nil,\n" +
                "       BUILD = nil,\n" +
                "       CACHE_DIR = nil,\n" +
                "       DUMP_SKIP_SYSTEM_LIBS = nil,\n" +
                "       EXT_CACHE_DIR = nil,\n" +
                "       EXT_FILES_DIR = nil,\n" +
                "       EXT_STORAGE = nil,\n" +
                "       FILES_DIR = nil,\n" +
                "       FREEZE_IN_RANGE = nil,\n" +
                "       FREEZE_MAY_DECREASE = nil,\n" +
                "       FREEZE_MAY_INCREASE = nil,\n" +
                "       FREEZE_NORMAL = nil,\n" +
                "       LOAD_APPEND = nil,\n" +
                "       LOAD_VALUES = nil,\n" +
                "       LOAD_VALUES_FREEZE = nil,\n" +
                "       PACKAGE = nil,\n" +
                "       POINTER_EXECUTABLE = nil,\n" +
                "       POINTER_EXECUTABLE_WRITABLE = nil,\n" +
                "       POINTER_NO = nil,\n" +
                "       POINTER_READ_ONLY = nil,\n" +
                "       POINTER_WRITABLE = nil,\n" +
                "       PROT_EXEC = nil,\n" +
                "       PROT_NONE = nil,\n" +
                "       PROT_READ = nil,\n" +
                "       PROT_WRITE = nil,\n" +
                "       REGION_ANONYMOUS = nil,\n" +
                "       REGION_ASHMEM = nil,\n" +
                "       REGION_BAD = nil,\n" +
                "       REGION_C_ALLOC = nil,\n" +
                "       REGION_C_BSS = nil,\n" +
                "       REGION_C_DATA = nil,\n" +
                "       REGION_C_HEAP = nil,\n" +
                "       REGION_CODE_APP = nil,\n" +
                "       REGION_CODE_SYS = nil,\n" +
                "       REGION_JAVA = nil,\n" +
                "       REGION_JAVA_HEAP = nil,\n" +
                "       REGION_OTHER = nil,\n" +
                "       REGION_PPSSPP = nil,\n" +
                "       REGION_STACK = nil,\n" +
                "       REGION_VIDEO = nil,\n" +
                "       SAVE_AS_TEXT = nil,\n" +
                "       SIGN_EQUAL = nil,\n" +
                "       SIGN_FUZZY_EQUAL = nil,\n" +
                "       SIGN_FUZZY_GREATER = nil,\n" +
                "       SIGN_FUZZY_LESS = nil,\n" +
                "       SIGN_FUZZY_NOT_EQUAL = nil,\n" +
                "       SIGN_GREATER_OR_EQUAL = nil,\n" +
                "       SIGN_LESS_OR_EQUAL = nil,\n" +
                "       SIGN_NOT_EQUAL = nil,\n" +
                "       TAB_MEMORY_EDITOR = nil,\n" +
                "       TAB_SAVED_LIST = nil,\n" +
                "       TAB_SEARCH = nil,\n" +
                "       TAB_SETTINGS = nil,\n" +
                "       TYPE_AUTO = nil,\n" +
                "       TYPE_BYTE = nil,\n" +
                "       TYPE_DOUBLE = nil,\n" +
                "       TYPE_DWORD = nil,\n" +
                "       TYPE_FLOAT = nil,\n" +
                "       TYPE_QWORD = nil,\n" +
                "       TYPE_WORD = nil,\n" +
                "       TYPE_XOR = nil,\n" +
                "       VERSION = nil,\n" +
                "       VERSION_IN = nil\n" +
                "}";
        return str;
    }
}

