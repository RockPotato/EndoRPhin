package kr.or.ddit.document.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.document.dao.IFilesDao;
import kr.or.ddit.document.model.FilesVo;

@Service
public class FilesService implements IFilesService{

	@Resource(name="filesDao")
	private IFilesDao filesDao;
	
	@Override
	public int insertFiles(FilesVo filesVo) {
		return filesDao.insertFiles(filesVo);
	}

	@Override
	public FilesVo selectFiles(String filecode) {
		return filesDao.selectFiles(filecode);
	}

	@Override
	public int updateFiles(FilesVo filesVo) {
		return filesDao.updateFiles(filesVo);
	}

	@Override
	public List<FilesVo> documentFileList(String documentNumber) {
		return filesDao.documentFileList(documentNumber);
	}

	@Override
	public int deleteFiles(String filecode) {
		return filesDao.deleteFiles(filecode);
	}

}
