import java.util.*;
public class DataStructures{
	public static void main(String[] args){
		Hashtable<String, String> monster = new Hashtable<String, String>();
		monster.put("name", "monster");
		monster.put("eyes", "1");
		monster.put("sound", "quack");
		monster.put("eats", "humans");
		monster.put("friendly", "false");
		System.out.println(monster.get("name"));
	}
}
