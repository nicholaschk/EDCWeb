package com.sdm.edc.util;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String inHex = "92";
			int num = Integer.parseInt(inHex, 16);
			System.out.println(num);
			System.out.println((char)num);
			String hex = String.format("%02X", (int)'?');
			System.out.println(hex);
			int result = Integer.parseInt(hex, 16 );
			System.out.println(result);
			
			byte[] b = new byte[inHex.length() / 2];
		    for (int i = 0; i < b.length; i++) {
		      int index = i * 2;
		      int v = Integer.parseInt(inHex.substring(index, index + 2), 16);
		      System.out.println(v);
		      b[i] = (byte) v;
		      int t = (int)b[i];
		      System.out.println(t);
		    }
		    System.out.println(new String(b));
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
