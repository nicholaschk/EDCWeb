package com.sdm.edc.controller;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sdm.edc.form.Edc8583Form;
import com.sdm.edc.util.Config;
import com.solab.iso8583.IsoMessage;
import com.solab.iso8583.IsoType;
import com.solab.iso8583.MessageFactory;

@Controller
@RequestMapping(value = "/edc/")
public class EdcController {
	
	@RequestMapping(value = "welcome")
	public ModelAndView welcome(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model) {
		System.out.println("Load welcome");
		return new ModelAndView("/edc/welcome", "form", form);
	}
	
	@RequestMapping(value = "logoff")
	public ModelAndView logoff(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model) {
		System.out.println("Load logoff");
		model.addAttribute("success", "Log off successful");
		model.addAttribute("error", "");
//		return new ModelAndView("/edc/welcome", "form", form);
		return new ModelAndView("/common/login", "form", form);
	}

	
	@RequestMapping(value = "edc0100sim")
	public ModelAndView edc0100sim(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model) {
		System.out.println("Load edc0100sim");
		return new ModelAndView("/edc/edc0100sim", "form", form);
	}
	
	@RequestMapping(value = "edc0200sim")
	public ModelAndView edc0200sim(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model, HttpServletRequest request) {
		System.out.println("Load edc0200sim");
		Cookie[] cookies = request.getCookies();
		String jsessionid = "";

		for (Cookie e : cookies) {

			if (e.getName().equals("JSESSIONID")) {

				jsessionid = e.getValue();

			}

		}

		System.out.println("JSESSIONID=" + jsessionid);
		System.out.println(" SESSIONID=" + request.getSession().getId());

        

		return new ModelAndView("/edc/edc0200sim", "form", form);
	}
	
