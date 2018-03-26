package com.sdm.edc.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import org.apache.commons.lang3.StringUtils;

import com.solab.iso8583.IsoMessage;
import com.solab.iso8583.IsoType;
import com.solab.iso8583.MessageFactory;

public class TestEDC {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
//			ClientServer cs = new ClientServer("10.30.100.235", 8211);
//			cs.connect();
			MessageFactory mfact = new MessageFactory<>();
			IsoMessage m  = mfact.newMessage(0x200);
			//Header length 20
//			m.setBinary(true);
//			String pan = "5413330002001510";
			String pan = "521211123456785";
			m.setValue(2, pan, IsoType.LLVAR,19);
			m.setValue(3, "010000", IsoType.NUMERIC, 6);
//			m.setValue(4, "000000001000", IsoType.NUMERIC, 12);
			m.setValue(7, "0407051700", IsoType.NUMERIC, 10);
			m.setValue(11, "000038", IsoType.NUMERIC, 6);
			m.setValue(12, "141700", IsoType.NUMERIC, 6);
			m.setValue(13, "0407", IsoType.NUMERIC, 4);
			m.setValue(14, "1912", IsoType.NUMERIC, 4);
			m.setValue(18, "6011", IsoType.NUMERIC, 4);
			m.setValue(22, "901", IsoType.NUMERIC, 3);
//			m.setValue(23, "901", IsoType.NUMERIC, 3); null
			m.setValue(26, "04", IsoType.NUMERIC, 2);
			m.setValue(28, "D00000000", IsoType.ALPHA, 9);
			String binNumber = "939218895";
			m.setValue(32, binNumber, IsoType.LLVAR, 11);
			String fwdIdCode = "9000001889";
			m.setValue(33, fwdIdCode, IsoType.LLVAR, 11);
			String track2 = "521211123456785=19121210012300000";
			m.setValue(35, track2, IsoType.LLVAR, 37);
			String retrievalRefNum = "409806000036";
			m.setValue(37, retrievalRefNum, IsoType.ALPHA, retrievalRefNum.length());
			String terminalId = "ATMK003";
			m.setValue(41, terminalId, IsoType.ALPHA, terminalId.length());
			String cardAcceptorIdCode = "000005000000020";
			m.setValue(42, cardAcceptorIdCode, IsoType.ALPHA, cardAcceptorIdCode.length());
			String cardAcceptorNameLoc = "NTTDATA - ATM TERMINAL   TOKYO     JPN";
			m.setValue(43, cardAcceptorNameLoc, IsoType.ALPHA, cardAcceptorNameLoc.length());
			m.setValue(49, "392", IsoType.NUMERIC, 3);
//			String encPINBlock = "0xdc, 0x90, 0xe1, 0x34, 0x8b, 0xc2, 0x5a, 0xfa";
			byte[] encPINBlock = new byte[]{(byte)0xdc,(byte)0x90,(byte) 0xe1, (byte)0x34, (byte)0x8b, (byte)0xc2, (byte)0x5a,(byte) 0xfa};
//			String encPINBlock = "dc90e1348bc25afa".toUpperCase();
			m.setValue(52, encPINBlock, IsoType.BINARY,8);
			m.setValue(55, "392", IsoType.NUMERIC, 3); 
			String posData = "00000100002013929999999999";
			m.setValue(61, posData, IsoType.LLLVAR, 200);
			String privateData = "139200002000000216000020000999999990000100000000ABCDE";
			m.setValue(127, privateData, IsoType.LLLVAR, 50);
			
			System.out.println(m.debugString().length());
			System.out.println(m.debugString());
			
			System.out.println(m.getField(52).getLength());
			System.out.println(m.getField(52).getType());
			System.out.println(m.getField(52));
			
//			String output = "0xdc".replace("0x", "");
//			int decimal = Integer.parseInt(output,16);
//			System.out.println((char)decimal+"");
			
//			String next = new String(encPINBlock);
//			System.out.println(next);
			
//			String length = StringUtils.leftPad(m.writeData().length+"",4,"0");
//			byte[] len = length.getBytes();
//			byte[] i8583 = m.writeData();
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			baos.write(len, 0, len.length);
//			baos.write(i8583, 0, i8583.length);
//			System.out.println(len.length);
//			System.out.println(i8583.length);
//			byte[] finalMsg = baos.toByteArray();
//			System.out.println(finalMsg.length);
//			cs.getDout().write(finalMsg);
			
//			String length = StringUtils.leftPad(m.debugString().length()+"",4,"0");
//			String data = m.debugString();
//			data = length + data;
//			cs.sendMessage(data);
			
//			System.out.println("moving on");
//			InputStream input = cs.getInput();
//			byte[] dataOutput = new byte[7500];
//			int readStat = input.read(dataOutput);
//			System.out.println("readStat:"+readStat);
//			System.out.println("output  :["+new String(dataOutput)+"]");
			
//			System.out.println(cs.getSoc().isConnected());
//			System.out.println(cs.getSoc().isInputShutdown());
//			System.out.println(cs.getSoc().isOutputShutdown());
//			cs.getInput().close();
//			System.out.println(cs.getSoc().isInputShutdown());
			
//			char ch = 'Ü';
//			String hex = String.format("0x%01x", (int)ch);
//			System.out.println(hex);
//			
//			String inHex = hex.replace("0x", "");
//			inHex = "dc";
//			int num = Integer.parseInt(inHex, 16);
//			System.out.println(num);
//			System.out.println((char)num);
			
			String input = "dc90e1348bc25afa";
			for(int i = 0; i<input.length(); i=i+2){
				String in = input.substring(i,i+2);
				System.out.println(in);
				int number = Integer.parseInt(in, 16);
				System.out.println(number);
				System.out.println((char)number);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
