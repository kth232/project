package dao;

public class JoinedObj {
	private String id;
	private int no, joinTime;
	public JoinedObj(String id, int no, int joinTime) {
		this.id = id;
		this.no = no;
		this.joinTime = joinTime;
	}
	public String getId() { return this.id; }
	public int getNo() { return this.no; }
	public int getJoinTime() { return this.joinTime; }
}
