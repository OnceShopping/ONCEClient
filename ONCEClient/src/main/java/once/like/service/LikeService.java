package once.like.service;

import java.util.List;

import once.like.vo.LikeStoreVO;

public interface LikeService {

	void addStore(LikeStoreVO likeStore);

	List<LikeStoreVO> selectLikeStoreList(int memNo);

	void deleteStore(LikeStoreVO likeStore);
	
}
