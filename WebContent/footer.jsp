<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	</div>
	
    <!-- 푸터 영역 -->
    <footer class="d-flex">
        <div class="inner-foot d-flex justify-content-between">
            <div class="footer-menu d-flex justify-content-between">
                <a href="<%= request.getContextPath() %>/main/baseball">야구</a>
                <a href="<%= request.getContextPath() %>/main/worldBaseball">해외야구</a>
                <a href="<%= request.getContextPath() %>/main/soccer">축구</a>
                <a href="<%= request.getContextPath() %>/main/worldSoccer">해외축구</a>
                <a href="<%= request.getContextPath() %>/main/golf">골프</a>
                <a href="<%= request.getContextPath() %>/main/basketball">농구</a>
                <a href="<%= request.getContextPath() %>/main/volleyball">배구</a>
            </div>
            <div class="footer-copyright">
                <p>Copyright &copy; yy. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>

</html>