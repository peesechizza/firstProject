package pack_Product;

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

import pack_BBS.UtilMgr;
import pack_DBCP.DBConnectionMgr;

public class ProductMgr {
	private DBConnectionMgr objPool;

	Connection objConn = null;
	PreparedStatement objPstmt = null;
	Statement objStmt = null;
	ResultSet objRS = null;

	private static final String SAVEFOLER = "D:/Bigdata_java_220511/ksh/Project/product/Project_a1dotls/WebContent/product/BBSUploadFile";
	private static String encType = "UTF-8";
	private static int maxSize = 5 * 1024 * 1024;

	public ProductMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}

	}
	
	
	int pSize = 0;
		String pSysImg = null;

	// 상품 페이지 입력
	public void insertProductInfo(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;
		

		try {
			objConn = objPool.getConnection();
			//System.out.println("연동 성공!");
			sql = "select max(pNum) from Products";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			File file = new File(SAVEFOLER);

			if (!file.exists())
				file.mkdir(); // 현재 디렉토리

			multi = new MultipartRequest(req, SAVEFOLER, maxSize, encType, new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("pOrigImg") != null) {
				pSysImg = multi.getFilesystemName("pOrigImg");
				pSize = (int) multi.getFile("pOrigImg").length();
			}

			sql = "insert into Products(";
			sql += "pCode, uId, pName, pOrigPrice, pDiscountR, pDivi, pSellPrice, ";
			sql += "pQuan, pTM, pOrigImg, pSysImg, pSize, pReadCnt, pContent) values (";
			sql += " ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, 0, ?)";

			objPstmt = objConn.prepareStatement(sql);

			objPstmt.setString(1, multi.getParameter("pCode"));
			objPstmt.setString(2, multi.getParameter("uId"));
			objPstmt.setString(3, multi.getParameter("pName"));
			objPstmt.setString(4, multi.getParameter("pOrigPrice"));
			objPstmt.setString(5, multi.getParameter("pDiscountR"));
			objPstmt.setString(6, multi.getParameter("pDivi"));
			objPstmt.setString(7, multi.getParameter("pSellPrice"));
			objPstmt.setString(8, multi.getParameter("pQuan"));
			objPstmt.setString(9, multi.getParameter("pOrigImg"));
			objPstmt.setString(10, pSysImg);
			objPstmt.setInt(11, pSize);
			objPstmt.setString(12, multi.getParameter("pContent"));
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.toString());
		} finally {
			objPool.freeConnection(objConn);
		}
	}
	
	
	/// 조회수///
	public void upCount(int pNum) {
		String sql = null;

		try {
			objConn = objPool.getConnection();
			sql = "update Products set pReadCnt = pReadCnt+1 where pNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pNum);
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception 12 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}
	}
	
	

	/// 상세페이지 게시글 출력 - O //
	public ProductBean Pboard(int pNum) {
		String sql = null;

		ProductBean Pbean = new ProductBean();
		try {
			objConn = objPool.getConnection();

			sql = "select * from Products where pNum =?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pNum);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				Pbean.setpNum(objRS.getInt("pNum"));
				Pbean.setuId(objRS.getString("uId"));
				Pbean.setpCode(objRS.getString("pCode"));
				Pbean.setpName(objRS.getString("pName"));
				Pbean.setpOrigPrice(objRS.getInt("pOrigPrice"));
				Pbean.setpDiscountR(objRS.getInt("pDiscountR"));
				Pbean.setpDivi(objRS.getInt("pDivi"));
				Pbean.setpSellPrice(objRS.getInt("pSellPrice"));
				Pbean.setpQuan(objRS.getInt("pQuan"));
				Pbean.setpTM(objRS.getString("pTM"));
				Pbean.setpOrigImg(objRS.getString("pOrigImg"));
				Pbean.setpSysImg(objRS.getString("pSysImg"));
				Pbean.setpSize(objRS.getInt("pSize"));
				Pbean.setpReadCnt(objRS.getInt("pReadCnt"));
				Pbean.setpContent(objRS.getString("pContent"));

			}

		} catch (Exception e) {
			System.out.println("Exception 13 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return Pbean;

	}
	
	/* 상세보기 페이지 파일다운로드 시작*/
	public static int len;

	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		String pOrigImg = req.getParameter("pOrigImg"); // 다운로드할 파일 매개변수명 일치
		try {
			File file = new File(UtilMgr.con(SAVEFOLER + File.separator + pOrigImg));

			byte[] b = new byte[(int) file.length()];
			res.setHeader("Accept-Ranges", "bytes");
			String strClient = req.getHeader("User-Agent");
			res.setContentType("application/smnet;charset=utf-8");
			res.setHeader("Content-Disposition", "attachment;fileName=" + pOrigImg + ";");

			out.clear();
			out = pageContext.pushBody();

			if (file.isFile()) {
				BufferedInputStream fIn = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream fOuts = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while ((read = fIn.read(b)) != -1) {
					fOuts.write(b, 0, read);
				}
				fOuts.close();
				fIn.close();

			}

		} catch (Exception e) {
			System.out.println("파일 처리 이슈 : " + e.getMessage());
		}

	}

	/* 상세보기 페이지 파일다운로드 끝 */
	
	
	
	
	
	
	
	//게시글 리스트
	public Vector<ProductBean> contentList(String keyField, String keyWord, int start, int end) {
		
		Vector<ProductBean> pList = new Vector<>();
		// TO데이터 벡터에 담기
		try {
			objConn = objPool.getConnection();
			
			if (keyWord.equals("null") || keyWord.equals("")) {
				// 검색어가 없을 경우
				String sql = "select * from Products "
						+ "order by pNum desc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);
				
				
			} else {
				// 검색어가 있을 경우
				String sql = "select * from Products "
						+ "where "+ keyField +" like ? "
						+ "order by pNum desc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%"+keyWord+"%");
				objPstmt.setInt(2, start);
				objPstmt.setInt(3, end);				
			}
			
			
			objRS = objPstmt.executeQuery();
			ProductBean Pbean = null;
			
			
			while (objRS.next()) {
				//System.out.println("호이호이");
				Pbean = new ProductBean();
				
				Pbean.setpNum(objRS.getInt("pNum"));
				Pbean.setpName(objRS.getString("pName"));
				Pbean.setpDiscountR(objRS.getInt("pDiscountR"));
				Pbean.setpOrigPrice(objRS.getInt("pOrigPrice"));
				Pbean.setpSellPrice(objRS.getInt("pSellPrice"));
				Pbean.setpSysImg(objRS.getString("pSysImg"));
				Pbean.setpReadCnt(objRS.getInt("pReadCnt"));
				pList.add(Pbean);
			}
			
		} catch (Exception e) {
			System.out.println("Exception 14  : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return pList;
	}
	
	
	//총 게시글 수
	public int getTotalCount(String keyField, String keyWord) {

		String sql = null;
		int totalCnt = 0;

		try {
			objConn = objPool.getConnection();
			
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(*) from Products";
				objPstmt = objConn.prepareStatement(sql);
			} else {
				sql = "select count(*) from Products ";
				sql += "where "+keyField+" like ?";
				objPstmt.setString(1, "%" + keyWord + "%");
				objPstmt = objConn.prepareStatement(sql);
			}

			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				totalCnt = objRS.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("e Message : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return totalCnt;
	}
	
	

	// 게시글 수정페이지
	public int updateContent(ProductBean Pbean) {
		int exeCnt = 0;

		try {
			objConn = objPool.getConnection();

			String sql = "update Products set pCode=?,pName=?,pOrigPrice=?,";
			sql += "pDiscountR=?,pDivi=?,pSellPrice=?,pContent=? where pNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, Pbean.getpCode());
			objPstmt.setString(2, Pbean.getpName());
			objPstmt.setInt(3, Pbean.getpOrigPrice());
			objPstmt.setInt(4, Pbean.getpDiscountR());
			objPstmt.setInt(5, Pbean.getpDivi());
			objPstmt.setInt(6, Pbean.getpSellPrice());
			objPstmt.setString(7, Pbean.getpContent());
			objPstmt.setInt(8, Pbean.getpNum());
			exeCnt = objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception 15 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}
		return exeCnt;
	}

	// 게시글 삭제
	public int delateProduct(int pNum) {

		String sql = null;
		int exeCnt = 0;

		try {
			objConn = objPool.getConnection();

			sql = "select pOrigImg from Products where pNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pNum);
			objRS = objPstmt.executeQuery();

			sql = "select pOrigImg from Products where pNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pNum);
			objRS = objPstmt.executeQuery();

			if (objRS.next() && objRS.getString(1) != null) {
				if (!objRS.getString(1).equals("")) {
					String fName = objRS.getString(1);
					String fileSrc = SAVEFOLER + "/" + fName;
					File file = new File(fileSrc);

					if (file.exists())
						file.delete(); // 파일 삭제 실행

				}
			}

			sql = "delete from Products where pNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pNum);
			exeCnt = objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception  16: " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return exeCnt;
	}
}
