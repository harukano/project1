package util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Test_logger {
	// getLogger() 선언된 클래스 명칭을 적으시면 되요~ 로그에 위치 표시.
	private final static Logger logger = LoggerFactory.getLogger(Test_logger.class);

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 개발자가 아닌 다른 외부 사람들이 봐도 상관없을때 info를써요~(ex- 페이지이동, 로그인성공여부 등등..)
		logger.info("logger.info TEST");
		// 개발자들이 보통 쓰는 로그입니다!
		logger.debug("loger.debug TEST");
		// 요건 트라이 캐치절에서 캐치절에 쓰면 됩니다!!
		logger.error("logger.error TEST");

	}

}
