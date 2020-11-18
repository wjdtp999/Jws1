package mytag;

import java.util.ArrayList;

import com.notice.notice;
import com.notice.notice_dao;

public class tag {

	public ArrayList<notice> notice_list(){
		notice_dao nd = new notice_dao();
		return nd.all_data();
	}
}
