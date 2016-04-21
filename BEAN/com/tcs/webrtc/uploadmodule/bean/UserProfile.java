package com.tcs.webrtc.uploadmodule.bean;

public class UserProfile {

	private String name;
	private String audiofile;
	private String videofile;
	private String picfile;
	private byte [] favaudio;
	private byte [] favvideo;
	private byte [] profilepic;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAudiofile() {
		return audiofile;
	}
	public void setAudiofile(String audiofile) {
		this.audiofile = audiofile;
	}
	public String getVideofile() {
		return videofile;
	}
	public void setVideofile(String videofile) {
		this.videofile = videofile;
	}
	public String getPicfile() {
		return picfile;
	}
	public void setPicfile(String picfile) {
		this.picfile = picfile;
	}
	public byte[] getFavaudio() {
		return favaudio;
	}
	public void setFavaudio(byte[] favaudio) {
		this.favaudio = favaudio;
	}
	public byte[] getFavvideo() {
		return favvideo;
	}
	public void setFavvideo(byte[] favvideo) {
		this.favvideo = favvideo;
	}
	public byte[] getProfilepic() {
		return profilepic;
	}
	public void setProfilepic(byte[] profilepic) {
		this.profilepic = profilepic;
	}
	
	
}
