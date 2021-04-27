package com.pet.ex.service;

import javax.servlet.annotation.WebListener; 
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;






import com.pet.ex.vo.VisitorVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@WebListener
public class HttpSessionListenerImpl implements HttpSessionListener {
	

	
	

	@Override
    public void sessionCreated(HttpSessionEvent se)  {
		
		if(se.getSession().isNew()) {
			System.out.println("ddddddddddddddddddddddddddddsssssssssssssssss");
		}
		
		
		VisitorDao dao = new VisitorDao();
		//VisitorVO visitorVO = new VisitorVO();
        log.info("===============================dfdfdfdfdfdfdfdddddddddddddddddddd================================================");
        log.info("세션이 생성 되었습니다." + se.getSession().getId());
        System.out.println("dddddddddddddddddddddddddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssdddddddddddddd");
        System.out.println(se.getSession().getCreationTime());
     
        //DB에 넣어주는 서비스 호출
        dao.setCount();
        
    }
 

	@Override
    public void sessionDestroyed(HttpSessionEvent se)  {
  
        log.info("===============================================================================");
        log.info("세션이 종료 되었습니다." + se.getSession().getId());
        
    }
     
}
