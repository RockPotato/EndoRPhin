package kr.or.ddit.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.board.service.Attach_boardService;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;


@Controller
public class Board_detailController {
	
	private static final String UPLOAD_PATH = "/Users/macbook/picture";
	
	private static final Logger logger = LoggerFactory.getLogger(Board_detailController.class);

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
	* Method : postList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	@RequestMapping(path="/postList", method=RequestMethod.GET)
	public String postList(PageVo pageVo, Model model, String boardTypeName){
		
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		model.addAllAttributes(resultMap);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		model.addAttribute("boardTypeName", boardTypeName);
		
		return "postList";
	}
	
	/**
	 * 
	* Method : boarddetail
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	@RequestMapping(path="/boardDetail",method=RequestMethod.GET)
	public String boardDetail(Model model, String boardNo, String boardTypeName, String boardTypeCode){
		
		Map<String, Object> resultMap = board_detailService.postDetail(boardNo);
		
		Board_detailVo post = (Board_detailVo) resultMap.get("post");
		List<Attach_boardVo> attachList = (List<Attach_boardVo>) resultMap.get("attachList");
		List<CommentsVo> commentList = (List<CommentsVo>) resultMap.get("commentList");
		
		model.addAllAttributes(resultMap);
		model.addAttribute("post", post);
		model.addAttribute("attachList", attachList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		return "boardDetail";
	}
	
	@RequestMapping(path="/postInsert",method=RequestMethod.GET)
	public String postInsert(Model model, String boardTypeCode, String boardTypeName){
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		return"postInsert";
	}
	
	@RequestMapping(path="/postInsert",method=RequestMethod.POST)
	public String postInsert(Model model, @RequestParam(value="boardTypeCode")String boardTypeCode, @RequestParam(value="boardTypeName")String boardTypeName,
							HttpServletRequest request, MultipartRequest multipart, Board_detailVo board_detailVo) throws Exception{
		HttpSession session = request.getSession();
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		board_detailVo.setUserId(employeeVo.getUserId());
		
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		
		List<Attach_boardVo> attachList =  new ArrayList<>();
		List<MultipartFile> attachFiles = multipart.getFiles("attachFile");
		
		String attachName = "";
		String attachRealname = "";
		String attachRealpath = "";
		
		for (MultipartFile multipartFile : attachFiles) {
			
			if(!multipartFile.getName().equals("attachFile")){
				continue;
			}
			
			ServletContext application = session.getServletContext();
			String path = application.getRealPath("/upload");
			
			attachName = multipartFile.getOriginalFilename();
			attachRealname = path + File.separator + UUID.randomUUID().toString();
			attachRealpath = path;
			
			if (multipartFile.getSize() > 0 ) {
				
				multipartFile.transferTo(new File(attachRealname));
				
				Attach_boardVo attachVo = new Attach_boardVo();
				attachVo.setAttachName(attachName);
				attachVo.setAttachRealname(attachRealname);
				attachVo.setAttachRealpath(attachRealpath);
				
				attachList.add(attachVo);
			}
		}
		
		board_detailService.postInsert(board_detailVo, attachList);
		return "redirect:boardDetail?boardNo=" + board_detailVo.getBoardNo();
	}
	
	@RequestMapping(path="/deletecomment",method=RequestMethod.POST)
	public String deleteComment(String boardNo, String boardTypeName, Model model){
		commentsService.deleteComments(boardNo);
		model.addAttribute("boardTypeName",boardTypeName);
		return "redirect:boardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(path="/writecomment",method=RequestMethod.POST)
	public String writeComment(Model model,CommentsVo commentsVo ,String userId, String boardNo, String boardTypeName){
		commentsVo.setCommentUser(userId);
		
		commentsService.insertComments(commentsVo);
		model.addAttribute("boardTypeName",boardTypeName);
		
		return "redirect:boardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(path="/deletepost",method=RequestMethod.GET)
	public String deletePost(Model model, String boardNo, String boardTypeName, String boardTypeCode){
		board_detailService.postDelete(boardNo);
		Map<String, Object> resultMap = board_detailService.postDetail(boardNo);
		Board_detailVo postVo = (Board_detailVo) resultMap.get("post");
		
		model.addAttribute("boardTypeName",boardTypeName);
		return "redirect:/postList?boardTypeCode="+boardTypeCode;
	}
	
	@RequestMapping(path="/postUpdate",method=RequestMethod.GET)
	public String postUpdate(Model model, String boardNo, String boardTypeName,
			  					String boardTypeCode, Board_detailVo board_detailVo){
		
		Map<String, Object> resultMap = board_detailService.postDetail(boardNo);
		
		Board_detailVo post = (Board_detailVo) resultMap.get("post");
		List<Attach_boardVo> attachList = (List<Attach_boardVo>) resultMap.get("attachList");
		List<CommentsVo> commentList = (List<CommentsVo>) resultMap.get("commentList");
		
		
		model.addAllAttributes(resultMap);
		model.addAttribute("post", post);
		model.addAttribute("attachList", attachList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		model.addAttribute("boardNo", boardNo);
		
		return "postUpdate";
	}
	@RequestMapping(path="/postUpdate",method=RequestMethod.POST)
	public String postUpdate(Model model,Board_detailVo board_detailVo,String attachCode, String boardNo, String boardTypeName,
								String boardTypeCode, HttpServletRequest request,MultipartRequest multipart) throws Exception{
		
		
		
		if(attachCode != null){
			attach_boardService.attach_boardDelete(attachCode);
		}
		
		List<Attach_boardVo> attachList =  new ArrayList<>();
		List<MultipartFile> attachFile = multipart.getFiles("attachFile");
		
		String attachName = "";
		String attachRealname = "";
		String attachRealpath = "";
		
		for (MultipartFile multipartFile : attachFile) {
			
			if(!multipartFile.getName().equals("attachFile")){
				continue;
			}
			ServletContext application = request.getServletContext();
			String path = application.getRealPath("/upload");
			
			attachName = multipartFile.getOriginalFilename();
			attachRealname = UPLOAD_PATH + File.separator + UUID.randomUUID().toString();
			attachRealpath = path;
			
			if (multipartFile.getSize() > 0 ) {
				
				multipartFile.transferTo(new File(attachRealname));
				
				Attach_boardVo attachVo = new Attach_boardVo();
				attachVo.setAttachCode(attachCode);
				attachVo.setAttachName(attachName);
				attachVo.setAttachRealname(path + File.separator + attachRealname);
				attachVo.setAttachRealpath(attachRealpath);
				
				attachList.add(attachVo);
			}
		}
		
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		
		int postUpdate = board_detailService.postUpdate(board_detailVo, attachList);
		if(postUpdate > 0){
			return "redirect:boardDetail?boardNo=" + boardNo;
		}
		
		return "redirect:boardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(path="/attachDownload")
	public void attachDownload(String attachCode, HttpServletResponse resp) throws IOException{
//		  resp.setCharacterEncoding("UTF-8");
//	      resp.setContentType("application/octet-stream");
	      
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
	
	@RequestMapping(path="/free")
	public String free(PageVo pageVo, Model model, String boardTypeName){
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		model.addAllAttributes(resultMap);
		
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		model.addAttribute("boardTypeName", boardTypeName);
		return "freeboardTest";
	}
	
}

