package vo;

public class BoardVO {
	private int wCode;
	private String wType;
	private String wDate;
	private String title;
	private String writerId;
	private String writerName;
	private String content;
	private String teamList;
	private String playerList;
	private int views;

	public int getwCode() {
		return wCode;
	}

	public void setwCode(int wCode) {
		this.wCode = wCode;
	}

	public String getwType() {
		return wType;
	}

	public void setwType(String wType) {
		this.wType = wType;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTeamList() {
		return teamList;
	}

	public void setTeamList(String teamList) {
		this.teamList = teamList;
	}

	public String getPlayerList() {
		return playerList;
	}

	public void setPlayerList(String playerList) {
		this.playerList = playerList;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
}