	@RequestMapping(value = "edcsimreq0100")
	public ModelAndView edcsimreq0100(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model, HttpSession session) {
		Date start = new Date();
		System.out.println("Start edcsimreq0100::"+start);
		try{
			MessageFactory mfact = new MessageFactory<>();
			IsoMessage m  = mfact.newMessage(0x100);
			
			String pan                     =form.getInput002();
			String procCode                =form.getInput003();
			String amtTransaction          =form.getInput004();
			String transDateTime           =form.getInput007();
			String systemTraceNumber       =form.getInput011();
			String localTransactionTime    =form.getInput012();
			String localTransactionDate    =form.getInput013();
			String cardExpiryDate          =form.getInput014();
			String merchantCategoryCode    =form.getInput018();
			String countryCode             =form.getInput019();
			String posEntryMode            =form.getInput022();
			String posConditionCode        =form.getInput025();
			String binNumber               =form.getInput032();
			String track2Data              =form.getInput035();
			String retrievalRefNumber      =form.getInput037();
			String terminalId              =form.getInput041();
			String cardAcceptorIdCode      =form.getInput042();
			String cardAcceptorName        =form.getInput043();
			String transactionCurrencyCode =form.getInput049();
			String adviceReasonCode        =form.getInput060();
			String posData                 =form.getInput061();
			
			AtomicInteger atomInteger = (AtomicInteger) session.getServletContext().getAttribute("traceNumber");
			Integer trace = atomInteger.get();
			if(trace == 0){
//				atomInteger.set(new Integer(edcConfig.getTraceSeq1()));
				trace = atomInteger.incrementAndGet();
			}else{
				trace = atomInteger.incrementAndGet();
			}
			
			systemTraceNumber = trace.toString();
			
			System.out.println("systemTraceNumber::"+systemTraceNumber);
			
			
//			if(true){
//				Thread.sleep(10000);
//				System.out.println("END:systemTraceNumber::"+systemTraceNumber);
//				return new ModelAndView("/edc/edc0100sim", "form", form);
//			}
			
			m.setValue(2, pan, IsoType.LLVAR,19);
			m.setValue(3, procCode, IsoType.NUMERIC, 6);
			m.setValue(4, amtTransaction, IsoType.NUMERIC, 12);
			m.setValue(7, transDateTime, IsoType.NUMERIC, 10);
			m.setValue(11, systemTraceNumber, IsoType.NUMERIC, 6);
			m.setValue(12, localTransactionTime, IsoType.NUMERIC, 6);
			m.setValue(13, localTransactionDate, IsoType.NUMERIC, 4);
			m.setValue(14, cardExpiryDate, IsoType.NUMERIC, 4);
			m.setValue(18, merchantCategoryCode, IsoType.NUMERIC, 4);
			m.setValue(19, countryCode, IsoType.NUMERIC, 3);
			m.setValue(22, posEntryMode, IsoType.NUMERIC, 3);
			m.setValue(25, posConditionCode, IsoType.NUMERIC, 2);
			m.setValue(32, binNumber, IsoType.LLVAR, 11);
			m.setValue(35, track2Data, IsoType.LLVAR, 37);
			m.setValue(37, retrievalRefNumber, IsoType.ALPHA, retrievalRefNumber.length());
			m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
			m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
			m.setValue(43, cardAcceptorName, IsoType.ALPHA, cardAcceptorName.length());
			m.setValue(49, transactionCurrencyCode, IsoType.NUMERIC, 3);
			m.setValue(60, adviceReasonCode, IsoType.LLLVAR, 999);
			m.setValue(61, posData, IsoType.LLLVAR, 200);
			
			String length = StringUtils.leftPad(m.debugString().length()+"",4,"0");
			String data = m.debugString();
			data = length + data;
			
//			ClientServer cs = new ClientServer("10.30.100.235", 8211);
//			cs.connect();
//			cs.sendMessage(data);
		
			System.out.println("moving on");
//			InputStream input = cs.getInput();
//			byte[] dataOutput = new byte[7500];
//			int readStat = input.read(dataOutput);
//			System.out.println("readStat:"+readStat);
//			System.out.println("output  :["+new String(dataOutput)+"]");
			
//			String pan = "4119111374134828";
//			m.setValue(2, pan, IsoType.LLVAR,19);
//			m.setValue(3, "000000", IsoType.NUMERIC, 6);
//			m.setValue(4, "000000004000", IsoType.NUMERIC, 12);
//			m.setValue(7, "0407091505", IsoType.NUMERIC, 10);
//			m.setValue(11, "930997", IsoType.NUMERIC, 6);
//			m.setValue(12, "181505", IsoType.NUMERIC, 6);
//			m.setValue(13, "0407", IsoType.NUMERIC, 4);
//			m.setValue(14, "1912", IsoType.NUMERIC, 4);
//			m.setValue(18, "5999", IsoType.NUMERIC, 4);
//			m.setValue(19, "840", IsoType.NUMERIC, 3);
//			m.setValue(22, "901", IsoType.NUMERIC, 3);
//			m.setValue(25, "00", IsoType.NUMERIC, 2);
//			String binNumber = "000050";
//			m.setValue(32, binNumber, IsoType.LLVAR, 11);
//			String track2 = "4119111374134828=19121210012300000";
//			m.setValue(35, track2, IsoType.LLVAR, 37);
//			String retrievalRefNum = "409806930992";
//			m.setValue(37, retrievalRefNum, IsoType.ALPHA, retrievalRefNum.length());
//			String terminalId = "22211111";
//			m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
//			String cardAcceptorIdCode = "000005000000001";
//			m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
//			String cardAcceptorNameLoc = "VANILLA AIR              TOKYO        US";
//			m.setValue(43, cardAcceptorNameLoc, IsoType.ALPHA, cardAcceptorNameLoc.length());
//			m.setValue(49, "840", IsoType.NUMERIC, 3);
////			String adviceReasonCode = "03137392000000000100000000001000000553002";
//			String adviceReasonCode = "00330000440120426130332f32322031353a30303a3030203132303038042620000020461122483012053016612240000000000";
//			m.setValue(60, adviceReasonCode, IsoType.LLLVAR, 999);
////			String posData = "0154190000000000000074212345012430551550000003441";
//			String posData = "015419966356000001";
//			m.setValue(61, posData, IsoType.LLLVAR, 200);
			
			
//				MessageFactory mfactRes = ConfigParser.createFromClasspathConfig("j8583/config.xml");
//				String line = new String(dataOutput);
//				line = line.substring(4,line.length());
//				System.out.println("line::"+line);
//				IsoMessage response = mfactRes.parseMessage(line.getBytes(), 0);
//					System.out.println(response.debugString());
//					System.out.println(response.getIsoHeader());
//					System.out.println(response.getField(0));
//					System.out.println(response.getField(1));
//					System.out.println(response.getField(2));
//					System.out.println(response.getField(3));
//					System.out.println(response.getField(4));
//					System.out.println(response.getField(7));
//					System.out.println(response.getField(11));
//					System.out.println(response.getField(12));
//					System.out.println(response.getField(13));
//					System.out.println(response.getField(15));
//					System.out.println(response.getField(18));
//					System.out.println(response.getField(19));
//					System.out.println(response.getField(32));
//					System.out.println(response.getField(37));
//					System.out.println(response.getField(38));
//				System.out.println("Response Code::"+response.getField(39));
//					System.out.println(response.getField(49));
//					System.out.println(response.getField(60));
//					System.out.println(response.getField(62));
			
			model.addAttribute("reqMsg", m.debugString());
			model.addAttribute("infoMessage", "<div id='success' class='alert alert-success'>Request Sent</div>");
				
//			cs.closeStreams();
//			cs.disconnect();
			
			Date end = new Date();
			System.out.println("End edcsimreq0100  ::"+end);
			System.out.println("Trans "+systemTraceNumber+"::"+(end.getTime()-start.getTime())+" ms");
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView("/edc/edc0100sim", "form", form);
	}
	
	@RequestMapping(value = "edcsimreq0200")
	public ModelAndView edcsimreq0200(@ModelAttribute("form") Edc8583Form form, BindingResult result,  ModelMap model) {
		Date start = new Date();
		System.out.println("Load edcsimreq0200");
		try{
			MessageFactory mfact = new MessageFactory<>();
			IsoMessage m  = mfact.newMessage(0x200);
			
			String pan                     =form.getInput002();
			String procCode                =form.getInput003();
			String amtTransaction          =form.getInput004();
			String transDateTime           =form.getInput007();
			String systemTraceNumber       =form.getInput011();
			String localTransactionTime    =form.getInput012();
			String localTransactionDate    =form.getInput013();
			String cardExpiryDate          =form.getInput014();
			String merchantCategoryCode    =form.getInput018();
			String posEntryMode            =form.getInput022();
			String posPinCaptureCode       =form.getInput026();
			String amtTransFee             =form.getInput028();
			String binNumber               =form.getInput032();
			String fwdInstitutionIdCode    =form.getInput033();
			String track2Data              =form.getInput035();
			String retrievalRefNumber      =form.getInput037();
			String terminalId              =form.getInput041();
			String cardAcceptorIdCode      =form.getInput042();
			String cardAcceptorName        =form.getInput043();
			String transactionCurrencyCode =form.getInput049();
			String encPinBlock             =form.getInput052();
			String posData                 =form.getInput061();
			String privateData             =form.getInput127();
			
			System.out.println("encPinBlock::"+encPinBlock);
			
			m.setValue(2, pan, IsoType.ALPHA, pan.length());
			m.setValue(3, procCode, IsoType.NUMERIC, 6);
			m.setValue(4, amtTransaction, IsoType.NUMERIC, 12);
			m.setValue(7, transDateTime, IsoType.NUMERIC, 10);
			m.setValue(11, systemTraceNumber, IsoType.NUMERIC, 6);
			m.setValue(12, localTransactionTime, IsoType.NUMERIC, 6);
			m.setValue(13, localTransactionDate, IsoType.NUMERIC, 4);
			m.setValue(14, cardExpiryDate, IsoType.NUMERIC, 4);
			m.setValue(18, merchantCategoryCode, IsoType.NUMERIC, 4);
			m.setValue(22, posEntryMode, IsoType.NUMERIC, 3);
			m.setValue(26, posPinCaptureCode, IsoType.NUMERIC, 2);
			m.setValue(28, amtTransFee, IsoType.ALPHA, 9);
			m.setValue(32, binNumber, IsoType.ALPHA, binNumber.length());
			m.setValue(33, fwdInstitutionIdCode, IsoType.ALPHA, fwdInstitutionIdCode.length());
			m.setValue(35, track2Data, IsoType.ALPHA, track2Data.length());
			m.setValue(37, retrievalRefNumber, IsoType.ALPHA, retrievalRefNumber.length());
			m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
			m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
			m.setValue(43, cardAcceptorName, IsoType.ALPHA, cardAcceptorName.length());
			m.setValue(49, transactionCurrencyCode, IsoType.NUMERIC, 3);
	//		encPinBlock = "0xdc, 0x90, 0xe1, 0x34, 0x8b, 0xc2, 0x5a, 0xfa";
			m.setValue(52, encPinBlock, IsoType.ALPHA, encPinBlock.length());
			m.setValue(61, posData, IsoType.ALPHA, posData.length());
			m.setValue(127, privateData, IsoType.ALPHA, privateData.length());
			
	//		String pan = "521211123456785";
	//		m.setValue(2, pan, IsoType.ALPHA, pan.length());
	//		m.setValue(3, "010000", IsoType.NUMERIC, 6);
	//		m.setValue(4, "000000001000", IsoType.NUMERIC, 12);
	//		m.setValue(7, "0309000000", IsoType.NUMERIC, 10);
	//		m.setValue(11, "000001", IsoType.NUMERIC, 6);
	//		m.setValue(12, "090000", IsoType.NUMERIC, 6);
	//		m.setValue(13, "0310", IsoType.NUMERIC, 4);
	//		m.setValue(14, "3012", IsoType.NUMERIC, 4);
	//		m.setValue(18, "6011", IsoType.NUMERIC, 4);
	//		m.setValue(22, "901", IsoType.NUMERIC, 3);
	//		m.setValue(26, "12", IsoType.NUMERIC, 2);
	//		m.setValue(28, "D00000000", IsoType.ALPHA, 9);
	//		String binNumber = "939218895";
	//		m.setValue(32, binNumber, IsoType.ALPHA, binNumber.length());
	//		String fwdIdCode = "9000001889";
	//		m.setValue(33, fwdIdCode, IsoType.ALPHA, fwdIdCode.length());
	//		String track2 = "521211123456785=30121210012300000\n";
	//		m.setValue(35, track2, IsoType.ALPHA, track2.length());
	//		String retrievalRefNum = "090000000001";
	//		m.setValue(37, retrievalRefNum, IsoType.ALPHA, retrievalRefNum.length());
	//		String terminalId = "99999999";
	//		m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
	//		String cardAcceptorIdCode = "Mer strees test";
	//		m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
	//		String cardAcceptorNameLoc = "ATM TERMINAL-LOADTEST    TOKYO       JPN";
	//		m.setValue(43, cardAcceptorNameLoc, IsoType.ALPHA, cardAcceptorNameLoc.length());
	//		m.setValue(49, "392", IsoType.NUMERIC, 3);
	//		String encPINBlock = "0xdc, 0x90, 0xe1, 0x34, 0x8b, 0xc2, 0x5a, 0xfa";
	//		m.setValue(52, encPINBlock, IsoType.ALPHA, encPINBlock.length());
	//		String posData = "00000100002013929999999999";
	//		m.setValue(61, posData, IsoType.ALPHA, posData.length());
	//		String privateData = "139200000012345100000000123555555559995512345678ABCDE";
	//		m.setValue(127, privateData, IsoType.ALPHA, privateData.length());
			
			System.out.println(m.debugString().length());
			System.out.println(m.debugString());
			
			Date end = new Date();
			System.out.println("End edcsimreq0200  ::"+end);
			System.out.println("Trans "+systemTraceNumber+"::"+(end.getTime()-start.getTime())+" ms");
			
			model.addAttribute("reqMsg", m.debugString());
			model.addAttribute("infoMessage", "<div id='success' class='alert alert-success'>Request Sent</div>");
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return new ModelAndView("/edc/edc0200sim", "form", form);
	}

}
