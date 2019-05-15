package kr.or.ddit.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;

@Controller
public class boardCtr {
	
//	private static final String UPLOAD_PATH = "/Users/macbook/picture";
	
	private static final Logger logger = LoggerFactory.getLogger(boardCtr.class);
	
	@Resource(name="board_detailService")
	private IBoard_detailService board_detailService;
	
	@Resource(name="commentsService")
	private ICommentsService commentsService;
	
	@Resource(name="attach_boardService")
	private IAttach_boardService attach_boardService;
	
	@Resource(name="board_TypeService")
	private IBoard_TypeService board_TypeService;
	
	/**
	 * 
	* Method : boardList
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @return
	* @throws Exception
	* Method 설명 : 게시글 리스트 조회
	 */
	@RequestMapping(value = "/boardList")
    public String boardList(Model model, PageVo pageVo,@RequestParam(defaultValue="title")String searchType, @RequestParam(defaultValue="")String keyword,@RequestParam(defaultValue="")String startDate, @RequestParam(defaultValue="")String endDate) throws Exception {
//        List<Board_detailVo> listview = board_detailService.selectBoardList();
//        
//        model.addAttribute("listview", listview);
//        model.addAttribute("boardTypeCode", param.getBoardTypeCode());
//        return "board/boardListTest";
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		model.addAllAttributes(map);
		model.addAllAttributes(resultMap);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		return "boardList";
    }
	
	/**
	 * 
	* Method : boardForm
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* @throws Exception
	* Method 설명 : 게시글 작성
	 */
	@RequestMapping(value = "/boardForm")
	public String boardForm(Model model, String boardTypeCode, String boardNo) throws Exception {
		
        if (boardNo!=null) {
        	Board_detailVo boardInfo = board_detailService.selectBoardOne(boardNo);
        	List<Attach_boardVo> listview = board_detailService.selectBoardFileList(boardNo);

        	model.addAttribute("boardInfo", boardInfo);
        	model.addAttribute("listview", listview);
        	
        }

		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardNo", boardNo);
		logger.debug("boardTypeCode : {}",boardTypeCode);
	    return "boardForm";
	}
	
