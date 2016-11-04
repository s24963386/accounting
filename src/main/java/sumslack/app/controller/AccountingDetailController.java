package sumslack.app.controller;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.sumscope.tag.rest.annotation.URIAlias;
import com.sumscope.tag.rest.servlet.BaseController;
import com.sumscope.tag.sql.TagJDBCInstance;
import com.sumscope.tag.util.StrUtil;
import com.sumscope.tag.util.db.ITx;

@URIAlias("detail")
public class AccountingDetailController extends BaseController {
	
	final static String insert_sql="insert into accounting_detail(id,purpose,cost,cost_time,account_id,create_user,account_book_id,type) values (?,?,?,?,?,?,?,?)"; 
	
	final static String update_account_income="update account set income = income+? ,balance = balance+? where id = ?"; 
	
	final static String update_account_outcome="update account set outcome = outcome+? ,balance = balance-? where id = ?"; 
	
	final static String update_book_income="update account_book set income = income+? ,balance = balance+? where id = ?"; 
	
	final static String update_book_outcome="update account_book set outcome = outcome+? ,balance = balance-?  where id = ?"; 
	@URIAlias("insert")
	public Map insert(){
		Map re = new HashMap();
		final String type = request.getParameter("type");
		final String purpose = request.getParameter("purpose");
		final String cost = request.getParameter("cost");
		final String cost_time = request.getParameter("cost_time");
		final String account_id = request.getParameter("account_id");
		final String account_book_id = request.getParameter("account_book_id");
		final String create_user = request.getParameter("create_user");
		boolean res = TagJDBCInstance.getInstance().tx(new ITx() {
			public boolean run(Connection conn) throws SQLException {
				String id = StrUtil.uuid();
				try {
					TagJDBCInstance.getInstance().update(conn, insert_sql, new Object[]{id,purpose,cost,cost_time,account_id,create_user,account_book_id,type});
					if("0".equals(type)){
						TagJDBCInstance.getInstance().update(conn, update_account_outcome, new Object[]{Integer.valueOf(cost),Integer.valueOf(cost),account_id});
						TagJDBCInstance.getInstance().update(conn, update_book_outcome, new Object[]{Integer.valueOf(cost),Integer.valueOf(cost),account_book_id});
					}else{
						TagJDBCInstance.getInstance().update(conn, update_account_income, new Object[]{Integer.valueOf(cost),Integer.valueOf(cost),account_id});
						TagJDBCInstance.getInstance().update(conn, update_book_income, new Object[]{Integer.valueOf(cost),Integer.valueOf(cost),account_book_id});
					}
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
				return true;
			}
		});
		re.put("res",res);
		return re;
	}
	
	final static String delete_account_income="update account set income = income-? ,balance = balance-? where id = ?"; 
	
	final static String delete_account_outcome="update account set outcome = outcome-? ,balance = balance+? where id = ?"; 
	
	final static String delete_book_income="update account_book set income = income-? ,balance = balance-? where id = ?"; 
	
	final static String delete_book_outcome="update account_book set outcome = outcome-? ,balance = balance+?  where id = ?"; 
	
	@URIAlias("delete")
	public Map delete(){
		Map re = new HashMap();
		final String id = request.getParameter("id");
		boolean res = TagJDBCInstance.getInstance().tx(new ITx() {
			public boolean run(Connection conn) throws SQLException {
				try {
					Map detail = TagJDBCInstance.getInstance().queryOne("select * from accounting_detail where id = ?",new Object[]{id});
					if(detail!=null){
						BigDecimal cost = (BigDecimal) detail.get("cost");
						String type = (String) detail.get("type");
						String account_id = (String) detail.get("account_id");
						String account_book_id = (String) detail.get("account_book_id");
						TagJDBCInstance.getInstance().update(conn, "delete from accounting_detail where id = ?", new Object[]{id});
						if("1".equals(type)){
							TagJDBCInstance.getInstance().update(conn, delete_account_income, new Object[]{cost,cost,account_id});
							TagJDBCInstance.getInstance().update(conn, delete_book_income, new Object[]{cost,cost,account_book_id});
						}else{
							TagJDBCInstance.getInstance().update(conn, delete_account_outcome, new Object[]{cost,cost,account_id});
							TagJDBCInstance.getInstance().update(conn, delete_book_outcome, new Object[]{cost,cost,account_book_id});
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
				return true;
			}
		});
		re.put("res",res);
		return re;
	}
}
