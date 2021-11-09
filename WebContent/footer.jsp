<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	</div>
	
    <!-- 푸터 영역 -->
    <footer class="d-flex">
        <div class="inner-foot d-flex justify-content-between">
            <div class="footer-menu d-flex justify-content-between">
                <a href="<%= request.getContextPath() %>/main?item=home">스포츠홈</a>
                <a href="<%= request.getContextPath() %>/main?item=baseball">야구</a>
                <a href="<%= request.getContextPath() %>/main?item=worldbaseball">해외야구</a>
                <a href="<%= request.getContextPath() %>/main?item=soccer">축구</a>
                <a href="<%= request.getContextPath() %>/main?item=worldsoccer">해외축구</a>
                <a href="<%= request.getContextPath() %>/main?item=golf">골프</a>
                <a href="<%= request.getContextPath() %>/main?item=basketball">농구</a>
                <a href="<%= request.getContextPath() %>/main?item=volleyball">배구</a>
            </div>
            <div class="footer-copyright">
                <p>Copyright &copy; yy. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>

</html>