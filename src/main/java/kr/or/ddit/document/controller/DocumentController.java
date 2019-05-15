package kr.or.ddit.document.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;
import kr.or.ddit.document.model.FilesVo;
import kr.or.ddit.document.service.IDocumentService;
import kr.or.ddit.document.service.IDocument_refService;
import kr.or.ddit.document.service.IFilesService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
//테스트
@Controller
public class DocumentController {
   private Logger logger = LoggerFactory.getLogger(DocumentController.class);

   @Resource(name="document_refService")
   private IDocument_refService document_refService;
   
   @Resource(name="documentService")
   private IDocumentService documentService;
   
   @Resource(name = "employeeService")
   private IEmployeeService employeeService;
   
   @Resource(name = "filesService")
   private IFilesService filesService;
   
   /*-------------------------- 기안함 controller -----------------------*/
   //기안함 리스트 출력
   @RequestMapping("/document")
   public String document(Model model, HttpSession session,DocumentVo documentVo){
      
      EmployeeVo vo = (EmployeeVo) session.getAttribute("employeeVo");
      String userName     = vo.getUserNm().toString();
      String deptName     = vo.getDeptname().toString();
      String positionCode = vo.getPositionCode().toString();
   
      List<DocumentVo> documentList = documentService.getAllDocument();
      List<EmployeeVo> employeeList = employeeService.selectMoreEmployee(positionCode);
      
      model.addAttribute("employeeList",employeeList);
      model.addAttribute("documentList",documentList);
      model.addAttribute("userName",userName);
      model.addAttribute("deptName",deptName);
      model.addAttribute("vo",vo);
      return "document";
   }

   //상세보기 다운로드 
	@RequestMapping(value = "/documentDownload")
	public void documentDownload(String filecode, HttpServletResponse resp) throws IOException{
		logger.debug("filecode:{}",filecode);
		
		 FilesVo filesVo = filesService.selectFiles(filecode);
		 String filename = new String(filesVo.getFilename().getBytes("UTF-8"), "ISO-8859-1");
	      
	      FileInputStream fis = new FileInputStream(new File(filesVo.getRealFilecode()+filesVo.getRealFilename()));
	      resp.setHeader("Content-Disposition", "filename; filename=\"" + filename + "\"");
	      
	      ServletOutputStream sos = resp.getOutputStream();
	      byte[] buff = new byte[512];
	      int len = 0;
	      
	      while((len = fis.read(buff)) > -1){
	    	  sos.write(buff);
	      }
	      sos.close();
	      fis.close();
	}
	
   //상세보기 선택 시 결재버튼 권한 주기  
   @RequestMapping(path = "/selectDocument", produces = { "application/json" })
   @ResponseBody
   public Map<String, Object> selectDocument (String documentNumber, HttpSession session ,Document_refVo document_refVo){
      EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
      String userId        = employeeVo.getUserId().toString();               
      document_refVo.setUserId(userId);
      
      String documentCheck = "";
      List<Document_refVo> selectDocument_ref = document_refService.selectDocument_ref(document_refVo);
      
      for(int i=0; i < selectDocument_ref.size(); i++) {
    	  
      if(selectDocument_ref.get(i).getSortation().equals("완료")){
         documentCheck = "1";
      }else if(selectDocument_ref.get(i).getSortation().equals("참조")){
    	  logger.debug("sdfsddd:{}",selectDocument_ref.get(0).getSortation().equals("참조"));
    	  documentCheck = "2";
      }
      }
      Map<String, Object> map = new HashMap<>();
      map.put("documentCheck", documentCheck);
      map.put("selectList", documentService.selectDocument(documentNumber));
      map.put("selectDocument_ref", document_refService.selectDocument_refNumber(documentNumber));
      map.put("filesList", filesService.documentFileList(documentNumber));
      return map;

   }
   //참조라인 저장 
   @RequestMapping("/getDocumentRefList")
   @ResponseBody
   public Map<String,Object> getDocumentRefList(String check){
	   Map<String,Object> map = new HashMap<>();
	   map.put("check", check);
	   if(check.equals("발주서"))
		   map.put("distributionList", employeeService.selectDeptDistribution());
	   else
		   map.put("distributionList", employeeService.selectDeptCode());
	   return map;
   }
   //승인
   @RequestMapping(path = "/getApproval", produces = { "application/json" })
   @ResponseBody
   public Map<String, Object> getApproval(DocumentVo documentVo, Document_refVo document_refVo, String documentNumber, HttpSession session) { 
      
      EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
       String userId = employeeVo.getUserId().toString();
       String userNm = employeeVo.getUserNm().toString();
       document_refVo.setUserId(userId);
       document_refVo.setDocumentNumber(documentNumber);
       
      List<Document_refVo> selectList = document_refService.selectDocument_ref(document_refVo);
      
      String sortation ="";
      for(int i=0; i < selectList.size(); i++){
         String referenceNumber = selectList.get(i).getReferenceNumber();
         document_refVo.setReferenceNumber(referenceNumber);
         document_refService.updateDocument_ref(document_refVo);
         sortation = selectList.get(i).getSortation();
      }

      Map<String, Object> map = new HashMap<>();
      map.put("selectListNum", document_refService.selectDocument_refNumber(documentNumber));
      map.put("selectList", selectList);
      map.put("userId", userId);
      map.put("sortation", sortation);
      return map;
   }

