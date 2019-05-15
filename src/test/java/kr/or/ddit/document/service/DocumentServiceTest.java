package kr.or.ddit.document.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import com.sun.media.jfxmedia.logging.Logger;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;
import kr.or.ddit.set.LogicConfig;

public class DocumentServiceTest extends LogicConfig{

	@Resource(name="documentService")
	IDocumentService documentService;

	@Resource(name="document_refService")
	IDocument_refService document_refService;
	
	@Test
	public void insertDocumentTest() {
		
		Date date = new Date();									
			
		DocumentVo documentVo = new DocumentVo();
		documentVo.setDocumentNumber("45454545");
		documentVo.setTitle("1");
		documentVo.setPreservation("11");
		documentVo.setPresentDate(date);
		documentVo.setContents("1111");
		documentVo.setPresentDepartment("100");
		documentVo.setPresentUser("11");
		
		int insertCompany = documentService.insertDocument(documentVo);
		assertTrue(insertCompany==1);
	}
	@Test
	public void updateDocumentTest() {
		
		Date date = new Date();									
			
		DocumentVo documentVo = new DocumentVo();
		documentVo.setDocumentNumber("57");
		documentVo.setTitle("1");
		documentVo.setPreservation("1002");
		documentVo.setPresentDate(date);
		documentVo.setContents("1111");
		documentVo.setPresentDepartment("100");
		documentVo.setPresentUser("11");
		documentVo.setTempSortation("1");
		
		int insertCompany = documentService.updateDocument(documentVo);
		assertTrue(insertCompany==1);
	}
	@Test
	public void updateDocument_refTest() {
			
		Document_refVo document_refVo = new Document_refVo();
		 
		document_refVo.setDocumentNumber("65");
		document_refVo.setReferenceNumber("220");
		document_refVo.setSortation("1");
		document_refVo.setUserId("10041");
		int insertCompany = document_refService.updateDocument_ref(document_refVo);
		assertTrue(insertCompany==1);
	}

	@Test
	public void insertDocument_RefTest() {
		
		Document_refVo document_refVo = new Document_refVo();
		document_refVo.setReferenceNumber("");
		document_refVo.setDocumentNumber("123");
		document_refVo.setSortation("0");
		document_refVo.setUserId("11");
	
		int insertDocument_ref = document_refService.insertDocument_ref(document_refVo);
		assertTrue(insertDocument_ref==1);
	}
	
	@Test
	public void selectDocument_refTest() {
		
		Document_refVo document_refVo = new Document_refVo();
		//document_refVo.setDocumentNumber("1231");
		document_refVo.setUserId("P444");
	
		List<Document_refVo> Document_ref = document_refService.selectDocument_ref(document_refVo);
		System.out.println("Document_ref"+Document_ref);
		
		for (int i = 0; i < Document_ref.size(); i++) {
			if(Document_ref.get(i).getSortation() == "0"){
				
			}
			
		}
	}
	
	@Test
	public void searchDocumentTest(){
		DocumentVo vo = new DocumentVo();
		vo.setDocumentType("품의서");
		vo.setStartDate("19-04-01");
		vo.setEndDate("19-04-28");
		vo.setTitle("첨부파일 ");
		List<DocumentVo> searchDocument = documentService.searchDocument(vo);
		System.out.println("ajkgjkajsgkjaksdjgk"+ searchDocument.size());
		
	}
	
	@Test
	public void searchTemporarily(){
		DocumentVo vo = new DocumentVo();
		vo.setDocumentType("품의서");
		vo.setStartDate("19-04-01");
		vo.setEndDate("19-05-27");
		vo.setTitle("리");
		List<DocumentVo> searchTemporarily = documentService.searchTemporarily(vo);
			System.out.println("ㅁㅇㄴㄹㅁㄴㅇㄹㅁ"+searchTemporarily);
	}
	
	@Test
	public void searchUndecided(){
		DocumentVo vo = new DocumentVo();
		vo.setDocumentType("품의서");
		vo.setStartDate("19-05-01");
		vo.setEndDate("19-05-3");
		vo.setTitle("리");
		vo.setPresentUser("P10041");
		List<DocumentVo> searchUndecided = documentService.searchUndecided(vo);
		System.out.println("ajsdlfjalsdjflak"+searchUndecided.size());
	}
	
	@Test
	public void searchReturn(){
		DocumentVo vo = new DocumentVo();
		vo.setDocumentType("품의서");
		vo.setStartDate("19-05-01");
		vo.setEndDate("19-05-3");
		vo.setTitle("박");
		vo.setUserId("P11");
		List<DocumentVo> searchReturn = documentService.searchReturn(vo);
		System.out.println("ajsdlfjalsdjflak"+searchReturn.size());
	}
}
