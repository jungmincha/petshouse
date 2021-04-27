package com.pet.ex.service;

import javax.servlet.annotation.WebListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;




import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebListener
public class HttpSessionListenerImpl implements HttpSessionListener {
	
	@Override
    public void sessionCreated(HttpSessionEvent event)  {
			
		event.getSession().setMaxInactiveInterval(60*30);//세션 생성주기 유효기간 정하기 60초 곱하기 30 = 30분
		
		VisitorDao dao =  new VisitorDao();//Dao 생성
		
     
        log.info("세션 생성! 세션id : " + event.getSession().getId());
      
        System.out.println(event.getSession().getCreationTime());
        dao.setCount();
        
    }
 

	@Override
    public void sessionDestroyed(HttpSessionEvent event)  {
  
        log.info("세션 종료! 세션id : " + event.getSession().getId());
        
    }
     
}
