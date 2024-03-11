package root.team.com.service.order;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.OrderDAO;
import root.team.com.vo.OrderVO;

@Service("oInsert")
@AllArgsConstructor
public class OrderInsertService implements OrderService {
	private OrderDAO dao;

	public int insertOrder(OrderVO orderVO) {

		if (dao.insertOrder(orderVO) == 1) {
			int result = 0;
			for (int i = 0; i < orderVO.getOrderStateVO().length; i++) {
				orderVO.getOrderStateVO()[i].setBo_idx(orderVO.getBo_idx());
				result += dao.insertOrderState(orderVO.getOrderStateVO()[i]);
				if (result == orderVO.getOrderStateVO().length) {
					return orderVO.getBo_idx();
				}
			}		
		}
		return 0;
	}
}
