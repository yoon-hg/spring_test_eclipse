package evcar.socket;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.Socket;

public class SocketClientReceiveThread extends Thread{
	private Socket m_Socket;
	
	@Override
	public void run() {
		super.run();
		
		try {
			DataInputStream dis = new DataInputStream(m_Socket.getInputStream());
			
			
			
			while(true) {
				byte[] 	rbuff = new byte[1024];
				int rbuff_cnt = dis.read(rbuff);
				
				receiveData(rbuff,rbuff_cnt);
			}
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void receiveData(byte buf[], int rbuff_cnt) throws Exception{

		String ifData ="";
		
		for(int i=0; i<rbuff_cnt; i++) {
			ifData += (char)buf[i];
		}
		System.out.println("수신 데이터 : "+ifData);
		
		
	}
	
	public void setSocket(Socket socket) {
		m_Socket = socket;
	}
}
