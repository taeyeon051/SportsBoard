<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<head>
	<link rel="stylesheet" href="<%=path%>/css/main.css">
</head>

<script>
	if (document.location.href.split('?')[0].split('/').splice(4, 1)[0] != "main") {	
		location.href = "/SportsBoard/main?type=home";
	}
</script>

<%
	ArrayList<BoardVO> viewsList = (ArrayList) request.getAttribute("viewsList");
	ArrayList<BoardVO> latestList = (ArrayList) request.getAttribute("latestList");
	String boardPath = path + "/board/view?type=";
%>

<!-- 메인 영역 -->
<section id="main" class="d-flex justify-content-between pt-4 pb-3 mb-3">
	<div class="photo-news">
		<div class="photo w-100 h-100 position-relative overflow-hidden">
			<img
				src="https://image.imnews.imbc.com/news/2021/sports/article/__icsFiles/afieldfile/2021/01/12/s20210112022.jpg"
				alt="이정후">
			<div class="text"></div>
		</div>
	</div>
	<div class="ranking">
		<div class="ranking-header mx-auto my-3 text-center">많이 본 글</div>
		<ol>
			<%
				int i = 1;
				for (BoardVO data : viewsList) {
			%>
				<% if (data != null) { %>
					<li>
						<b class="rank"><%= i %></b>
						<a href="<%= boardPath %><%= data.getwType() %>&id=<%= data.getwCode() %>"><%= data.getTitle() %></a>
					</li>
				<%
					}
					i++;
				%>
			<% } %>
		</ol>
	</div>
	<div class="latest">
		<div class="latest-header mx-auto my-3 text-center">최신 글</div>
		<ul>
			<% for (BoardVO data : latestList) { %>
				<li>
					<a href="<%= boardPath %><%= data.getwType() %>&id=<%= data.getwCode() %>"><%= data.getTitle() %></a>
				</li>
			<% } %>
		</ul>
	</div>
</section>

<!-- 하이라이트 영상 영역 -->
<section id="highlight" class="position-relative mb-5">
	<h5 class="fw-bold">하이라이트 영상</h5>
	<a href="#" class="more-view-btn position-absolute">더보기 <i class="fas fa-angle-right"></i></a>
	<div class="videos d-flex mt-3">
		<a href="#" class="video">
			<div class="video-image">
				<img
					src="https://img1.daumcdn.net/thumb/S216x118ht.u/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2FKAKAOACCOUNT%2F1582552340%2Fthumb%2F20211010152336&scode=sports"
					alt="">
				<div class="play-icon">
					<i class="fas fa-play text-white"></i>
				</div>
				<div class="video-time">02:31</div>
			</div>
			<div class="video-text">
				<div class="video-title">'시즌 100타점' 양의지, 유희관을 강판시키는 투런 홈런 /
					3회말</div>
				<div class="video-info mt-2">
					<div class="video-num d-flex">
						<span class="video-num-icon">▷</span>
						<div class="video-num-time">
							<b>18,324</b> · 10.09 18:12
						</div>
					</div>
				</div>
			</div>
		</a> <a href="#" class="video">
			<div class="video-image">
				<img
					src="https://img1.daumcdn.net/thumb/S216x118ht.u/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2Fwarhol%2Fassets%2Fkakao_sports%2F9329521b9966e00ae26629ce8774ad5d647decd0&scode=sports"
					alt="">
				<div class="play-icon">
					<i class="fas fa-play text-white"></i>
				</div>
				<div class="video-time">08:39</div>
			</div>
			<div class="video-text">
				<div class="video-title">211010. '송명기 8승+3회 빅이닝' NC, 두산 꺾고 공동
					5위 도약 [전체HL]</div>
				<div class="video-info mt-2">
					<div class="video-num d-flex">
						<span class="video-num-icon">▷</span>
						<div class="video-num-time">
							<b>2,899</b> · 10.10 15:23
						</div>
					</div>
				</div>
			</div>
		</a> <a href="#" class="video">
			<div class="video-image">
				<img
					src="https://img1.daumcdn.net/thumb/S216x118ht.u/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2FKAKAOACCOUNT%2F120995917%2Fthumb%2F20211010192033&scode=sports"
					alt="">
				<div class="play-icon">
					<i class="fas fa-play text-white"></i>
				</div>
				<div class="video-time">01:51</div>
			</div>
			<div class="video-text">
				<div class="video-title">터커, 점수 차 벌리는 2타점 적시타 / 5회초</div>
				<div class="video-info mt-2">
					<div class="video-num d-flex">
						<span class="video-num-icon">▷</span>
						<div class="video-num-time">
							<b>2,534</b> · 10.10 17:24
						</div>
					</div>
				</div>
			</div>
		</a> <a href="#" class="video">
			<div class="video-image">
				<img
					src="https://img1.daumcdn.net/thumb/S216x118ht.u/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2FKAKAOACCOUNT%2F1126594423%2Fthumb%2F20211010155438&scode=sports"
					alt="">
				<div class="play-icon">
					<i class="fas fa-play text-white"></i>
				</div>
				<div class="video-time">01:13</div>
			</div>
			<div class="video-text">
				<div class="video-title">류지혁, 최형우의 1,100득점을 돕는 적시타 / 5회초</div>
				<div class="video-info mt-2">
					<div class="video-num d-flex">
						<span class="video-num-icon">▷</span>
						<div class="video-num-time">
							<b>2,004</b> · 10.10 19:20
						</div>
					</div>
				</div>
			</div>
		</a> <a href="#" class="video">
			<div class="video-image">
				<img
					src="https://img1.daumcdn.net/thumb/S216x118ht.u/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2Fwarhol%2Fassets%2Fkakao_sports%2Fdb68963771e09f21903eec2d7d04e5cc5e5a378b&scode=sports"
					alt="">
				<div class="play-icon">
					<i class="fas fa-play text-white"></i>
				</div>
				<div class="video-time">12:25</div>
			</div>
			<div class="video-text">
				<div class="video-title">211010. '장현식 4연투' KIA, 한화와의 3연전 싹쓸이
					승리 [전체HL]</div>
				<div class="video-info mt-2">
					<div class="video-num d-flex">
						<span class="video-num-icon">▷</span>
						<div class="video-num-time">
							<b>1,541</b> · 45분전
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>
</section>

