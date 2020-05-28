package evcar.socket;

import java.io.IOException;
import java.net.Socket;

public class SocketClient {

	public static void main(String[] args) {
		try {
			Socket c_socket = new Socket("192.168.62.56",5300);
					
			SocketClientReceiveThread rec_thread = new SocketClientReceiveThread();
			rec_thread.setSocket(c_socket);
			
			SocketClientSendThread send_thread = new SocketClientSendThread();
			send_thread.setSocket(c_socket);
			
			send_thread.start();
			rec_thread.start();
			
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

}
