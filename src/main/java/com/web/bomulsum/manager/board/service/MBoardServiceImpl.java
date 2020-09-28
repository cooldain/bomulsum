package com.web.bomulsum.manager.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.manager.board.repository.MBoardDAO;
import com.web.bomulsum.manager.board.repository.MBoardListVO;
import com.web.bomulsum.manager.board.repository.MBoardVO;

@Service
public class MBoardServiceImpl implements MBoardService {
	/*
	 * 여기서 서비스 인터페이스를 상속받아서,
	 * 형변환이라던지 데이터를 가공해야 할 필요가 있을 경우 처리를 해준다.
	 */
	
	@Autowired
	private MBoardDAO dao;

	@Override
	public void mboardRegister(MBoardVO vo) {
		String coupon = vo.getAdminNoticeCoupon();
		String userType = vo.getAdminNoticeCategory();
		String alarmTitle;
		
		//쿠폰 세팅
		coupon = coupon.replace(",", "-");
		System.out.println("변환 후 : " + coupon);
		vo.setAdminNoticeCoupon(coupon);
		
		//알람테이블에 넣어줄 유저타입 설정 - 게시판 글은 회원전체에게 보이거나 작가전체에게 보임
		userType = userType.substring(0,3);
		System.out.println("유저타입 변환 후" + userType);
		if(userType.equals("이벤트")) {
			alarmTitle = "이벤트";
			userType = "member_all";
		} else {
			if(userType.equals("회원용")) {
				userType = "member_all";
			} else {
				userType = "writer_all";
			}
			
			//여기로 왔다는건 이벤트가 아니므로, 나머지중에 하나.
			alarmTitle = vo.getAdminNoticeCategory();
			alarmTitle = alarmTitle.substring(4,6);
			System.out.println("알람타이틀 변환 후 :" + alarmTitle);
			if(alarmTitle.equals("공지")) {
				alarmTitle = "공지사항";
			} else if(alarmTitle.equals("자주")) {
				alarmTitle = "자주묻는질문";
			}  else if(alarmTitle.equals("정책")) {
				alarmTitle = "정책등록가이드";
			}
		}
		vo.setAlarmTitle(alarmTitle);
		vo.setAlarmUser(userType);
		vo.setAlarmContent(vo.getAdminNoticeTitle());//알람 내용은 게시판 글 제목으로 설정
		System.out.println("vo 알람 타이틀 출력 : " + vo.getAlarmTitle());
		System.out.println("vo 알람 유저 출력 : " + vo.getAlarmUser());
		System.out.println("vo 알람 콘텐트 출력 : " + vo.getAlarmContent());
		dao.mboardRegister(vo);
	}

	//글 목록 보기 위한 데이터 불러오기
	@Override
	public List<MBoardListVO> mboardList() {
		return dao.mboardList();
	}

	//선택된 글 정보를 불러오기
	@Override
	public MBoardVO mboardSelect(MBoardVO vo) {
		return dao.mboardSelectOne(vo);
	}

	//글 수정 반영
	@Override
	public void mboardUpdate(MBoardVO vo) {
		String coupon = vo.getAdminNoticeCoupon();
		coupon = coupon.replace(",", "-");
		System.out.println("변환 후  쿠폰 값: " + coupon);
		vo.setAdminNoticeCoupon(coupon);
		dao.mboardUpdate(vo);
	}

	//글 삭제 하기
	@Override
	public void mboardDelete(MBoardVO vo) {
		System.out.println("여기까지 들어왔나요? serviceImpl : " + vo.getAdminNoticeSeq());
		dao.mboardDelete(vo);
	}
	
}
