package presence.beanclass;

public class presence {
private String displayName;
private String publicIdentity;
private String privateIdentity;
private String password;
private String WSUri;
private String realm;
private String presence;

public String getDisplayName() {
	return displayName;
}
public void setDisplayName(String displayName) {
	this.displayName = displayName;
}
public String getPublicIdentity() {
	return publicIdentity;
}
public void setPublicIdentity(String publicIdentity) {
	this.publicIdentity = publicIdentity;
}
public String getPrivateIdentity() {
	return privateIdentity;
}
public void setPrivateIdentity(String privateIdentity) {
	this.privateIdentity = privateIdentity;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getWSUri() {
	return WSUri;
}
public void setWSUri(String wSUri) {
	WSUri = wSUri;
}
public String getRealm() {
	return realm;
}
public void setRealm(String realm) {
	this.realm = realm;
}
public String getPresence() {
	return presence;
}
public void setPresence(String presence) {
	this.presence = presence;
}

}
