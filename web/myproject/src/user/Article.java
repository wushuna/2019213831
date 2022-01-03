package user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.ObjDoubleConsumer;


public class Article {
	private int id; //文本id
	private String title; //标题
	private String username;  //用户名
	private String content; //文本内容
	private int count; //点赞数
	private String category;


public Article(){
}

public Article(int id, String title, String username, String content, int count, String category) {
	this.id = id;
	this.username = username;
	this.content = content;
	this.title = title;
	this.count = count;
	this.category = category;
}

public Article(Map<String, Object> map)  {
	this.id = (int) map.get("id");
	this.title = (String) map.get("title");
	this.username = (String) map.get(username);
	this.content = (String) map.get("content");
	this.count = (int) map.get(count);
	this.category = (String) map.get(category);
}

public int getID(){
	return id;
}

public void setId(int id) {
    this.id = id;
}

public String getTitle() {
    return title;
}

public void setTitle(String title) {
    this.title = title;
}

public String getusername() {
	return username;
}

public void setusername(String username) {
	this.username = username;
}

public String get_content() {
    return content;
}

public void set_content(String content) {
    this.content = content;
}

public int get_count() {
    return count;
}

public void set_count(int count) {
    this.count = count;
}

public String get_category() {
	return category;
}

public void set_category(String category) {
	this.category = category;
}

@Override
public String toString() {
	return this.username + " "+ this.title +" "+ this.content ;
	
}



}
