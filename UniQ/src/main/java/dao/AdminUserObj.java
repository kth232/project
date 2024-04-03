package dao;

public class AdminUserObj {
	private String name, univ, depart, id;
	private int point, ticket;
	public AdminUserObj(String id, String name, String univ, String depart, int point, int ticket) {
		this.id = id;
		this.name = name;
		this.univ = univ;
		this.depart = depart;
		this.point = point;
		this.ticket = ticket;
	}
	public String getId() { return this.id; }
	public String getName() { return this.name; }
	public String getUniv() { return this.univ; }
	public String getDepart() { return this.depart; }
	public int getPoint() { return this.point; }
	public int getTicket() { return this.ticket; }

}
