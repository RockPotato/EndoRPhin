package kr.or.ddit.constant;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;


public class SalesCodeConstant {
	
	
	// 매출코드
	public static final Map<String, String> salesCode = new HashMap<String, String>();
	static {
		salesCode.put("11", "과세매출");
		salesCode.put("12", "영세율매출");
		salesCode.put("13", "계산서매출");
		salesCode.put("14", "과세무증빙매출");
		salesCode.put("15", "간이과세매출");
		salesCode.put("16", "수출L/C매출");
		salesCode.put("17", "카드과세매출");
		salesCode.put("18", "카드면세매출");
		salesCode.put("19", "카드영세매출");
		salesCode.put("20", "면세무증빙매출");
		salesCode.put("21", "전자화폐매출");
		salesCode.put("22", "현금과세매출");
		salesCode.put("23", "현금면세매출");
		salesCode.put("24", "현금영세매출");
	}

	// 매입코드
	public static final Map<String, String> purchaseCode = new HashMap<String, String>();
	static {
		purchaseCode.put("51", "과세매입");
		purchaseCode.put("52", "영세율");
		purchaseCode.put("53", "계산서");
		purchaseCode.put("54", "불공");
		purchaseCode.put("55", "수입분");
		purchaseCode.put("56", "금전등록");
		purchaseCode.put("57", "카드과세");
		purchaseCode.put("58", "카드면세");
		purchaseCode.put("59", "카드영세");
		purchaseCode.put("60", "무증빙");
		purchaseCode.put("61", "현금과세");
		purchaseCode.put("62", "현금면세");
	}

