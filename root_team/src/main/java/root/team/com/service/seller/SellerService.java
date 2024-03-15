package root.team.com.service.seller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import root.team.com.common.PageNav;
import root.team.com.vo.ItemVO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;
import root.team.com.vo.SellerVO;

public interface SellerService {

	default int join(SellerVO sellerVO) {
		return 0;
	}

	default int infoState(SellerVO sellerVO) {
		return 0;
	}

	default SellerVO login(String s_businessnum, String s_pw){
		return null;
	}

	default SellerVO update(SellerVO sellerVO){
		return null;
	}
	
	default int cancel(int s_idx) {
		return 0;
	}
	
	default int storenameCheck(String s_storename) {
		return 0;
	}
	
	default int telCheck(String s_tel) {
		return 0;
	}
	
	default int businessnumCheck(String s_businessnum) {
		return 0;
	}
	
	default int emailCheck(String s_email) {
		return 0;
	}
	
	default void sendEmail(SellerVO sellerVO, String div) throws Exception {
	}

	default void findPw(HttpServletResponse response, SellerVO sellerVO) throws Exception {
	}
	
	default int passwordCheck(int s_idx, String s_pw) {
		return 0;
	}
	
	default String joinEmail(String s_email){
		return null;
	}
	
	default int verifyEmail(String s_email) {
		return 0;
	}
	
	default List<ItemVO> getItem(int s_idx) {
		return null;
	}
	
	default List<ItemVO> getItems(SearchVO vo) {
		return null;
	}
	
	default int getItemTotalCount(SearchVO vo){
		return 0;
	}
	
	default PageNav setPageNav(PageNav pageNav, int pageNum, int pageBlock) {
		return null;
	}
	
	default List<OrderStateVO> getOrder(int s_idx) {
		return null;
	}
	
	default List<OrderStateVO> getOrders(SearchVO vo) {
		return null;
	}
	
	default int getOrderTotalCount(SearchVO vo){
		return 0;
	}
	
	default int updateOrderState(OrderStateVO orderStateVO){
		return 0;
	}
	
	default int updateItemState(ItemVO itemVO){
		return 0;
	}
	
	default List<ReviewVO> getReviews(SearchVO vo) {
		return null;
	}
	
	default int getReviewTotalCount(SearchVO vo){
		return 0;
	}
}
