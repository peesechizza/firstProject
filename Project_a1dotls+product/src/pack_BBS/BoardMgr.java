package pack_BBS;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;

public class BoardMgr {

	private DBConnectionMgr objPool;
	
	Connection 			objConn 		= 		null;
	PreparedStatement 	objPstmt 		= 		null;
	Statement			objStmt 		= 		null;
	ResultSet 			objRS 			= 		null;

	public BoardMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}

	}
	

	/*  FAQ 게시판 리스트 출력 (/bbsFaq/faqList.jsp) 시작    */
	public Vector<BoardBean> getBoardList(int start, int end) {

		Vector<BoardBean> vList = new Vector<>();
		String sql = null;

		try {
			objConn = objPool.getConnection();

				sql = "select fNum, fTitle from Faq order by fNum desc limit ?, ?;";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);							
			
			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				BoardBean bean = new BoardBean();
				bean.setfNum(objRS.getInt("fNum"));
				bean.setfTitle(objRS.getString("fTitle"));
				vList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}

	
	/* FAQ 게시판 총 게시물 수 (/bbsFaq/faqList.jsp) 시작  */
	public int getTotalCount() {

		String sql = null;
		int totalCnt = 0;

		try {
			objConn = objPool.getConnection();
			

			sql = "select count(*) from Faq order by fNum desc;";
			objPstmt = objConn.prepareStatement(sql);

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

	
	/*  게시판 입력(/bbsFaq/faqWriteProc.jsp) 시작  */
	public void insertBoard(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;

		try {
			objConn = objPool.getConnection();
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			sql = "insert into Faq (fNum, fTitle, fContent) ";
			sql += "values (?, ?);";

			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, multi.getParameter("fTitle"));
			objPstmt.setString(2, multi.getParameter("fContent"));
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

	}
	/*  게시판 입력(/bbsFaq/faqWriteProc.jsp) 끝  */


	/*	상세보기 페이지 게시글 출력 시작 (/bbsFaq/faqRead.jsp, 내용보기 페이지) */
	public BoardBean getBoard(int fNum) {
		String sql = null;

		BoardBean bean = new BoardBean();
		try {
			objConn = objPool.getConnection(); 
			sql = "select * from Faq where fNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, fNum);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				bean.setfNum(objRS.getInt("fNum"));
				bean.setfTitle(objRS.getString("fTitle"));
				bean.setfContent(objRS.getString("fContent"));
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return bean;
	} 
	/*	상세보기 게시글 출력 끝 (/bbs/read.jsp, 내용보기 페이지) */
	

}