   //기안함 등록
   @RequestMapping(path="/insertDocument",method=RequestMethod.POST)
   public String insertDocument(Model model, DocumentVo documentVo, Document_refVo document_refVo,String presentDate, String presentDepartment,String documentTypeFrm,
		   						String checkRow,String checkRow_ref, MultipartRequest multipart, FilesVo filesVo,
		   						HttpSession session) throws ParseException, IllegalStateException, IOException{
   
       EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
       
       String userId = employeeVo.getUserId().toString();
       documentVo.setPresentUser(userId);
       
       Date date = new Date();                           
       SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
       date= sdf.parse(presentDate);
       
       documentVo.setPresentDate(date);
       documentVo.setDocumentType(documentTypeFrm);
       documentService.insertDocument(documentVo);
       
       String documentNumber = documentVo.getDocumentNumber();
    
       List<MultipartFile> uploadFile = multipart.getFiles("uploadFile");
      for (int i =0; i<uploadFile.size();i++) {
         MultipartFile multipartFile=uploadFile.get(i);
      if(multipartFile.getSize() > 0){
      
         String path = "C:\\upload";
         
         String filename = multipartFile.getOriginalFilename();
         String realFilename = File.separator + documentNumber+"_"+(i+1)+"_"+filename;
         String realFilecode = path;
         
         multipartFile.transferTo(new File(path+realFilename));
         
         filesVo.setDocumentNumber(documentNumber);
         filesVo.setFilecode("");
         filesVo.setFilename(realFilename);
         filesVo.setRealFilecode(realFilecode);
         filesVo.setRealFilename(realFilename);
      }
      filesService.insertFiles(filesVo);
   }
      String[] arrIdx = checkRow.toString().split(",");
      
      String arr = "";
        for (int i=0; i < arrIdx.length; i++) {
           arr = arrIdx[i];
           document_refVo.setUserId(arr);
           document_refVo.setReferenceNumber("");
           document_refVo.setDocumentNumber(documentNumber);
           document_refService.insertDocument_ref(document_refVo);
        }
        String[] arrIdx2 = checkRow_ref.toString().split(",");
      
        String arr2 = "";
        int cntInsert2 = 0;
          for (int i=0; i < arrIdx2.length; i++) {
             arr2 = arrIdx2[i];
             document_refVo.setUserId(arr2);
             document_refVo.setReferenceNumber("");
             document_refVo.setDocumentNumber(documentNumber);
             document_refVo.setSortation("참조");
             cntInsert2 = document_refService.insertDocument_ref(document_refVo);
          }     
      if(cntInsert2 > 0){
         return "redirect:/document";
      }
      return "redirect:/document";
   }
   /*-------------------------- 임시보관함 controller -----------------------*/
   //임시보관함 출력
      @RequestMapping("/temporarily")
      public String temporarily(Model model, HttpSession session){
         
         EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
         String positionCode   = employeeVo.getPositionCode().toString();
         String deptCode       = employeeVo.getDeptCode().toString();
         String userId         = employeeVo.getUserId().toString();
         String deptName       = employeeVo.getDeptname().toString();
         
         List<EmployeeVo> employeeList = employeeService.selectMoreEmployee(positionCode);
         
         model.addAttribute("employeeList",employeeList);
         model.addAttribute("deptCode",deptCode);
         model.addAttribute("deptName",deptName);
         model.addAttribute("positionCode",positionCode);
         model.addAttribute("userId",userId);
         
         List<DocumentVo> temporarilyList = documentService.getAllTemporarily();  
         model.addAttribute("temporarilyList",temporarilyList);
         
         return "temporarily";
      }
    //임시보관함 수정하기 
      @RequestMapping(path="/updateTemporarily", method=RequestMethod.POST)
      public String updateTemporarily(Model model, DocumentVo documentVo,Document_refVo document_refVo,
                              String documentNumber,String presentDate, String checkRow,String checkRow_ref,
                              MultipartRequest multipart, FilesVo filesVo,
                              HttpSession session) throws ParseException, IllegalStateException, IOException{
    	  logger.debug("documentVo:{}",documentVo);
    	  
    	  filesService.deleteFiles(documentNumber);
    	  List<MultipartFile> uploadFile = multipart.getFiles("uploadFile");
          for (int i =0; i<uploadFile.size();i++) {
             MultipartFile multipartFile=uploadFile.get(i);
          if(multipartFile.getSize() > 0){
          
             String path = "C:\\upload";
             
             String filename = multipartFile.getOriginalFilename();
             String realFilename = File.separator + documentNumber+"_"+(i+1)+"_"+filename;
             String realFilecode = path;
             
             multipartFile.transferTo(new File(realFilename));
             
             filesVo.setDocumentNumber(documentNumber);
             filesVo.setFilecode("");
             filesVo.setFilename(realFilename);
             filesVo.setRealFilecode(realFilecode);
             filesVo.setRealFilename(realFilename);
          }
          filesService.insertFiles(filesVo);
       }
          
          EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
          String userId = employeeVo.getUserId().toString();
          documentVo.setPresentUser(userId);
          
          Date date = new Date();                           
          SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
          date= sdf.parse(presentDate);
          documentVo.setPresentDate(date);
          
          documentService.updateDocument(documentVo);
          document_refService.deleteDocument_ref(documentNumber);
         
          
          int cntInsert = 0;
          if(checkRow.length() > 0){ //결재 지정 안했을 때 
             String[] arrIdx = checkRow.toString().split(",");
             String arr = "";
             for (int i=0; i < arrIdx.length; i++) {
                arr = arrIdx[i];
                document_refVo.setUserId(arr);
                document_refVo.setReferenceNumber("");
                 document_refService.insertDocument_ref(document_refVo);
             }
          }else if(checkRow.length() == 0){
        	   document_refVo.setReferenceNumber("");
               document_refService.insertDocument_ref(document_refVo);
          }if(checkRow_ref.length() > 0){
        	  String[] arrIdx2 = checkRow_ref.toString().split(",");
        	 
              String arr2 = "";
            for (int i=0; i < arrIdx2.length; i++) {
               arr2 = arrIdx2[i];
               document_refVo.setUserId(arr2);
               document_refVo.setReferenceNumber("");
               document_refVo.setDocumentNumber(documentNumber);
               document_refVo.setSortation("참조");
               cntInsert = document_refService.insertDocument_ref(document_refVo);
               
               logger.debug("3..checkRow:{}",checkRow_ref);
            } 
          }else if(checkRow_ref.length() == 0){
        	  document_refVo.setReferenceNumber("");
               document_refService.insertDocument_ref(document_refVo);
		} else {
			if (cntInsert > 0) {
				return "redirect:/temporarily";
			} else {
				return "redirect:/temporarily";
			}
		}
		return "redirect:/temporarily";
	}

