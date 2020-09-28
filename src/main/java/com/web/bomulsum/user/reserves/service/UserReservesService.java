package com.web.bomulsum.user.reserves.service;

import java.util.List;

import com.web.bomulsum.user.reserves.repository.UserReservesVO;

public interface UserReservesService {
	List<UserReservesVO> getUserPoint(String member);
	int getUserPointUse(String member);
	int getUserSumReserves(String member);
	int selectRefundReserves(String member);
}
