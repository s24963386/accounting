package sumslack.app.dataset;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sumscope.tag.ioc.dataset.AbsDataSetExec;

public class TestDataset extends AbsDataSetExec{

	public Map<String,Object> run() {
		Map<String,Object> ret = new HashMap<String,Object>();
		String sql = "select * from base_app";
		List list = dateset.queryForList(sql);
		ret.put("users", list);
		//要导出的结果集固定命名为exp
		ret.put("exp", list);
		return ret;		
	}
}