   //임시보관함 삭제 
   @RequestMapping("/getDeleteDocument")
   public String getDeleteDocument(String documentNumber, DocumentVo documentVo){
      
      documentService.deleteDocument(documentNumber);
      filesService.deleteFiles(documentNumber);
      return "document";
   }
   
   //임시보관함 버튼 권한주기 
   @RequestMapping(path = "/selectTemporarily", produces = { "application/json" })
   @ResponseBody
   public Map<String, Object> selectTemporarily (String documentNumber, HttpSession session){
      
	   Map<String, Object> map = new HashMap<>();
       map.put("filesList", filesService.documentFileList(documentNumber));
    
      return map;
   }
      
   
   //-----------------------반려함-----------------------------
   //반려함 리스트 출력
   @RequestMapping("/returnDocument")
   public String returnDocument(Model model, HttpSession session,DocumentVo documentVo){
	   EmployeeVo vo = (EmployeeVo) session.getAttribute("employeeVo");
	   
      EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
      String userId = employeeVo.getUserId().toString();
      String userName    = employeeVo.getUserNm().toString();
      String deptName    = employeeVo.getDeptname().toString();
      String positionCode = employeeVo.getPositionCode().toString();
      String deptCode    = employeeVo.getDeptCode().toString();
   
      List<DocumentVo> returenDocumentList = documentService.getAllReturnDocument(userId);
      List<EmployeeVo> employeeList = employeeService.selectMoreEmployee(positionCode);
      
      model.addAttribute("employeeList",employeeList);
      model.addAttribute("returenDocumentList",returenDocumentList);
      model.addAttribute("userName",userName);
      model.addAttribute("deptName",deptName);
      model.addAttribute("deptCode",deptCode);
      model.addAttribute("positionCode",positionCode);
      return "returnDocument";
   }
 
