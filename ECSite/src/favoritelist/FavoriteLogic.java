package favoritelist;

import java.util.ArrayList;

import bean.FavoriteBean;
import jdbc.FavoriteJdbc;

public class FavoriteLogic {


	public ArrayList<FavoriteBean> favoriteGetLogic(int loginUserNo) {
		ArrayList<FavoriteBean> returnlist = new ArrayList<FavoriteBean>();

		FavoriteJdbc faveJdbc = new FavoriteJdbc();
		returnlist = faveJdbc.getFaves(loginUserNo);

		return returnlist;
	}

}
