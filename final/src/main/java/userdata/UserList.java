package userdata;

import java.util.ArrayList;

public class UserList {
	int length;
	ArrayList<Users> userlist = new ArrayList<Users>();
	
	public void setUserlist(Users x) {
		userlist.add(x);
	}
	public Users getUserlist(int k) {
		return userlist.get(k);
	}
	public int getLength() {
		return userlist.size();
	}
}