   //반려
   @RequestMapping(path = "/getReturn", produces = { "application/json" })
   @ResponseBody
   public Map<String, Object> getReturn(DocumentVo documentVo, Document_refVo document_refVo, String documentNumber, HttpSession session){ 
      
      EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
       String userId = employeeVo.getUserId().toString();
       document_refVo.setUserId(userId);
       document_refVo.setDocumentNumber(documentNumber);
       
      List<Document_refVo> selectList = document_refService.selectDocument_ref(document_refVo);
      
      String sortation ="";
      for(int i=0; i < selectList.size(); i++){
    	 if(selectList.get(i).getSortation().equals("반려")||selectList.get(i).getSortation().equals("0")){
         String referenceNumber = selectList.get(i).getReferenceNumber();
         document_refVo.setReferenceNumber(referenceNumber);
         document_refService.updateDocument_ref(document_refVo);
         sortation = selectList.get(i).getSortation();
    	 }
      }
      Map<String, Object> map = new HashMap<>();
      map.put("selectListNum", document_refService.selectDocument_refNumber(documentNumber));
      map.put("selectList", selectList);
      map.put("userId", userId);
      map.put("sortation", sortation);
      
      
      return map;
   }
   
   //-----------------------수신함-----------------------------
   @RequestMapping("/receiveDocument")
   public String receiveDocument(Model model, HttpSession session,DocumentVo documentVo){
	 
	  EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
	  String userId = employeeVo.getUserId().toString();
	  List<DocumentVo> undecidedList = documentService.getAllUndecided(userId);
      
      model.addAttribute("undecidedList",undecidedList);
      
      return "receiveDocument";
   }
 
   //미결함 
   @RequestMapping("/undecided")
   public String undecided(Model model, HttpSession session,DocumentVo documentVo){
      
	  EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
	  String userId = employeeVo.getUserId().toString();
	  List<DocumentVo> undecidedList = documentService.getAllUndecided(userId);
      
      model.addAttribute("undecidedList",undecidedList);

      return "undecided";
   }
   
   //완료함
   @RequestMapping("/complete")
   public String complete(Model model, HttpSession session,DocumentVo documentVo){
     
	  EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
      String userId = employeeVo.getUserId().toString();
      List<DocumentVo> completeList = documentService.getAllComplete(userId);
      
      model.addAttribute("completeList",completeList);
      return "complete";
   }
   
