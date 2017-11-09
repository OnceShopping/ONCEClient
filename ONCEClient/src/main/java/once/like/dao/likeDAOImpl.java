package once.like.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class likeDAOImpl implements likeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
