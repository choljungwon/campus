package kr.icia.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds; // 디비에 연결 설정

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper; // memverVO

//   @Test
//   public void testInsertMember() {
//      String sql 
//      = "insert into tbl_member(userid,userpw"
//       + ",username) values (?,?,?)";// 쿼리문 생성후 ? 각각에 들어감
//
//      for (int i = 0; i < 100; i++) { // 100 개의 임시계정 생성
//         Connection con = null;
//         PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 담아서 디비에 전송.
//
//         try {
//            con = ds.getConnection();
//            pstmt = con.prepareStatement(sql);
//
//            pstmt.setString(2, pwencoder.encode("pw" + i));// 암호화 처리. ? 전달해라. 옛날 방식.
//            // 암호 입력 항목에 pw0, pw1.... 식의 패스워드를 암호화 변경하여 저장.
//
//            if (i < 80) { //0번부터79 까지는 일반사용자.
//               pstmt.setString(1, "user" + i);
//               pstmt.setString(3, "일반사용자" + i);
//            } else if (i < 90) { // 80부터 89까지는 매니저.
//               pstmt.setString(1, "manager" + i);
//               pstmt.setString(3, "운영자" + i);
//            } else {             // 90부터 99까지는 관리자.
//               pstmt.setString(1, "admin" + i);
//               pstmt.setString(3, "관리자" + i);
//            }
//            pstmt.executeUpdate();
//         } catch (Exception e) {
//            e.printStackTrace();
//         } finally {
//            if (pstmt != null) {
//               try {
//                  pstmt.close();
//               } catch (Exception e) {
//               }
//            }
//            if (con != null) {
//               try {
//                  con.close();
//               } catch (Exception e) {
//            }
//         }
//      }
//   }

	// 각 계정별 권한 추가.
	@Test
	public void testInsertAuth() {
		String sql = "insert into tbl_member_auth (userid,auth)" + " values (?,?)";

		for (int i = 0; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				if (i < 80) { // 0~79 role_user
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i < 90) { // 80~89 role_member
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				} else { // 90~99 role_admin
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		}
	}

}