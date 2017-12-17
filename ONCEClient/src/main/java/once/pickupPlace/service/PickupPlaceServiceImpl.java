package once.pickupPlace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.pickupPlace.dao.PickupPlaceDAO;
import once.pickupPlace.vo.PickupPlaceVO;

@Service
public class PickupPlaceServiceImpl implements PickupPlaceService {

	@Autowired
	private PickupPlaceDAO dao;

	@Override
	public List<PickupPlaceVO> getAllInfo() {
		
		List<PickupPlaceVO> list = dao.getAllInfo();
		
		return list;
	}

	
}
