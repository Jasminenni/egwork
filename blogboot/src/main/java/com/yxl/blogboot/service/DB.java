package com.yxl.blogboot.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yxl.blogboot.mapper.MyCodeMapper;
import com.yxl.blogboot.mapper.MyDataMapper;
import com.yxl.blogboot.model.Code;
import com.yxl.blogboot.model.Cont;
import com.yxl.blogboot.model.Csdn;

@Repository
public class DB
{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List getData()
	{
		System.out.println("DBDao  getStuData  start .....");
		
		String sql="SELECT * FROM t_csdn";
		//System.out.println("jdbcTemplate======>"+this.jdbcTemplate);
		
		List<Csdn> lists=this.jdbcTemplate.query(sql, new MyRowMapper());
		
		//this.jdbcTemplate.query(sql, new Object[]{"lixin","123"}, new MyRowMapper());
		
		return lists;
	}
	
	public long checkName(String name,String pwd)
	{
		String sql="select count(*) as cn from t_user where uname=?";
		
		Long  i=0L;
		
		List<Map<String,Object>>  lists=this.jdbcTemplate.queryForList(sql, new Object[]{name});
	
		for(Map<String,Object>  maps:lists)
		{
			i= (Long) maps.get("cn");
			
		}
		
		//System.out.println("i--->"+i);
		
		return  i;
	
	}
	
	//注册
	public int addUser(String name,String pwd)
	{
		String sql="INSERT INTO t_user(uname,upwd,ufan,uatten,ulike,uimg) "
				+ "VALUES(?,?,0,0,0,'images/default.png')";
		int res=this.jdbcTemplate.update(sql, new Object[]{name,pwd});
		
		System.out.println("注册成功之后返回的数据"+res);
		return res;
	}
	//生成随机验证码
	public String leaveCodeRandom()
	{
		String str = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
		String str2[] = str.split(",");//将字符串以,分割
		Random rand = new Random();//创建Random类的对象rand
		int index = 0;
		String randStr = "";//创建内容为空字符串对象randStr
		for (int i=0; i<4; ++i){
			index = rand.nextInt(str2.length-1);//在0到str2.length-1生成一个伪随机数赋值给index
			randStr += str2[index];//将对应索引的数组与randStr的变量值相连接
		}
		System.out.println(randStr);
		return randStr;
		
	}
	
	//向留言板数据库添加数据
	public int addCode(String name,String email,String trea)
	{
		String sql="INSERT INTO t_code(cname,cemail,ctext)VALUES(?,?,?)";
		int result=this.jdbcTemplate.update(sql, new Object[]{name,email,trea});
		System.out.println("留言信息插入成功后返回结果："+result);
		return result;
	}
	
	//留言页面加载数据
	public List queryCode()
	{
		String sql="SELECT * FROM t_code";
		
		List<Code> lists=this.jdbcTemplate.query(sql, new MyCodeMapper());
//		List lists=this.jdbcTemplate.queryForList(sql);
//		Iterator it =lists.iterator();
//		while(it.hasNext())
//		{
//			Map c = (Map) it.next();
//			lists.add(c.get("cname"));
//			lists.add(c.get("cemail"));
//			lists.add(c.get("ctext"));
//			
//		}
		return lists;
	}
	
	//页面加载数据
	public List ConData(int id)
	{
		String sql="select * from t_user where uid=?";
		
		
		List<Cont> lists=this.jdbcTemplate.query(sql, new MyDataMapper());
		return lists;
	}
	
//	public static void main(String[] args)
//	{
//		DB db =new DB();
////		db.getData();
//		db.leaveCodeRandom();
//	}
}
//,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z