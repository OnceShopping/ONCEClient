package once.customer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public boolean checkPassword(String id, String password) {
		boolean result = false;
		
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("password", password);
        
        int count = sqlSession.selectOne("once.customer.dao.CustomerDAO.checkPassword", map);
        if(count == 1) {
        	result= true;
        }
        
        return result;
	}

	@Override
	public void selectById(String id) {
		sqlSession.selectOne("once.customer.dao.CustomerDAO.selectOneCustomer", id);
	}

	@Override
	public void modifyCustomer(String id, String password, String telephone, String orderPassword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		map.put("telephone", telephone);
		map.put("orderPassword", orderPassword);
		
		sqlSession.update("once.customer.dao.CustomerDAO.modifyCustomer", map);
	}

	@Override
	public void deleteCustomer(String id) {
		sqlSession.delete("once.customer.dao.CustomerDAO.deleteCustomer", id);
	}
	
	@Override
	public boolean checkEmail(String email) {
		CustomerVO customer = sqlSession.selectOne("once.customer.dao.CustomerDAO.selectOneCustomer2", email);
		System.out.println(customer);
		if(customer==null)
			return false;
		else
			return true;
	}

	@Override
	public boolean checkId(String id) {
		CustomerVO customer = sqlSession.selectOne("once.customer.dao.CustomerDAO.selectOneCustomer", id);
		
		if(customer==null)
			return false;
		else
			return true;
	}

	@Transactional
	@Override
	public int approvalCustomer(CustomerVO customer) {
		return sqlSession.update("once.customer.dao.CustomerDAO.approvalCustomer", customer);
	}

	@Override
	public String findId(String email) {
		return sqlSession.selectOne("once.customer.dao.CustomerDAO.findId", email);
	}

	@Transactional
	@Override
	public int updatePw(CustomerVO customer) {
		return sqlSession.update("once.customer.dao.CustomerDAO.updatePw", customer);
	}
	

}