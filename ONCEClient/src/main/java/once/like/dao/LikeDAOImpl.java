package once.like.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.like.vo.LikeStoreVO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void addStore(LikeStoreVO likeStore) {
		
		
		int memNo = sqlSession.selectOne("once.like.dao.LikeDAO.selectMemNo", likeStore);
		
		String storeNo = sqlSession.selectOne("once.like.dao.LikeDAO.selectStoreNo", likeStore);
		
		likeStore.setMemNo(memNo);
		likeStore.setStoreNo(storeNo);
		
		sqlSession.insert("once.like.dao.LikeDAO.insertlike", likeStore);
		
	}
	
	@Override
	public void deleteStore(LikeStoreVO likeStore) {
		
		String storeNo = sqlSession.selectOne("once.like.dao.LikeDAO.selectStoreNo", likeStore);
		
		likeStore.setStoreNo(storeNo);
		
		sqlSession.delete("once.like.dao.LikeDAO.deletelike", likeStore);
		
	}

	@Override
	public List<LikeStoreVO> selectLikeStoreList(int memNo) {
		
		List<LikeStoreVO> likeStoreList = sqlSession.selectList("once.like.dao.LikeDAO.selectLikeStore", memNo);
		
		return likeStoreList;
	}
	
	
}