	//정률법 //정액법
	public static final LinkedHashMap<String, String> straight = new LinkedHashMap<String, String>();
	static {
		straight.put("0.500", "0.777");
		straight.put("0.333", "0.632");
		straight.put("0.250", "0.528");
		straight.put("0.200", "0.451");
		straight.put("0.166", "0.394");
		straight.put("0.142", "0.349");
		straight.put("0.125", "0.313");
		straight.put("0.111", "0.284");
		straight.put("0.100", "0.259");
		straight.put("0.090", "0.239");
		straight.put("0.083", "0.221");
		straight.put("0.076", "0.206");
		straight.put("0.071", "0.193");
		straight.put("0.066", "0.182");
		straight.put("0.062", "0.171");
		straight.put("0.058", "0.162");
		straight.put("0.055", "0.154");
		straight.put("0.052", "0.146");
		straight.put("0.050", "0.140");
		straight.put("0.048", "0.133");
		straight.put("0.046", "0.128");
		straight.put("0.044", "0.123");
		straight.put("0.042", "0.118");
		straight.put("0.040", "0.113");
		straight.put("0.039", "0.109");
		straight.put("0.037", "0.106");
		straight.put("0.036", "0.102");
		straight.put("0.035", "0.099");
		straight.put("0.034", "0.096");
		straight.put("0.033", "0.093");
		straight.put("0.032", "0.090");
		straight.put("0.031", "0.090");
		straight.put("0.030", "0.085");
		straight.put("0.029", "0.085");
		straight.put("0.028", "0.080");
		straight.put("0.027", "0.078");
		straight.put("0.027", "0.076");
		straight.put("0.026", "0.074");
		straight.put("0.025", "0.073");
		straight.put("0.025", "0.071");
		straight.put("0.024", "0.069");
		straight.put("0.024", "0.068");
		straight.put("0.024", "0.066");
		straight.put("0.024", "0.065");
		straight.put("0.022", "0.064");
		straight.put("0.022", "0.062");
		straight.put("0.021", "0.061");
		straight.put("0.021", "0.060");
		straight.put("0.020", "0.059");
		straight.put("0.020", "0.059");
		straight.put("0.020", "0.056");
		straight.put("0.019", "0.055");
		straight.put("0.019", "0.054");
		straight.put("0.019", "0.054");
		straight.put("0.018", "0.053");
		straight.put("0.018", "0.052");
		straight.put("0.018", "0.051");
		straight.put("0.017", "0.050");
		straight.put("0.017", "0.049");
	}
	
/*	public static final List<String> declining_list = new ArrayList<String>();
	static {
		Logger logger = LoggerFactory.getLogger(SalesCodeConstant.class);
		
		declining_list.add("0.777");
		declining_list.add("0.632");
		declining_list.add("0.528");
		declining_list.add("0.451");
		declining_list.add("0.394");
		declining_list.add("0.349");
		declining_list.add("0.313");
		declining_list.add("0.284");
		declining_list.add("0.259");
		declining_list.add("0.239");
		declining_list.add("0.221");
		declining_list.add("0.206");
		declining_list.add("0.193");
		declining_list.add("0.182");
		declining_list.add("0.171");
		declining_list.add("0.162");
		declining_list.add("0.154");
		declining_list.add("0.146");
		declining_list.add("0.140");
		declining_list.add("0.133");
		declining_list.add("0.128");
		declining_list.add("0.123");
		declining_list.add("0.118");
		declining_list.add("0.113");
		declining_list.add("0.109");
		declining_list.add("0.106");
		declining_list.add("0.102");
		declining_list.add("0.099");
		declining_list.add("0.096");
		declining_list.add("0.093");
		declining_list.add("0.090");
		declining_list.add("0.090");
		declining_list.add("0.085");
		declining_list.add("0.085");
		declining_list.add("0.080");
		declining_list.add("0.078");
		declining_list.add("0.076");
		declining_list.add("0.074");
		declining_list.add("0.073");
		declining_list.add("0.071");
		declining_list.add("0.069");
		declining_list.add("0.068");
		declining_list.add("0.066");
		declining_list.add("0.065");
		declining_list.add("0.064");
		declining_list.add("0.062");
		declining_list.add("0.061");
		declining_list.add("0.060");
		declining_list.add("0.059");
		declining_list.add("0.059");
		declining_list.add("0.056");
		declining_list.add("0.055");
		declining_list.add("0.054");
		declining_list.add("0.054");
		declining_list.add("0.053");
		declining_list.add("0.052");
		declining_list.add("0.051");
		declining_list.add("0.050");
		declining_list.add("0.049");

		logger.debug("ddd : {} ", declining_list.get(5));
	}*/
	// 정률법
	public static final Map<String, String> declining = new HashMap<String, String>();
	static {
		
		declining.put("2",  "0.777");
		declining.put("3",  "0.632");
		declining.put("4",  "0.528");
		declining.put("5",  "0.451");
		declining.put("6",  "0.394");
		declining.put("7",  "0.349");
		declining.put("8",  "0.313");
		declining.put("9",  "0.284");
		declining.put("10", "0.259");
		declining.put("11", "0.239");
		declining.put("12", "0.221");
		declining.put("13", "0.206");
		declining.put("14", "0.193");
		declining.put("15", "0.182");
		declining.put("16", "0.171");
		declining.put("17", "0.162");
		declining.put("18", "0.154");
		declining.put("19", "0.146");
		declining.put("20", "0.140");
		declining.put("21", "0.133");
		declining.put("22", "0.128");
		declining.put("23", "0.123");
		declining.put("24", "0.118");
		declining.put("25", "0.113");
		declining.put("26", "0.109");
		declining.put("27", "0.106");
		declining.put("28", "0.102");
		declining.put("29", "0.099");
		declining.put("30", "0.096");
		declining.put("31", "0.093");
		declining.put("32", "0.090");
		declining.put("33", "0.090");
		declining.put("34", "0.085");
		declining.put("35", "0.085");
		declining.put("36", "0.080");
		declining.put("37", "0.078");
		declining.put("38", "0.076");
		declining.put("39", "0.074");
		declining.put("40", "0.073");
		declining.put("41", "0.071");
		declining.put("42", "0.069");
		declining.put("43", "0.068");
		declining.put("44", "0.066");
		declining.put("45", "0.065");
		declining.put("46", "0.064");
		declining.put("47", "0.062");
		declining.put("48", "0.061");
		declining.put("49", "0.060");
		declining.put("50", "0.059");
		declining.put("51", "0.059");
		declining.put("52", "0.056");
		declining.put("53", "0.055");
		declining.put("54", "0.054");
		declining.put("55", "0.054");
		declining.put("56", "0.053");
		declining.put("57", "0.052");
		declining.put("58", "0.051");
		declining.put("59", "0.050");
		declining.put("60", "0.049");
	}

	
	 
}
