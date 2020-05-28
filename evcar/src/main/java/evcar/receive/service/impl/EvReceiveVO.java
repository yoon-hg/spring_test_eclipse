package evcar.receive.service.impl;

public class EvReceiveVO {

	
	private int resMsg_length = 0;
	private String[] resMsg;
	private String[] recvMsg;
	
	public String[] getResMsg() {
		return resMsg;
	}
	public void setResMsg(String[] resMsg) {
		this.resMsg = resMsg;
	}
	public String[] getRecvMsg() {
		return recvMsg;
	}
	public void setRecvMsg(String[] recvMsg) {
		this.recvMsg = recvMsg;
	}
	
}
