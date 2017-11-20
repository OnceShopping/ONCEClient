package once.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.customer.vo.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * customer 가입
	 * @param customer
	 */
	public void join(CustomerVO customer) {
		sqlSession.insert("once.customer.dao.CustomerDAO.join", customer);
	}
	
	/**
	 * customer 로그인
	 * @param customer
	 * @return
	 */
	public CustomerVO login(CustomerVO customer) {
		CustomerVO customerVO = sqlSession.selectOne("once.customer.dao.CustomerDAO.login", customer);
		
		return customerVO;
	}
	
	/**
	 * customer auto 로그인
	 */
	public CustomerVO autoLogin(String loginId) {
		CustomerVO customerVO = sqlSession.selectOne("once.customer.dao.CustomerDAO.autoLogin", loginId);
		
		return customerVO;
	}
	
	/**
	 * customer 리스트
	 * @return
	 */
	public List<CustomerVO> selectAll(){
		List<CustomerVO> list = sqlSession.selectList("once.customer.dao.CustomerDAO.selectAll");
		
		return list;
	}
}