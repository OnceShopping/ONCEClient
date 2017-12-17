package once.like.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import once.customer.vo.CustomerVO;
import once.like.service.LikeService;
import once.like.vo.LikeStoreVO;

@Controller
public class LikeController {

	@Autowired
	private LikeService service;
	
	@ResponseBody	
	@RequestMapping(value = "/likeStore", method=RequestMethod.GET)	
	public Map<String, Object> addStore (@RequestParam("storeName") String storeName, HttpSession session) {
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
		
		LikeStoreVO likeStore = new LikeStoreVO();
		
		String id = loginVO.getId();
		
		String msg = null;
		Map<String, Object> map = new HashMap<>();
		List<LikeStoreVO> likeStoreList = service.selectLikeStoreList(loginVO.getMemNo());
		int size = likeStoreList.size();
		for (int i = 0; i <= size; i++) {
			if (i == likeStoreList.size()) {
				likeStore.setId(id);
				likeStore.setStoreName(storeName);
				
				service.addStore(likeStore);
				msg = "즐겨찾기에 추가되었습니다.";
			} else if(storeName.equals(likeStoreList.get(i).getStoreName())) {
				msg = "이미 즐겨찾기에 추가되었습니다.";
				break;
			} 
		}
		
		System.out.println(msg);
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteLikeStore")
	public void deleteStore (@RequestParam("storeName") String storeName, HttpSession session) {
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
		
		LikeStoreVO likeStore = new LikeStoreVO();
		
		int memNo = loginVO.getMemNo();
		
		likeStore.setMemNo(memNo);
		likeStore.setStoreName(storeName);
		
		service.deleteStore(likeStore);
		
	}
	
	@RequestMapping("/mypage/likeStore")
	public String likeStore(Model model, HttpSession session) {
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
	
		int memNo = loginVO.getMemNo();
		
		List<LikeStoreVO> likeStoreList = service.selectLikeStoreList(memNo);
		
		model.addAttribute("likeStoreList", likeStoreList);
		
		return "mypage/likeStore";
	}
	
	
}