   //인사검색 
   @RequestMapping(path = "/deptSearchAjax", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> searchCompany(String deptNm, String usernm, EmployeeVo vo,Model model) {
	   vo.setDeptname(deptNm);
	   vo.setUserNm(usernm);
	   Map<String, Object> map = new HashMap<>();
	   map.put("empolyeeList", employeeService.SearchEmployee(vo));
	   return map;
	}
   
   //참조검색 
   @RequestMapping(path = "/refSearchAjax", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> refSearchAjax(String check, String deptNm1, String usernm1, EmployeeVo vo,Model model) {
	   vo.setDeptname(deptNm1);
	   vo.setUserNm(usernm1);
	  
	   Map<String, Object> map = new HashMap<>();
	   if(check.equals("발주서"))
		   map.put("distributionList", employeeService.searchDistribution(vo));
	   else
		   map.put("distributionList", employeeService.SearchEmployee(vo));
	
	   return map;
	}
   //기안함 검색
   @RequestMapping(path = "/getDocumentSearch", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> searchAjax(String startDate, String endDate, String documentTypes, DocumentVo vo, 
											String search_title, Model model, HttpSession session) {
	  
	   EmployeeVo empvo = (EmployeeVo) session.getAttribute("employeeVo");
	   String userId = empvo.getUserId().toString();
	   
	   vo.setTitle(search_title);
	   vo.setDocumentType(documentTypes);
	   vo.setPresentUser(userId);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("documentList", documentService.searchDocument(vo));
	
	   return map;
	}
   //임시보관함 검색
   @RequestMapping(path = "/getTemprarilySearch", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> getTemprarilySearch(String startDate, String endDate, String documentTypes, DocumentVo vo, 
											String search_title, Model model, HttpSession session) {
	   
	   EmployeeVo empvo = (EmployeeVo) session.getAttribute("employeeVo");
	   String userId = empvo.getUserId().toString();
	   
	   vo.setTitle(search_title);
	   vo.setDocumentType(documentTypes);
	   vo.setPresentUser(userId);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("documentList", documentService.searchTemporarily(vo));
	
	   return map;
	}
   //미결함 검색
   @RequestMapping(path = "/undecidedSearch", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> undecidedSearch(String startDate, String endDate, String documentTypes, DocumentVo vo, 
											String search_title, Model model, HttpSession session) {
	   EmployeeVo empvo = (EmployeeVo) session.getAttribute("employeeVo");
	   String userId = empvo.getUserId().toString();
	   
	   vo.setTitle(search_title);
	   vo.setDocumentType(documentTypes);
	   vo.setUserId(userId);

	   Map<String, Object> map = new HashMap<>();
	   map.put("documentLists", documentService.searchUndecided(vo));
	
	   return map;
	}
   //반려함 검색 
   @RequestMapping(path = "/returnSearch", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> returnSearch(String startDate, String endDate, String documentTypes, DocumentVo vo, 
											String search_title, Model model, HttpSession session) {
	   
	   EmployeeVo empvo = (EmployeeVo) session.getAttribute("employeeVo");
	   String userId = empvo.getUserId().toString();
	   
	   vo.setTitle(search_title);
	   vo.setDocumentType(documentTypes);
	   vo.setUserId(userId);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("returnList", documentService.searchReturn(vo));
	
	   return map;
	}
   
   //기안완료함 검색 
   @RequestMapping(path = "/searchComplete", produces = { "application/json" })
   @ResponseBody
	public Map<String, Object> searchComplete(String startDate, String endDate, String documentTypes, DocumentVo vo, 
											String search_title, Model model, HttpSession session) {
	   
	   EmployeeVo empvo = (EmployeeVo) session.getAttribute("employeeVo");
	   String userId = empvo.getUserId().toString();
	   
	   vo.setTitle(search_title);
	   vo.setDocumentType(documentTypes);
	   vo.setPresentUser(userId);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("completeList", documentService.searchComplete(vo));
	
	   return map;
	}
   
 //삭제 
 	@RequestMapping(path="/completeDelete", method=RequestMethod.GET)
 	public String deleteDept(Model model, @RequestParam("checkRow") String checkRow ){

 		String[] arrIdx = checkRow.toString().split(",");
 	
         for (int i=0; i<arrIdx.length; i++) {
 		    int delCnt = documentService.deleteDocument(arrIdx[i]);
 		}
 		
 		return "redirect:/complete";
 	}
 	
}