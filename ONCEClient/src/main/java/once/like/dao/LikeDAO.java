package once.like.dao;

import java.util.List;

import once.like.vo.LikeStoreVO;

public interface LikeDAO {

	void addStore(LikeStoreVO likeStore);

	List<LikeStoreVO> selectLikeStoreList(int memNo);

	void deleteStore(LikeStoreVO likeStore);

}
