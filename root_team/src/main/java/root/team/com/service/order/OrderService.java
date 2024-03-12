package root.team.com.service.order;

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
}
