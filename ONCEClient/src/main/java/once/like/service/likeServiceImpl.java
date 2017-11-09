package once.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.like.dao.likeDAO;

@Service
public class likeServiceImpl implements likeService {

	@Autowired
	private likeDAO dao;
}
