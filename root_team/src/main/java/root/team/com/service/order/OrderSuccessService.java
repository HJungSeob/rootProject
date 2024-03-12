package root.team.com.service.order;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.OrderDAO;
import root.team.com.vo.OrderVO;

@Service("oSuccess")
@AllArgsConstructor
public class OrderSuccessService implements OrderService {
	private OrderDAO dao;

	public int successOrder(OrderVO orderVO) {

		if (dao.successOrder(orderVO.getB_idx()) == 1) {			
			for (int i = 0; i < orderVO.getOrderStateVO().length; i++) {
				dao.removeItemCount(orderVO.getOrderStateVO()[i]);
			}
			return 1;
		}
		return 0;
	}
}
