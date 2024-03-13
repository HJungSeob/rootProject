package root.team.com.service.order;

import java.util.List;

import root.team.com.vo.OrderStateVO;
import root.team.com.vo.OrderVO;

public interface OrderService {

	default int insertOrder(OrderVO orderVO) {
		return 0;
	}

	default int deleteOrder(int bo_idx){
		return 0;
	}

	default int successOrder(OrderVO orderVO){
		return 0;
	}

	default List<OrderStateVO> findOrder(int b_idx, int i_idx){
		return null;
	}
}