<!-- 팀별 글 -->
<section id="teams">
	<div class="header mb-3 d-flex position-relative">
		<h5 class="fw-bold me-3">
			화제의 팀 <i class="ex-btn far fa-exclamation-circle"></i>
		</h5>
		<div class="ex-box">
			<div class="inner">
				<div class="close-exbox">×</div>
				<p class="mb-0">최신 업데이트된 팀/선수의 콘텐츠가 노출됩니다.</p>
			</div>
		</div>
		<div class="teams">
			<ul class="d-flex">
				<li data-idx="0" class="selected">KT</li>
				<li data-idx="1">LG</li>
				<li data-idx="2">삼성</li>
				<li data-idx="3">두산</li>
				<li data-idx="4">키움</li>
				<li data-idx="5">SSG</li>
				<li data-idx="6">NC</li>
				<li data-idx="7">롯데</li>
				<li data-idx="8">KIA</li>
				<li data-idx="9">한화</li>
			</ul>
		</div>
	</div>
	<div class="team-news-list">
		<a href="#" class="team-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F10%2Fpoctan%2F20211010171039048nqca.jpg&scode=sports"
			alt="">
			<div class="team-news-text">
				<div class="team-news-title">'불청객 가을비' LG는 지옥의 8연전..KT는 두산
					3연전까지 승부처 !</div>
				<div class="team-news-date">2021.10.10</div>
			</div>
		</a> <a href="#" class="team-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F10%2Fmydaily%2F20211010144818836inoh.jpg&scode=sports"
			alt="">
			<div class="team-news-text">
				<div class="team-news-title">LG 킬러 데스파이네..우천 취소에도 '나 집에 안 갈래'
				</div>
				<div class="team-news-date">2021.10.10</div>
			</div>
		</a> <a href="#" class="team-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F10%2Fxportsnews%2F20211010140517240nmpj.jpg&scode=sports"
			alt="">
			<div class="team-news-text">
				<div class="team-news-title">10일 잠실 KT-LG 우천취소, 11일 오후 2시 개최</div>
				<div class="team-news-date">2021.10.10</div>
			</div>
		</a> <a href="#" class="team-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F10%2Fspotvnews%2F20211010135949751wuxl.jpg&scode=sports"
			alt="">
			<div class="team-news-text">
				<div class="team-news-title">'선두 경쟁' kt-LG 최종전 우천 연기..11일 월요일
					경기 확정</div>
				<div class="team-news-date">2021.10.10</div>
			</div>
		</a>
	</div>
</section>

<!-- 선수별 글 -->
<section id="players">
	<div class="header mb-3 d-flex position-relative">
		<h5 class="fw-bold">
			화제의 선수 <i class="ex-btn far fa-exclamation-circle"></i>
		</h5>
		<div class="ex-box">
			<div class="inner">
				<div class="close-exbox">×</div>
				<p class="mb-0">최신 업데이트된 팀/선수의 콘텐츠가 노출됩니다.</p>
			</div>
		</div>
		<div class="players">
			<ul class="d-flex">
				<li class="selected">임기영</li>
				<li>장현식</li>
				<li>하주석</li>
				<li>황대인</li>
			</ul>
		</div>
	</div>
	<div class="player-news-list">
		<a href="#" class="player-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F10%2Fpoctan%2F20211010211740348ijwd.jpg&scode=sports"
			alt="">
			<div class="player-news-text">
				<div class="player-news-title">'임기영 5승' KIA, 한화에 DH 독식..5.5G차
					탈꼴찌 싸움 종료</div>
				<div class="player-news-date">2021.10.10</div>
			</div>
		</a> <a href="#" class="player-news"> <img
			src="https://img1.daumcdn.net/thumb/S120x74ht.u/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fnews%2F202110%2F04%2FNEWS1%2F20211004172014708ufhw.jpg&scode=sports"
			alt="">
			<div class="player-news-text">
				<div class="player-news-title">'롯데전 통산 6승' 임기영, 4연승의 서튼호 제동 걸까</div>
				<div class="player-news-date">2021.10.04</div>
			</div>
		</a> <a href="#" class="player-news"> <img
			src="//img1.daumcdn.net/thumb/S120x74/?fname=http%3A%2F%2Fimg1.daumcdn.net%2Fkakaotv%2FKAKAOACCOUNT%2F169085279%2Fthumb%2F20211010194128&scode=sports"
			alt="">
			<div class="player-news-text">
				<div class="player-news-title">4구 만에 이닝을 끝마치는 임기영 / 6회말</div>
				<div class="video-num d-flex">
					<span class="video-num-icon">▷</span>
					<div class="video-num-time">
						<b>317</b> · 21.10.10
					</div>
				</div>
			</div>
		</a>
	</div>
</section>

<%@ include file="footer.jsp"%>