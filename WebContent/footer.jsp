<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	</div>
	
    <!-- 푸터 영역 -->
    <footer class="d-flex">
        <div class="inner-foot d-flex justify-content-between">
            <div class="footer-menu d-flex justify-content-between">
                <a href="<%= request.getContextPath() %>/main?type=home">스포츠홈</a>
                <a href="<%= request.getContextPath() %>/main?type=baseball">야구</a>
                <a href="<%= request.getContextPath() %>/main?type=worldbaseball">해외야구</a>
                <a href="<%= request.getContextPath() %>/main?type=soccer">축구</a>
                <a href="<%= request.getContextPath() %>/main?type=worldsoccer">해외축구</a>
                <a href="<%= request.getContextPath() %>/main?type=golf">골프</a>
                <a href="<%= request.getContextPath() %>/main?type=basketball">농구</a>
                <a href="<%= request.getContextPath() %>/main?type=volleyball">배구</a>
            </div>
            <div class="footer-copyright">
                <p>Copyright &copy; yy. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <script>
		if (document.location.href.split('?')[0].split('/').splice(4, 1)[0] == "user") {	
			document.querySelector('#submenu').innerHTML = "";
		}
	</script>
</body>

</html>