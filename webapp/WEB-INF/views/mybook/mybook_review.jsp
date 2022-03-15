<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/mybook_review.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">
<script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
</head>
<body>
   <div id="wrap">
      <!-- 헤더 -->
      <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
      <!-- ------nav------ -->
      <div id="nav" class="clearfix">
         <c:choose>
            <c:when test="${result eq 'sameUser'}">
               <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
                  <li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
                  <!--세션 아이디와 사이트아이디 같을때-->
                  <li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
               </ul>
            </c:when>
            <c:otherwise>
               <!-- 세션아이디랑 다를때는 사이트주소의 아이디와 같은 유저의 데이터들 불러오기-->
               <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">남 서평</a></li>
                  <li role="presentation"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
               </ul>
            </c:otherwise>
         </c:choose>
      </div>
      <!-- ------nav------ -->
      <!--content-->
      <div class="container">
         <div class="row">
            <!-- col-xs-8 -->
            <div id="content" class="col-xs-8">
               <!--기록하기 박스-->
               <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->
               <c:if test="${result eq 'sameUser'}">
                  <div id="writebox" class="jumbotron">
                     <h1>서평 기록하기</h1>
                     <p>'${authUser.nickname}'님, 오늘은 어떤 책을 읽으셨나요?</p>
                     <p>
                        <a class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/review_write" role="button">기록하기</a>
                     </p>
                  </div>
               </c:if>
               <!-- list -->
               <div id="list">
                  <ul>
                     <li><a><span>최신순</span></a></li>
                     <li><a><span>인기순</span></a></li>
                  </ul>
                  <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                  <div id="category" class="dropdown">
                     <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        카테고리 <span class="caret"></span>
                     </button>
                     <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="">즐거운</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="">우울한</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="">화난</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="">감성적인</a></li>
                     </ul>
                  </div>
               </div>
               <!-- list -->
               <!-- 서평 리스트 -->
               <c:forEach items="${mbList }" var="vo">
                  <div id="reviews">
                     <div id="reviews-header">
                        <div class="left">
                           <p>
                              <a href="${pageContext.request.contextPath}/bookdetail?bookNo=${vo.bookNo}">${vo.bookTitle }</a>
                           </p>
                        </div>
                        <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->
                        <c:if test="${result eq 'sameUser'}">
                           <div class="right">
                              <a>수정</a> <a>삭제</a>
                           </div>
                        </c:if>
                     </div>
                     <c:choose>
                        <c:when test="${result eq 'sameUser'}">
                           <!-- 작성자아이디와 세션아이디가 동일할 경우에는 안보이게 -->
                        </c:when>
                        <c:otherwise>
                           <div id="reviewer">
                              <a href="${pageContext.request.contextPath}/${vo.nickname }">${vo.nickname }</a>
                           </div>
                        </c:otherwise>
                     </c:choose>
                     <div id="reviews-content">
                        <p>${vo.reviewContent }</p>
                     </div>
                     <div id="reviews-footer">
                        <div class="left">
                           <span id="heart" data-reviewno="${vo.reviewNo }" class="like glyphicon glyphicon-heart-empty" aria-hidden="true"></span> <span>${vo.likecnt }</span> <span>${vo.reviewDate }</span>
                        </div>
                        <div class="right">
                           <div class="dropup">
                              <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 더보기 <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                 <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
                                 <li role="presentation" class="divider"></li>
                                 <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
                                 <li role="presentation" class="divider"></li>
                                 <li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                 </a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
               <!-- 서평리스트 -->
            </div>
            <!-- //col-xs-8 -->
            <!-- col-xs-4:프로필 -->
            <div id="aside" class="col-xs-4">
               <div id="profile-box" class="panel panel-default">
                  <div class="panel-heading">
                     <c:choose>
                        <c:when test="${result eq 'sameUser'}">
                           <h3 id="profile-title" class="panel-title">내 서재</h3>
                        </c:when>
                        <c:otherwise>
                           <h3 id="profile-title" class="panel-title">${result}님의서재</h3>
                        </c:otherwise>
                     </c:choose>
                  </div>
                  <div class="panel-body">
                     <div id="profile">
                        <img id="profile-image" src="${pageContext.request.contextPath}/asset/img/profile.png">
                     </div>
                     <c:choose>
                        <c:when test="${result eq 'sameUser'}">
                           <p id="username">${authUser.nickname}</p>
                        </c:when>
                        <c:otherwise>
                           <p id="username">${result}</p>
                        </c:otherwise>
                     </c:choose>
                     <p id="level">Lv.0</p>
                     <div id="info">
                        <a href="${pageContext.request.contextPath}/user/user_modify">회원정보수정</a> <a>로그아웃</a>
                     </div>
                  </div>
               </div>
            </div>
            <!-- //col-xs-4 -->
         </div>
      </div>
      <!--content-->
      <!-- footer -->
      <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
      <!-- modal창 -->
      <c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
   </div>
