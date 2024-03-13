package root.team.com.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.OrderDAO;
import root.team.com.vo.OrderStateVO;

@Service("oFind")
@AllArgsConstructor
public class OrderFindService implements OrderService {
	private OrderDAO dao;

	public List<OrderStateVO> findOrder(int b_idx, int i_idx) {
		return dao.findOrder(b_idx, i_idx);
	}
}
