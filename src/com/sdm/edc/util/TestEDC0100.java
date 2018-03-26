package com.sdm.edc.util;

import java.io.InputStream;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.solab.iso8583.IsoMessage;
import com.solab.iso8583.IsoType;
import com.solab.iso8583.MessageFactory;

public class TestEDC0100 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ClientServer cs = new ClientServer("10.30.100.235", 8211);
			cs.connect();
			MessageFactory mfact = new MessageFactory<>();
			IsoMessage m  = mfact.newMessage(0x100);
			System.out.println(new Date());
			String pan = "4119111374134828";
			m.setValue(2, pan, IsoType.LLVAR,19);
			m.setValue(3, "000000", IsoType.NUMERIC, 6);
			m.setValue(4, "000000004000", IsoType.NUMERIC, 12);
			m.setValue(7, "0407091505", IsoType.NUMERIC, 10);
			m.setValue(11, "930997", IsoType.NUMERIC, 6);
			m.setValue(12, "181505", IsoType.NUMERIC, 6);
			m.setValue(13, "0407", IsoType.NUMERIC, 4);
			m.setValue(14, "1912", IsoType.NUMERIC, 4);
			m.setValue(18, "5999", IsoType.NUMERIC, 4);
			m.setValue(19, "840", IsoType.NUMERIC, 3);
			m.setValue(22, "901", IsoType.NUMERIC, 3);
			m.setValue(25, "00", IsoType.NUMERIC, 2);
			String binNumber = "000050";
			m.setValue(32, binNumber, IsoType.LLVAR, 11);
			String track2 = "4119111374134828=19121210012300000";
			m.setValue(35, track2, IsoType.LLVAR, 37);
			String retrievalRefNum = "409806930992";
			m.setValue(37, retrievalRefNum, IsoType.ALPHA, retrievalRefNum.length());
			String terminalId = "22211111";
			m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
			String cardAcceptorIdCode = "000005000000001";
			m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
			String cardAcceptorNameLoc = "VANILLA AIR              TOKYO        US";
			m.setValue(43, cardAcceptorNameLoc, IsoType.ALPHA, cardAcceptorNameLoc.length());
			m.setValue(49, "840", IsoType.NUMERIC, 3);
//			String adviceReasonCode = "03137392000000000100000000001000000553002";
			String adviceReasonCode = "00330000440120426130332f32322031353a30303a3030203132303038042620000020461122483012053016612240000000000";
			m.setValue(60, adviceReasonCode, IsoType.LLLVAR, 999);
//			String posData = "0154190000000000000074212345012430551550000003441";
			String posData = "015419966356000001";
			m.setValue(61, posData, IsoType.LLLVAR, 200);
			
			System.out.println(m.debugString().length());
			System.out.println(m.debugString());
			
			String length = StringUtils.leftPad(m.debugString().length()+"",4,"0");
			String data = m.debugString();
			data = length + data;
			cs.sendMessage(data);
			
			System.out.println("moving on");
			InputStream input = cs.getInput();
			byte[] dataOutput = new byte[7500];
			int readStat = input.read(dataOutput);
			System.out.println("readStat:"+readStat);
			System.out.println("output  :["+new String(dataOutput)+"]");
			System.out.println(new Date());
//			System.out.println(cs.getSoc().isConnected());
//			System.out.println(cs.getSoc().isInputShutdown());
//			System.out.println(cs.getSoc().isOutputShutdown());
//			cs.getInput().close();
//			System.out.println(cs.getSoc().isInputShutdown());
			
//			char ch = '9';
//			String hex = String.format("0x%01x", (int)ch);
//			System.out.println(hex);
//			
//			String inHex = hex.replace("0x", "");
//			inHex = "dc";
//			int num = Integer.parseInt(inHex, 16);
//			System.out.println(num);
//			System.out.println((char)num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
