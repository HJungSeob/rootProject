package root.team.com.service.order;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.OrderDAO;

@Service("oDelete")
@AllArgsConstructor
public class OrderDeleteService implements OrderService {
	private OrderDAO dao;

	public int deleteOrder(int bo_idx) {
		return dao.deleteOrder(bo_idx);
	}
}
