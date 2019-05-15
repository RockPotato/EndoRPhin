package kr.or.ddit.login;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.document.model.Document_refVo;
import kr.or.ddit.document.service.IDocument_refService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.product.service.IReceiveService;
import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.tax_cal.service.ITax_calService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "board_detailService")
	private IBoard_detailService board_detailService;

	@Resource(name = "employeeService")
	private IEmployeeService employeeService;

	@Resource(name = "document_refService")
	private IDocument_refService document_refService;

	@Resource(name = "tax_calService")
	private ITax_calService tax_calService;
	
	@Resource(name="receiveService")
	IReceiveService receiveService;

	@Autowired
	private JavaMailSender mailSender;
	
	public static final String setfrom = "gusdnr1348@naver.com"; // 서버 이메일

	@RequestMapping(path = "/")
	public String on() {
		return "login";
	}

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";

	}

	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String login_post(EmployeeVo employeeVo, HttpSession session,RedirectAttributes ra) {
		EmployeeVo dbEmployeeVo = employeeService.selectEmployee(employeeVo.getUserId());
		if(dbEmployeeVo==null){
			ra.addFlashAttribute("msg", "아이디가 존재하지않습니다.");
			return "redirect:/login";
		}
		if (dbEmployeeVo.getUserId().equals(employeeVo.getUserId())
				&& dbEmployeeVo.getPassword().equals(employeeVo.getPassword())) {
			session.setAttribute("employeeVo", dbEmployeeVo);


			// 미결재함 알림
			try {
				Document_refVo document_refVo = new Document_refVo();
				document_refVo.setUserId(employeeVo.getUserId());
				List<Document_refVo> Document_ref = document_refService.selectDocument_ref(document_refVo);
				session.setAttribute("Document_ref", Document_ref);
			} catch (IndexOutOfBoundsException e) {
				// TODO: handle exception
			}
			return "redirect:/main";
		} else{
			ra.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login";
		}

	}
	
	// erp 메뉴
	@RequestMapping(path = "/main")
	public String helloTiles(Model model) {
		model.addAllAttributes(board_detailService.selectBoardList(new PageVo("7")));
		StringBuffer newsInput = newsInput();
		if (newsInput != null) {
			List<NewsVo> convertStringBuffer = convertStringBuffer(newsInput);
			model.addAttribute("newsList", convertStringBuffer);
		}
		return "main";
	}

	//매입매출 아이템
	@RequestMapping(path="/getTax_calSum6Months")
	@ResponseBody
	public List<Tax_calVo> getTax_calSum6Months(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String today = sdf.format(new Date());
		return tax_calService.sumCheckSearchAllByType(today);
	}
	@RequestMapping(path="/groupSelectReceiveWhileThisYear")
	@ResponseBody
	public List<ReceiveVo> groupSelectReceiveWhileThisYear(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String today = sdf.format(new Date());
		return receiveService.groupSelectReceiveWhileThisYear(today);
	}
	
	
	private List<NewsVo> convertStringBuffer(StringBuffer newsInput) {
		String temp = newsInput.toString();
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(temp);
		} catch (ParseException e) {
			return null;
		}
		JSONArray item = (JSONArray) obj.get("items");
		List<NewsVo> newsList = new ArrayList<>();
		for (int i = 0; i < item.size(); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			NewsVo vo = new NewsVo();
			vo.setTitle((String) tmp.get("title"));
			vo.setLink((String) tmp.get("link"));
			vo.setDescription((String) tmp.get("description"));
			vo.setPubDate((String) tmp.get("pubDate"));
			newsList.add(vo);
		}
		return newsList;
	}

	private StringBuffer newsInput() {
		String clientId = "9imasm8ngGBMomATNCo6";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "7nmNA6zNQd";// 애플리케이션 클라이언트 시크릿값";
		StringBuffer response = null;
		try {
			String text = URLEncoder.encode("it", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?sort=sim&query=" + text; // json
																									// 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine.replaceAll("\\<.*?>", ""));
			}
			br.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return response;
	}

	@RequestMapping(path = "/groupwareMain")
	public String groupwareTiles(Model model) {
		model.addAllAttributes(board_detailService.selectBoardList(new PageVo("7")));
		StringBuffer newsInput = newsInput();
		if (newsInput != null) {
			List<NewsVo> convertStringBuffer = convertStringBuffer(newsInput);
			model.addAttribute("newsList", convertStringBuffer);
		}
		return "groupwareMain";
	}

	/**
	 * 
	 * Method : findInfo 작성자 : macbook 변경이력 :
	 * 
	 * @param model
	 * @return Method 설명 : 아이디 찾기
	 */
	@RequestMapping(path = "/findInfo")
	public String findInfo(Model model) {
		// model.addAllAttributes(board_detailService.selectBoardList(new
		// PageVo("7")));
		// StringBuffer newsInput = newsInput();
		// if(newsInput!=null){
		// List<NewsVo> convertStringBuffer = convertStringBuffer(newsInput);
		// model.addAttribute("newsList",convertStringBuffer);
		// }

		return "login/findInfo";
	}

	@RequestMapping(path = "/findIdSave")
	public String findIdSave(Model model, EmployeeVo employeeVo, String userNm, String BirthDate) {

		employeeVo.setUserNm(userNm);
		employeeVo.setBirthDate(BirthDate);

		String msg = "";

		EmployeeVo findInfoOne = employeeService.findInfoOne(employeeVo);
		if (findInfoOne != null) {
			msg = "찾으시는 아이디는 " + findInfoOne.getUserId() + " 입니다.";
		} else {
			msg = "일치하는 정보가 없습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("findInfoOne", findInfoOne);
		logger.debug("msg:asdasdasd,{}", msg);
		logger.debug("findInfoOne: {}", findInfoOne);
		return "login/findId";
	}

	@RequestMapping(path = "/findPass")
	public String findPass(Model model, EmployeeVo employeeVo) {

		return "login/findPass";
	}

	@RequestMapping(path = "/findPassSave")
	public String findPassSave(Model model, EmployeeVo employeeVo, String email, String userId, HttpSession session)
			throws Exception {
		employeeVo.setUserId(userId);
		employeeVo.setEmail(email);
		EmployeeVo findInfoOne = employeeService.findInfoOne(employeeVo);

		String msg = "";
		if (findInfoOne == null) {
			msg = "아이디와 이메일을 다시 확인하세요.";
			model.addAttribute("msg", msg);
			return "login/findPass";
		}

		if (!email.equals(findInfoOne.getEmail()) && !userId.equals(findInfoOne.getUserId())) {

			msg = "아이디와 이메일을 다시 확인하세요.";
			model.addAttribute("msg", msg);
			return "login/findPass";

		} else if (email.equals(findInfoOne.getEmail()) && userId.equals(findInfoOne.getUserId())) {
			String pw = UUID.randomUUID().toString().replaceAll("-", "");
			pw = pw.substring(0, 8);

			// String encCode = ""; //암호화
			try {
				// encCode = pw;
			} catch (Exception e) {
				e.printStackTrace();
			}
			// employeeVo.setPassword(encCode);
			employeeVo.setPassword(pw);
			employeeVo.setUserId(userId);

			try {
				employeeService.update_userPwd(employeeVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			msg = "임시 비밀번호를 메일로 전송하였습니다.";

			String tomail = findInfoOne.getEmail(); // 받는 사람 이메일
			String title = "EndoRPhin 임시 비밀번호 "; // 제목
			String content = "임시 비밀번호는 [ " + pw.toString() + " ] 입니다."; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("msg", msg);
		return "login/findPass";
	}
	
	@RequestMapping(path="/changePass")
	public String findPassSave(Model model) throws Exception{
		return "pass";
	}
}
