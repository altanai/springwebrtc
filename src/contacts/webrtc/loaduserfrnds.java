package contacts.webrtc;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
 
public class loaduserfrnds {
	
	public void FriendsWriteToFile(String user, String[] userfriends) {
		try {
 
			String content = "This is the content to write into file";
			String friends[]=new String[18];
			friends=userfriends;
			
			//File file = new File("/home/altanai/strutswkspace/userfriendsfile/"+user+".txt");
			File file = new File("/home/altanai/altanaiwkspace/userfriendsfile/"+user+".txt");
			
			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
 
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			
			for( int i=0;i<friends.length;i++)
			{
			//bw.write(content);
				bw.write(friends[i]+"\n");
			}
			
			bw.close();
 
			System.out.println(" Frirnds file updated for user : "+ user);
 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
