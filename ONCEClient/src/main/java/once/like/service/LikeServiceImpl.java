package once.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.like.dao.LikeDAO;
import once.like.vo.LikeStoreVO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDAO dao;
	
	public void addStore(LikeStoreVO likeStore) {
		dao.addStore(likeStore);
	}

	@Override
	public List<LikeStoreVO> selectLikeStoreList(int memNo) {
		
		List<LikeStoreVO> likeStoreList = dao.selectLikeStoreList(memNo);
		return likeStoreList;
	}

	@Override
	public void deleteStore(LikeStoreVO likeStore) {
		dao.deleteStore(likeStore);
		
	}
}
