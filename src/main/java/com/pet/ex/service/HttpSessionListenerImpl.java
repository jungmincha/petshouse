package com.pet.ex.service;

import javax.servlet.annotation.WebListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebListener//스프링부트에서 리스너를 등록하는 어노테이션이다. application.java에  어노테이션 ServletComponentScan 추가해줘야 어플리케이션 실행시 리스너를 읽는다!
public class HttpSessionListenerImpl implements HttpSessionListener {//HttpSessionListener를 상속받아서 sessionCreated 함수를 사용한다.
	
	@Override//sessionCreated 함수는 세션이 생성될때 이용 가능하다. 세션 아이디 정보 및 세션의 유효기간 설정등을 해줄 수 있다. 
    public void sessionCreated(HttpSessionEvent event)  {
			
		event.getSession().setMaxInactiveInterval(60*30);//세션 생성주기 유효기간 정하기 60초 곱하기 30 = 30분
		
		VisitorDao dao =  new VisitorDao();//Dao 생성
		
     
        log.info("세션 생성! 세션id : " + event.getSession().getId());
        System.out.println(event.getSession().getCreationTime());
        dao.setCount();
        
    }
 

	@Override//sessionDestroyed은 세션이 종료될때 실행되는 함수이다.
    public void sessionDestroyed(HttpSessionEvent event)  {
  
        log.info("세션 종료! 세션id : " + event.getSession().getId());
        
    }
     
}
