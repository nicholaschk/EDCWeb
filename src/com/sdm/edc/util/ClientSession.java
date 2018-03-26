package com.sdm.edc.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class ClientSession implements Runnable {

	private BlockingQueue<String> queueIn = new LinkedBlockingQueue<String>();
	private BlockingQueue<String> queueOut = new LinkedBlockingQueue<String>();

	private String serverIP = "";
	private int servPort = 0;

	DataOutputStream dout = null;
	InputStream input = null;

	public ClientSession(String serverIP, int servPort) {
		this.serverIP = serverIP;
		this.servPort = servPort;
	}

	@Override
	public void run() {
		try {
			Socket soc = new Socket(serverIP, servPort);
			dout = new DataOutputStream(soc.getOutputStream());
			input = soc.getInputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void putQueueIn(String packet) {
		boolean wait = true;
		try {
			while (wait) {
				if (!this.queueIn.isEmpty()) {
					queueIn.clear();
				}
				if (this.queueOut.isEmpty()) {
					wait = false;
				}
				Thread.sleep(100);
			}
			this.queueIn.offer(packet);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// convert InputStream to String
	private static String getStringFromInputStream(InputStream is) {

		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}
}