</body>
<script>
   //좋아요 버튼을 클릭했을때(이벤트)
   $(".like").on('click', function() {
      
      //데이터수집
      var $this = $(this);
      var no = $this.data("reviewno");
      
      //출력(리뷰넘버찍어보기), json 으로 보내주기
      console.log(no);
      var clickReview = {
            reviewNo : no
         };
      
      
      //포함되어있으면 true      
      let isExist = document.getElementById('heart').classList
            .contains('glyphicon-heart-empty');

      //좋아요
      if (isExist == true) {
         console.log("좋아요")

         let like = document.getElementById('heart');
         like.classList.replace("glyphicon-heart-empty", "glyphicon-heart");
         
      //좋아요취소인경우
      } else {
         console.log("좋아요취소")

         let like = document.getElementById('heart');
         like.classList.replace("glyphicon-heart", "glyphicon-heart-empty");
      }
      
      //요청 : json 방식
      $.ajax({
         //url로 요청할게!    
         url : "${pageContext.request.contextPath }/like",
         type : "post",
         contentType : "application/json", //보낼때 json으로 보낼게
         data : clickReview,
         //주소뒤에 갈 데이터 전송방식, //자바 스크립트 객체를 json형식으로 변경
         dataType : "json", //json> javascript
      /*
      success : function(guestbookVo) {
         //성공시 처리해야될 코드 작성//
         console.log(guestbookVo);
         render(guestbookVo, "up"); //위로 붙일지!
         
         //좋아요인경우
         if (isExist == true) {
            console.log("좋아요")
            
            let like = document.getElementById('heart');
            like.classList.replace("glyphicon-heart-empty",
                  "glyphicon-heart");
            
            //좋아요한 테이블에 데이터추가
         //좋아요취소인경우
         } else {
            console.log("좋아요취소")
            
            let like = document.getElementById('heart');
            like.classList.replace("glyphicon-heart",
                  "glyphicon-heart-empty");
         }

         //입력화면 초기화
         $("#input-uname").val("");
         $("#input-pass").val("");
         $("[name='content']").val("");
         
         //숫자도 바껴야함
      },
      //로그인하지 않은경우(모달창띄워주기)
      error : function(XHR, status, error) {
         console.error(status + " : " + error);
      }*/

      });
      
   });

   $('.reviews').on(
         'click',
         '#heart',
         function() {

            //포함되어있으면 true
            let isExist = document.getElemenstByClassName('like').classList
                  .contains('glyphicon-heart-empty');

            //데이터수집
            var reviewNo = $("#reviewNo").val();

            //출력(리뷰넘버찍어보기)
            console.log(reviewNo);

            var clickReview = {
               reviewNo : reviewNo
            };

            //좋아요
            if (isExist == true) {
               console.log("좋아요")

               let like = document.getElementById('heart');
               like.classList.replace("glyphicon-heart-empty",
                     "glyphicon-heart");
               //좋아요취소인경우
            } else {
               console.log("좋아요취소")

               let like = document.getElementById('heart');
               like.classList.replace("glyphicon-heart",
                     "glyphicon-heart-empty");
            }

            

         });
</script>
<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
</html>