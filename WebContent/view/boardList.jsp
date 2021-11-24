<%@page import="com.google.gson.Gson"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/list.css">
    <script src="<%= path %>/js/board.js"></script>
</head>
<%
	ArrayList<BoardVO> boardList = (ArrayList) request.getAttribute("boardList");
	String json = new Gson().toJson(boardList);
%>

<!-- 글 목록 페이지 -->
<section id="list" class="d-flex flex-column align-items-center my-5">
	<div id="board-list">
    	<div class="news-box">
        	<img src="//img1.daumcdn.net/thumb/S240x138/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F11%2Fxportsnews%2F20211011200104661cmcr.jpg&scode=sports" alt="">
        	<div class="news-text">
            	<h5 class="news-title"><a href="./view.html">title</a></h5>
           		<a href="./view.html" class="news-content"> (엑스포츠뉴스 잠실, 김현세 기자) KT 위즈가 고삐를 당기기 시작했다. 전반기를 1위로 마친 KT는 후반기 들어 선두 자리에서 잠시 벗어났던 적이 있다. 후반기를 시작할 당시에도 2위인 LG 트윈스와 2경기 차였는데, 지난 8월 12일 고척 키움 히어로즈전에서 진 KT는 추격하던 LG로부터 달아나지 못하고 1위 자리를 잠시 내 줬다. 하지만 바로 다음날 제자리로 돌아 왔다. 지난 8월 13일 수원 삼성 라이온즈전에서
                	오드리사머 데스파이네를 앞세운 KT는 7-6으로 적은 점수 차를 지키며 1위 자리를 되찾았다. 그로부터 11일 서울 잠실야구장에서 열린 2021 신한은행 SOL KBO리그 LG 트윈스와 팀 간 시즌 16차전까지 60일째 선두 자리를 지키고 있다. 지난 9일 잠실 LG전에서 1-6으로 진 KT는 LG에 2.5경기 차까지 추격당했다. 지난 두 달에 가까운 시간 동안 많게는 5경기 안팎까지도 달아났고, 적게는
         	       한두 경기 차에서도 선두 자리를 지키던 KT지만 시즌이 막바지에 다다를수록 중압감도 적진 않았다. 이에 대해 이강철 감독은 11일 잠실 LG전을 앞두고 "아직까지 승패에 부담 갖는 걸 크게 느끼지 않지만, 오늘 지면 또 다를 수 있겠다"며 웃다가 "이전에도 마찬가지였지만 밑에서 다가 오는 느낌은 있다. 그래도 우리는 계속 쫓겨 왔다. 연연할 필요는 없다. 반 게임 차라도 우승하면 된다. 선수들도 크게 신경
	                쓰지 않는다"고 말했다. 그러면서도 "말은 안 해도 의식 안 할 수는 없을 거다. 아무리 1위를 계속 하던 팀도 마찬가지다"라고 말했다. 이 감독으로서도 1위 자리는 견뎌야 할 무게가 결코 작지 않았다. 그는 "마지막까지 최선을 다해야 한다는 중압감은 있다"며 "그래도 1위이기에 힘들다는 소리는 못 하고 있다. 혼자 생각할 뿐이다. 좋게 생각하려 한다. 좋은 자리에서 느끼는 스트레스이지 않나"라며 웃었다.
    	            KT는 하루 사이 달라진 분위기를 또 하루 만에 뒤바꿨다. 11일 잠실 LG전에서는 선발 등판한 오드리사머 데스파이네(5⅔이닝 2실점)에 이어 주권(⅓이닝), 조현우(1이닝), 이대은(⅔이닝), 박시영(⅓이닝), 김재윤(1이닝, 30세이브)이 무실점 릴레이를 펼쳤고, 타선에서는 강백호가 의미 있는 2타점을 올리며 결승타의 주인공이 됐다. 앞서 이 감독은 "내가 푸시를 좀 하면서 분위기를 맞춰 갈 수 있도록
	                적극적으로 나서려 한다. 어떻게든 결과는 나오겠지만 아무것도 하지 않으면 의미가 없다. 방어적으로 가다 보면 의미 없이 끝난다. 적극적으로 치고 던지게 조치해야 한다. 나부터 그렇게 할 거다"라고 말했다. 60일째 크고 작은 승차에도 변함없이 1위를 지키던 KT가 고삐까지 당기기 시작했다. 사진=엑스포츠뉴스DB 김현세 기자 kkachi@xportsnews.com </a>
            	<div class="news-date">2021.10.11 20:10</div>
        	</div>
    	</div>
    </div>

    <ul class="pagination mt-5 mx-auto">
        <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
        <li class="page-item active"><a href="#" class="page-link">1</a></li>
        <li class="page-item"><a href="#" class="page-link">2</a></li>
        <li class="page-item"><a href="#" class="page-link">3</a></li>
        <li class="page-item"><a href="#" class="page-link">4</a></li>
        <li class="page-item"><a href="#" class="page-link">5</a></li>
        <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
    </ul>
</section>

<script>
	const board = new Board(<%= json %>, '<%= request.getServletContext().getRealPath("upload").replace('\\', '/') %>');
</script>

<%@ include file="../footer.jsp"%>