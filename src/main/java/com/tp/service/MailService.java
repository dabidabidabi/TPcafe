package com.tp.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {

	//의존성 주입을 통해서 필요한 객체를 가져온다.
    private final JavaMailSender emailSender;
    private String authNum; //랜덤 인증 코드
    private String userid;
    HttpSession session;

    //랜덤 인증 코드 생성
    public void createCode() {
        Random random = new Random();
        StringBuffer key = new StringBuffer();
        for(int i=0;i<8;i++) {
            int index = random.nextInt(3);

            switch (index) {
                case 0 :
                    key.append((char) ((int)random.nextInt(26) + 97));
                    break;
                case 1:
                    key.append((char) ((int)random.nextInt(26) + 65));
                    break;
                case 2:
                    key.append(random.nextInt(9));
                    break;
            }
        }
        authNum = key.toString();
    }
    
    // 아이디값 받아서 전역변수 변경
    public void idDeliver(String id) {
    	userid = id;
    }

    //코드 인증 이메일 폼
    public MimeMessage createEmailForm(String email) throws MessagingException, UnsupportedEncodingException {
    	
        createCode(); //인증 코드 생성
        String setFrom = "dabi9365@gmail.com"; //email-config에 설정한 자신의 이메일 주소(보내는 사람)
        String title = "tpcafe 인증 번호"; //제목

        MimeMessage message = emailSender.createMimeMessage();
        message.addRecipients(MimeMessage.RecipientType.TO, email); //보낼 이메일 설정
        message.setSubject(title); //제목 설정
        message.setFrom(setFrom); //보내는 이메일
        String msg="";
        msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">이메일 주소 확인</h1>";
        msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\">아래 확인 코드를 화면에서 인증란에 입력해주세요.</p>";
        msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
        msg += authNum;
        msg += "</td></tr></tbody></table></div>";
        message.setText(msg, "utf-8", "html"); //내용, charset타입, subtype
       
      
        return message;
    }
    
    // ID 찾기 이메일 폼 & 전송
    public MimeMessage IdfindEmialForm(String email) throws MessagingException, UnsupportedEncodingException {
    	
        
        String setFrom = "dabi9365@gmail.com"; //email-config에 설정한 자신의 이메일 주소(보내는 사람)
        String title = "tpcafe 회원님의 ID를 보내드립니다."; //제목

        MimeMessage message = emailSender.createMimeMessage();
        message.addRecipients(MimeMessage.RecipientType.TO, email); //보낼 이메일 설정
        message.setSubject(title); //제목 설정
        message.setFrom(setFrom); //보내는 이메일
        String msg="";
        msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">회원님의 아이디입니다.</h1>";
        msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\">비밀번호 분실시 비밀번호 찾기를 이용해주세요.</p>";
        msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
        msg += userid;
        msg += "</td></tr></tbody></table></div>";
        message.setText(msg, "utf-8", "html"); //내용, charset타입, subtype
  
        return message;
    }

    //코드 인증 이메일 전송
    public String sendEmail(String email) throws MessagingException, UnsupportedEncodingException {
    
        //메일전송에 필요한 정보 설정
        MimeMessage emailForm = createEmailForm(email);
        //실제 메일 전송
        emailSender.send(emailForm);
        return authNum; //인증 코드 반환
    }
    
    //코드 인증 이메일 전송
    public void sendIdEmail(String email) throws MessagingException, UnsupportedEncodingException {
    
        //메일전송에 필요한 정보 설정
        MimeMessage emailForm = IdfindEmialForm(email);
        //실제 메일 전송
        emailSender.send(emailForm);
         //인증 코드 반환
    }
    
  

}