package kr.or.ddit.document.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.IOrdersService;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.service.IPaymentService;

@Controller
public class ExcelController {

	private Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Resource(name = "paymentService")
	IPaymentService paymentService;

	@Resource(name = "ordersService")
	IOrdersService ordersService;

	@RequestMapping(value = "/currentOrderExceldown")
	public void currentOrderExceldown(HttpServletResponse response, OrdersVo ordersVo) throws Exception {
		List<OrdersVo> list = ordersService.searchByName(ordersVo);
		String[] currentOrder = { "구분", "발주번호", "발주일", "납기일	", "거래처명", "내역", "입고액", "발주금액" };
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("발주 현황");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다. -> 갈색으로 변경
		headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);
		row.createCell(0);

		for (int i = 0; i < currentOrder.length; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(currentOrder[i]);
		}

		// 데이터 부분 생성

		for (OrdersVo vo : list) {

			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getSortation());

			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrderCode());

			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getDueDate());

			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getPaymentDueDate());

			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getClientname());

			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrderList());

			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getReceivepay());
			
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrderPrice());
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		response.setHeader("Content-Disposition", "attachment;filename=" + sdf.format(new Date()) + "_currentOrders.xls");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

	@RequestMapping(value = "/paymentPersonalExceldown")
	public void excelDown(HttpServletResponse response, String userid, String paydayTo, String paydayFrom)
			throws Exception {

		String[] paymentPersonal = { "사번", "성명", "지급일자", "부서명", "총급여액", "총공제액", "총지급액" };

		// 게시판 목록조회
		Map<String, Object> map = new HashMap<>();
		map.put("paydayTo", paydayTo);
		map.put("paydayFrom", paydayFrom);
		map.put("userid", userid);

		List<PaymentVo> list = paymentService.selectPersonalPaymentList(map);

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("개인별 급여 조회");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다. -> 갈색으로 변경
		headStyle.setFillForegroundColor(HSSFColorPredefined.BROWN.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);
		row.createCell(0);

		for (int i = 0; i < paymentPersonal.length; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(paymentPersonal[i]);
		}

		// 데이터 부분 생성

		for (PaymentVo vo : list) {

			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getUserId());

			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getUsernm());

			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getPayDay());

			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getDeptname());

			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getTotalSalary());

			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getTotalWage());

			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(Integer.parseInt(vo.getTotalSalary()) - Integer.parseInt(vo.getTotalWage()));
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		response.setHeader("Content-Disposition", "attachment;filename=" + sdf.format(new Date()) + "_paymentInfo.xls");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

	// Pdf 변환
	 @RequestMapping(path="/htmlToPdf")
	public void htmlToPdf(HttpSession session,HttpServletResponse response, String htmlText) throws DocumentException, IOException {
		// Document 생성
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및
																		// 여백 설정

		// PdfWriter 생성
		// PdfWriter writer = PdfWriter.getInstance(document, new
		// FileOutputStream("d:/test.pdf")); // 바로 다운로드.
		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		writer.setInitialLeading(12.5f);

		// 파일 다운로드 설정
		response.setContentType("application/pdf");
		String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐 인코딩
																// 필요
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
		String cssf = session.getServletContext().getRealPath("\\resources\\css\\sb-admin.css");
		String font = session.getServletContext().getRealPath("\\resources\\vendor\\fontawesome-free\\webfonts\\fa-brands-400.ttf");

		// Document 오픈
		document.open();
		XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		// CSS
		CSSResolver cssResolver = new StyleAttrCSSResolver();
		CssFile cssFile = helper
				.getCSS(new FileInputStream(cssf));
		cssResolver.addCss(cssFile);

		// HTML, 폰트 설정
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register(font, "MalgunGothic"); // MalgunGothic은
																														// alias,
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

		// Pipelines
		PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

		XMLWorker worker = new XMLWorker(css, true);
		XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
		if(htmlText==null){
			htmlText="lee Test";
		}
		// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
		String htmlStr = "<html>" + "<head>"
				+ "<link rel=\"preload\" href=\"./fa-brands-400.woff2\" as=\"font\" type=\"font/woff2\" crossorigin=\"anonymous\">  "
				+ "</head><body style='font-family: MalgunGothic;'>" + "<p>" + htmlText + "</p>"
				+ "<h3>한글, English, 漢字.</h3>" + "</body></html>";

		StringReader strReader = new StringReader(htmlStr);
		xmlParser.parse(strReader);
		
		document.close();
		writer.close();
	}

}
