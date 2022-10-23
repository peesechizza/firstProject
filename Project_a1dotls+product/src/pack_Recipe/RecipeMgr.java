package pack_Recipe;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;

public class RecipeMgr {

	private Connection objConn = null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private DBConnectionMgr objPool = null;

	private static final String SAVEFOLER = "/Users/maaam/Desktop/Project_a1dotls/WebContent/recipe/recipeImg";
	private static String encType = "UTF-8";
	private static int maxSize = 50 * 1024 * 1024;

	public RecipeMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}

	}

	// 총 게시물 수
	public int getTotalCount(String keyField, String keyWord) {

		String sql = null;
		int totalCnt = 0;

		try {
			objConn = objPool.getConnection();

			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(*) from Recipe";
				objPstmt = objConn.prepareStatement(sql);
			} else {
				sql = "select count(*) from Recipe ";
				sql += "where " + keyField + " like ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%" + keyWord + "%");
			}

			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				totalCnt = objRS.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("SQL이슈 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return totalCnt;
	}

	// 레시피 출력
	public Vector<RecipeBean> getRecipeList(String keyField, String keyWord, int start, int end) {

		Vector<RecipeBean> objList = new Vector<>();
		String sql = null;

		try {
			objConn = objPool.getConnection();

			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from Recipe " + "order by rRef desc, rPos asc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);
			} else {
				sql = "select * from Recipe " + "where " + keyField + " like ? "
						+ "order by rRef desc, rPos asc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%" + keyWord + "%");
				objPstmt.setInt(2, start);
				objPstmt.setInt(3, end);
			}

			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				RecipeBean rBean = new RecipeBean();
				rBean.setrNum(objRS.getInt("rNum"));
//				rBean.setuId(objRS.getString("uId"));
				rBean.setrDivi(objRS.getString("rDivi"));
				rBean.setrTitle(objRS.getString("rTitle"));
//				rBean.setrContent(objRS.getString("rContent"));
//				rBean.setrViewNum(objRS.getInt("rViewNum"));
//				rBean.setrUploadTM(objRS.getString("rUploadTM"));
				rBean.setrRef(objRS.getInt("rRef"));
				rBean.setrPos(objRS.getInt("rPos"));
//				rBean.setrDepth(objRS.getInt("rDepth"));
//				rBean.setrOrigFile(objRS.getString("rOrigFile"));
				rBean.setrFileName(objRS.getString("rFileName"));
//				rBean.setrFileSize(objRS.getInt("rFileSize"));
				objList.add(rBean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return objList;
	}

	// 레시피 등록
	public void insertRecipe(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;
		int rFileSize = 0;
		String rFileName = null;

		try {
			objConn = objPool.getConnection();
			sql = "select max(rNum) from Recipe";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			int rRef = 1;
			if (objRS.next())
				rRef = objRS.getInt(1) + 1;

			File file = new File(SAVEFOLER);

			if (!file.exists())
				file.mkdirs();

			multi = new MultipartRequest(req, SAVEFOLER, maxSize, encType, new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("rFileName") != null) {
				rFileName = multi.getFilesystemName("rFileName");
				rFileSize = (int) multi.getFile("rFileName").length();
			}
			String rContent = multi.getParameter("rContent");

			if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
				rContent = UtilMgr.replace(rContent, "<", "&lt;");
			}

			sql = "insert into Recipe (";
			sql += "uId, rTitle, rDivi, rContent, rRef, rPos, rDepth, ";
			sql += "rUploadTM, rViewNum, rFileName, rFileSize) values (";
			sql += "?, ?, ?, ?, ?, 0, 0, now(), 0, ?, ?)";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, multi.getParameter("uId"));
			objPstmt.setString(2, multi.getParameter("rTitle"));
			objPstmt.setString(3, multi.getParameter("rDivi"));
			objPstmt.setString(4, rContent);
			objPstmt.setInt(5, rRef);
			objPstmt.setString(6, rFileName);
			objPstmt.setInt(7, rFileSize);
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

	}

}