	/**
	 * 
	* Method : boardSave
	* 작성자 : macbook
	* 변경이력 :
	* @param boardInfo
	* @return
	* @throws Exception
	* Method 설명 : 게시글 저장 버튼
	 */
	@RequestMapping(value = "/boardSave")
	public String boardSave(@ModelAttribute Board_detailVo boardInfo, HttpServletRequest request
					, String boardTypeCode, String attachCode, Model model, MultipartRequest multipart, String[] removeList, String boardNo) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		boardInfo.setUserId(employeeVo.getUserId());
		if (boardInfo.getBoardNo() == null || "".equals(boardInfo.getBoardNo())) {
			List<Attach_boardVo> attachList =  new ArrayList<Attach_boardVo>();
			List<MultipartFile> attachFiles = multipart.getFiles("attachFile");
			
			
		for (MultipartFile multipartFile : attachFiles) {
			
			if(multipartFile.getSize() > 0){
				
				ServletContext application = session.getServletContext();
				String path = application.getRealPath("/upload");
				
				String attachName = multipartFile.getOriginalFilename();
				String attachRealname = path + File.separator + UUID.randomUUID().toString();
				String attachRealpath = path;
					
				ServletContext app = session.getServletContext();
				String filepath = app.getRealPath("/upload");
				
				attachName = multipartFile.getOriginalFilename();
				attachRealname = filepath + File.separator + UUID.randomUUID().toString();
				attachRealpath = filepath;
				
				multipartFile.transferTo(new File(attachRealname));
				
				Attach_boardVo attachVo = new Attach_boardVo();
				attachVo.setBoardNo(boardNo);
				attachVo.setAttachName(attachName);
				attachVo.setAttachRealname(attachRealname);
				attachVo.setAttachRealpath(attachRealpath);
				
				attachList.add(attachVo);
			}
		}
			board_detailService.insertBoard(boardInfo, attachList);
			model.addAttribute("boardTypeCode", boardTypeCode);
			
		} else {
			
			List<Attach_boardVo> attachList = new ArrayList<>();
			List<MultipartFile> attachFile = multipart.getFiles("attachFile");

			for (MultipartFile multipartFile : attachFile) {

				if (multipartFile.getSize() > 0) {
					ServletContext application = request.getServletContext();
					String path = application.getRealPath("/upload");

					String attachName = multipartFile.getOriginalFilename();
					String attachRealname = path + File.separator + UUID.randomUUID().toString();
					String attachRealpath = path;

					multipartFile.transferTo(new File(attachRealname));

					Attach_boardVo attachVo = new Attach_boardVo();
					attachVo.setAttachCode(attachCode);
					attachVo.setAttachName(attachName);
					attachVo.setAttachRealname(attachRealname);
					attachVo.setAttachRealpath(attachRealpath);

					attachList.add(attachVo);

					model.addAttribute("boardTypeCode", boardTypeCode);
				}
			}
			
			board_detailService.updateBoard(boardInfo, attachList, removeList);
			model.addAttribute("boardTypeCode", boardTypeCode);
			return "redirect:/boardList";
		}
		model.addAttribute("boardTypeCode", boardTypeCode);
		return "redirect:/boardList";
	}
	
	/**
	 * 
	* Method : boardRead
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardNo
	* @param model
	* @param boardTypeCode
	* @return
	* @throws Exception
	* Method 설명 : 게시글 상세 화면
	 */
	@RequestMapping(value = "/boardRead")
	public String boardRead(HttpServletRequest request, String boardNo, Model model, String boardTypeCode) throws Exception {
        
		board_detailService.updateViewsRead(boardNo);
        Board_detailVo boardInfo = board_detailService.selectBoardOne(boardNo);
        List<CommentsVo> replylist = board_detailService.selectBoardReplyList(boardNo);
        List<Attach_boardVo> listview = board_detailService.selectBoardFileList(boardNo);
        
        model.addAttribute("boardInfo", boardInfo);
        model.addAttribute("boardTypeCode", boardTypeCode);
        model.addAttribute("replylist", replylist);
        model.addAttribute("listview", listview);
        
        return "boardRead";
	}
	
	/**
	 * 
	* Method : boardUpdateSave
	* 작성자 : macbook
	* 변경이력 :
	* @param boardInfo
	* @return
	* @throws Exception
	* Method 설명 : 게시글 수정버튼
	 */
