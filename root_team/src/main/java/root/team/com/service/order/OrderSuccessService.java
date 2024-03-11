package root.team.com.service.order;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.OrderDAO;

@Service("oSuccess")
@AllArgsConstructor
public class OrderSuccessService implements OrderService {
	private OrderDAO dao;

	public int successOrder(int b_idx) {
		return dao.successOrder(b_idx);
	}
}
