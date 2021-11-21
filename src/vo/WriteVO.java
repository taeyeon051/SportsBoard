package vo;

public class WriteVO {
	private int wCode;
	private String wType;
	private String title;
	private String content;
	private String teamList;
	private String playerList;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
}
