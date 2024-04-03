package dao;

public class noticeObj {
		private String id, atitle, ts;
		public noticeObj(String id, String atitle, String ts) {
		this.id = id;
		this.atitle = atitle;
		this.ts = ts;
		}
		public String getId() { return this.id; }
		public String getAtitle() { return this.atitle; }
		public String getTs() { return this.ts; }
}
