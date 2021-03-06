<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CAMP-US</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>

      <div class="site-blocks-cover"
         style="background-image: url(/resources/images/title.png);"
         data-aos="fade">
         <div class="container">
            <div
               class="row align-items-start align-items-md-center justify-content-end">
               <!--  <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
            <h1 class="mb-2">Finding Your Perfect Shoes</h1>
            <div class="intro-text text-center text-md-left">
              <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla. </p>
              <p>
                <a href="#" class="btn btn-sm btn-primary">Shop Now</a>
              </p> -->
            </div>
         </div>
      </div>
   </div>
   </div>

   <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
         <div class="row">
            <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
               data-aos="fade-up" data-aos-delay="">
               <div class="icon mr-4 align-self-start">
                  <span class="icon-truck"></span>
               </div>
               <div class="text">
                  <h2 class="text-uppercase">FREE SHIPING</h2>
                  <p>캠퍼스는 전품목 무료배송입니다.</p>
               </div>
            </div>
            <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
               data-aos="fade-up" data-aos-delay="100">
               <div class="icon mr-4 align-self-start">
                  <span class="icon-refresh2"></span>
               </div>
               <div class="text">
                  <h2 class="text-uppercase">RENTAL SERVICE</h2>
                  <p>중장비 대여 서비스를 운영합니다.</p>
               </div>
            </div>
            <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
               data-aos="fade-up" data-aos-delay="200">
               <div class="icon mr-4 align-self-start">
                  <span class="icon-user"></span>
               </div>
               <div class="text">
                  <h2 class="text-uppercase">TRAVELER COMMUNITY</h2>
                  <p>커뮤니티에서 캠핑 정보를 공유해보세요.</p>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="site-section site-blocks-2">
      <div class="container">
         <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade"
               data-aos-delay="">
               <a class="block-2-item" href="../shop/itemList?category=camping">
                  <figure class="image">
                     <img src="/resources/images/Camping.png" alt="" class="img-fluid">
                  </figure>
                  <div class="text">
                     <span class="text-uppercase">Collections</span>
                     <h3>Camping</h3>
                  </div>
               </a>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade"
               data-aos-delay="100">
               <a class="block-2-item" href="../shop/itemList?category=backpacking">
                  <figure class="image">
                     <img src="/resources/images/Backpacking.png" alt=""
                        class="img-fluid">
                  </figure>
                  <div class="text">
                     <span class="text-uppercase">Collections</span>
                     <h3>Backpacking</h3>
                  </div>
               </a>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade"
               data-aos-delay="200">
               <a class="block-2-item" href="../shop/itemList?category=picnic">
                  <figure class="image">
                     <img src="/resources/images/Picnic.png" alt="" class="img-fluid">
                  </figure>
                  <div class="text">
                     <span class="text-uppercase">Collections</span>
                     <h3>Picnic</h3>
                  </div>
               </a>
            </div>
         </div>
      </div>
   </div>

   <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-7 site-section-heading text-center pt-4">
               <h2>Recommended items</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="nonloop-block-3 owl-carousel">
				<c:forEach var="item" items="${recommendedItems}">
				  <div class="item">
                     <div class="block-4 text-center">
                        <figure class="block-4-image">
                         <a href="${item.itemCode}" class="move">
                           <img src="/resources/images/shoe_1.jpg" alt="Image placeholder"
                              class="img-fluid">
                         </a>
                        </figure>
                        <div class="block-4-text p-4">
                           <h3>
                              <a href="${item.itemCode}" class="move"><c:out value="${item.itemName}"/></a>
                           </h3>
                           <p class="mb-0"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
                        </div>
                     </div>
                  </div>
				</c:forEach>		
               </div>
            </div>
         </div>
         
        <form id="actionForm" action="/shop/itemList" method="get">
			<input type="hidden" name="category" value="${pageMaker.cri.category}">
		</form>
         
      </div>
   </div>
   

   <div class="site-section block-8">
      <div class="container">
         <div class="row justify-content-center  mb-5">
            <div class="col-md-7 site-section-heading text-center pt-4">
               <h2>New Items!</h2>
            </div>
         </div>
         <div class="row align-items-center">
            <div class="col-md-12 col-lg-7 mb-5">
               <a href="#"><img src="/resources/images/blog_1.jpg"
                  alt="Image placeholder" class="img-fluid rounded"></a>
            </div>
            <div class="col-md-12 col-lg-5 text-center pl-md-5">
               <h2>
                  <a href="../shop/newList">Look around new items</a>
               </h2>
               <p class="post-meta mb-4">
                  By <a href="#">Carl Smith</a> <span class="block-8-sep">&bullet;</span>
                  September 3, 2018
               </p>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Quisquam iste dolor accusantium facere corporis ipsum animi
                  deleniti fugiat. Ex, veniam?</p>
               <p>
                  <a href="/shop/itemList" class="btn btn-primary btn-sm">Shop Now</a>
               </p>
            </div>
         </div>
      </div>
   </div>

   <script src="/resources/js/jquery-3.3.1.min.js"></script>
   <script src="/resources/js/jquery-ui.js"></script>
   <script src="/resources/js/popper.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/owl.carousel.min.js"></script>
   <script src="/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="/resources/js/aos.js"></script>
   <script src="/resources/js/main.js"></script>

   <!-- 서치 페이징 처리 스크립트 사용X form의 action으로 변경함-->
   <script type="text/javascript">
	$(document).ready(function() {
		
		var actionForm = $("#actionForm");
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='itemCode' "+"value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/shop/readItem");
			actionForm.submit();
		});
	}); //document ready function end
   </script>


</body>
</html>

<%@ include file="includes/footer.jsp"%>