//	@RequestMapping(value = "/boardUpdateSave")
//	public String boardUpdateSave(@ModelAttribute("boardInfo") Board_detailVo boardInfo, String attachCode, String boardTypeCode, Model model, HttpServletRequest request,MultipartRequest multipart) throws Exception {
//	        
//		if(attachCode != null){
//			attach_boardService.attach_boardDelete(attachCode);
//		}
//		
//		List<Attach_boardVo> attachList =  new ArrayList<>();
//		List<MultipartFile> attachFile = multipart.getFiles("attachFile");
//		
//		String attachName = "";
//		String attachRealname = "";
//		String attachRealpath = "";
//		
//		for (MultipartFile multipartFile : attachFile) {
//			
//			if(!multipartFile.getName().equals("attachFile")){
//				continue;
//			}
//			ServletContext application = request.getServletContext();
//			String path = application.getRealPath("/upload");
//			
//			attachName = multipartFile.getOriginalFilename();
//			attachRealname = UPLOAD_PATH + File.separator + UUID.randomUUID().toString();
//			attachRealpath = path;
//			
//			if (multipartFile.getSize() > 0 ) {
//				
//				multipartFile.transferTo(new File(attachRealname));
//				
//				Attach_boardVo attachVo = new Attach_boardVo();
//				attachVo.setAttachCode(attachCode);
//				attachVo.setAttachName(attachName);
//				attachVo.setAttachRealname(path + File.separator + attachRealname);
//				attachVo.setAttachRealpath(attachRealpath);
//				
//				attachList.add(attachVo);
//			}
//		}
//		
//		board_detailService.updateBoard(boardInfo, attachList);
//	    model.addAttribute("boardTypeCode", boardTypeCode);
//	    return "redirect:/boardList";
//	}
	
	/**
	 * 
	* Method : boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @return
	* @throws Exception
	* Method 설명 : 게시글 삭제
	 */
	@RequestMapping(value = "/boardDelete")
    public String boardDelete(Model model,String boardNo,String boardTypeCode) throws Exception {
     
     board_detailService.deleteBoardOne(boardNo);
     model.addAttribute("boardTypeCode",boardTypeCode);
     return "redirect:/boardList";
	}
	
	/**
	 * 
	* Method : boardReplySave
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardReplyInfo
	* @return
	* Method 설명 : 댓글 등록
	 */
	@RequestMapping(value = "/boardReplySave")
    public String boardReplySave(Model model, CommentsVo boardReplyInfo, String boardTypeCode) {
		if (boardReplyInfo.getCommentNo()==null || "".equals(boardReplyInfo.getCommentNo())) {
			board_detailService.insertBoardReply(boardReplyInfo);
			model.addAttribute("boardTypeCode", boardTypeCode);
		 } else {
			 board_detailService.updateBoardReply(boardReplyInfo);
			 model.addAttribute("boardTypeCode", boardTypeCode);
		 }
		model.addAttribute("boardTypeCode", boardTypeCode);
        return "redirect:/boardRead?boardNo=" + boardReplyInfo.getBoardNo();
    }

	/**
	 * 
	* Method : boardReplyDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardReplyInfo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	@RequestMapping(value = "/boardReplyDelete")
    public String boardReplyDelete(Model model ,HttpServletRequest request, CommentsVo boardReplyInfo, String boardTypeCode) {
        
		board_detailService.deleteBoardReply(boardReplyInfo.getCommentNo());
		model.addAttribute("boardTypeCode",boardTypeCode);

        return "redirect:/boardRead?boardNo=" + boardReplyInfo.getBoardNo();
    }
	
	/**
	 * 
	* Method : download
	* 작성자 : macbook
	* 변경이력 :
	* @param attachCode
	* @param resp
	* @throws IOException
	* Method 설명 : 파일 다운 
	 */
	@RequestMapping(value = "/download")
	public void download(String attachCode, HttpServletResponse resp) throws IOException{
		Attach_boardVo attachVo = attach_boardService.attachCodeSelectOne(attachCode);
	      String attach_name = new String(attachVo.getAttachName().getBytes("UTF-8"), "ISO-8859-1");
	      
	      FileInputStream fis = new FileInputStream(new File(attachVo.getAttachRealname()));
	      resp.setHeader("Content-Disposition", "attachment; filename=\"" + attach_name + "\"");
	      
	      ServletOutputStream sos = resp.getOutputStream();
	      byte[] buff = new byte[512];
	      int len = 0;
	      
	      while((len = fis.read(buff)) > -1){
	    	  sos.write(buff);
	      }
	      
	      sos.close();
	      fis.close();
	}
	
	
	/**
	 * 
	* Method : boardList
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @return
	* @throws Exception
	* Method 설명 : 게시글 리스트 조회
	 */
	@RequestMapping(value = "/SearchPost")
    public String SearchPost(Model model, @RequestParam(defaultValue="title")String searchType,
    		String keyword,String startDate,String endDate,String boardTypeCode) throws Exception {
		
		Board_detailVo vo = new Board_detailVo();
		
		if(searchType.equals("title")){
			vo.setTitle(keyword);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			vo.setBoardTypeCode(boardTypeCode);
		}else if(searchType.equals("contents")){
			vo.setContents(keyword);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			vo.setBoardTypeCode(boardTypeCode);
		}else if(searchType.equals("userId")){
			vo.setUserId(keyword);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			vo.setBoardTypeCode(boardTypeCode);
		}
		
		model.addAttribute("pageSize", vo.getPageSize());
		model.addAttribute("page", vo.getPage());
		model.addAttribute("boardTypeCode", vo.getBoardTypeCode());
		List<Board_detailVo> postList = board_detailService.SearchPostList(vo);
		model.addAttribute("postList", postList);
		model.addAttribute("boardTypeCode",boardTypeCode);
		
		return "boardList";
    }

}
