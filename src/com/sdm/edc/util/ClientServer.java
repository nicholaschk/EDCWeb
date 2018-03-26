package com.sdm.edc.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.Calendar;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import com.solab.iso8583.IsoMessage;
import com.solab.iso8583.MessageFactory;
import com.solab.iso8583.parse.ConfigParser;

public class ClientServer {
	
	private BlockingQueue<String> queueIn = new LinkedBlockingQueue<String>();
	private BlockingQueue<String> queueOut = new LinkedBlockingQueue<String>();

	private String serverIP = "";
	private int servPort = 0;

	private Socket soc = null;
	private DataOutputStream dout = null;
	private InputStream input = null;
	
	public ClientServer(String serverIP, int servPort) {
		this.serverIP = serverIP;
		this.servPort = servPort;
	}
	
	public void connect(){
		try {
			System.out.println("Connecting to "+serverIP+":"+servPort);
			this.soc = new Socket(serverIP, servPort);
			this.dout = new DataOutputStream(soc.getOutputStream());
			this.input = soc.getInputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sendMessage(String isoMessage){
		try {
			System.out.println("Checking socket connection:"+this.soc.isConnected());
			if(!this.soc.isConnected()){
				System.out.println("Socket connection closed. Re-connecting....");
				connect();
			}
			System.out.println("SENDING::["+isoMessage+"]");
			dout.write(isoMessage.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sendMessageAsBytes(byte[] isoMessage){
		try {
			System.out.println("Checking socket connection:"+this.soc.isConnected());
			if(!this.soc.isConnected()){
				System.out.println("Socket connection closed. Re-connecting....");
				connect();
			}
			System.out.println("SENDING::["+new String(isoMessage)+"]");
			dout.write(isoMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public IsoMessage getResponse(){
		IsoMessage m = null;
		try {
			MessageFactory mfact = ConfigParser.createFromClasspathConfig("j8583/config.xml");
			BufferedReader  reader = new BufferedReader (new InputStreamReader(input));
			String line = reader.readLine();
			boolean loop = true;
			long start = Calendar.getInstance().getTimeInMillis();
			while (loop) {
				long now = Calendar.getInstance().getTimeInMillis();
				if((now - start) >= 30000){
					loop = false;
				}
				if(line == null || line.length() == 0){
					Thread.sleep(500);
				}else{
					m = mfact.parseMessage(line.getBytes(), 0);
					loop = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	public void closeStreams(){
		try{
			this.input.close();
			this.dout.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		try{
			this.soc.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public BlockingQueue<String> getQueueIn() {
		return queueIn;
	}

	public void setQueueIn(BlockingQueue<String> queueIn) {
		this.queueIn = queueIn;
	}

	public BlockingQueue<String> getQueueOut() {
		return queueOut;
	}

	public void setQueueOut(BlockingQueue<String> queueOut) {
		this.queueOut = queueOut;
	}

	public String getServerIP() {
		return serverIP;
	}

	public void setServerIP(String serverIP) {
		this.serverIP = serverIP;
	}

	public int getServPort() {
		return servPort;
	}

	public void setServPort(int servPort) {
		this.servPort = servPort;
	}

	public Socket getSoc() {
		return soc;
	}

	public void setSoc(Socket soc) {
		this.soc = soc;
	}

	public DataOutputStream getDout() {
		return dout;
	}

	public void setDout(DataOutputStream dout) {
		this.dout = dout;
	}

	public InputStream getInput() {
		return input;
	}

	public void setInput(InputStream input) {
		this.input = input;
	}
}
