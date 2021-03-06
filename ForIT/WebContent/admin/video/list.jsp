
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../include/header.jsp"%>

<!-- Start main-content -->
<style>
.listcontent {
   font-size: 1em;
   overflow: hidden;
   text-overflow: ellipsis;
   line-height: 1.5;
   height: 3em;
   word-wrap: break-word;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
   margin-top: 5px;
   margin-bottom: 5px;
}
</style>
<div class="main-content" data-bg-img="/resources/images/main_img_1980.png">
   
    <!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="/resources/images/title.png">
        
        <div class="container pt-70 pb-20 ">
            <!-- Section Content -->
            <div class="section-content">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="title text-white">강의 자료</h2>
                        <ol class="breadcrumb text-left text-black mt-10">
                            <li>
<!-- 헤더부분 command -->  
                          <a href="/adminVideo?command=adminVideoList">Home</a></li>
                            <li class="active text-gray-silver">강의 자료</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- The archive: C:/Program Files/Java/jdk1.8.0_161/lib/tools.jar which is referenced by the classpath, does not exist. -->
    <!-- Section: Course list -->
    <section class="container">

        <div class="container">

            <div class="row">
            <div class="col-md-12">
                  <h3 class="widget-title line-bottom">강의자료 게시판</h3>
                  <hr>
                <div class="col-md-10 blog-pull-right">
               
                    <c:forEach items="${videoList}" var="VideoVO" varStatus="status">
                        <div class="row mb-15 ">
                        
                            

                     <a href='read${pageMaker.makeSearch(pageMaker.cri.page) }&num=${VideoVO.vNum}'>
                            <div class="col-sm-6 col-md-7 blog-pull-right">
                               
                                <!-- 강의자료 제목  -->
                                <h3><a href="/adminVideo?command=adminVideoDetail&vNum=${VideoVO.vNum}">${VideoVO.vTitle}</a>
                                    </h3>
                                    
                                    
                                <h4 class="line-bottom mt-0 mt-sm-20"></h4>
                                <ul class="review_text list-inline">
                                    <li>
                                        <h9 class="mt-0"> <span class="text-theme-color-2">게시일 : </span>
                                            <fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${VideoVO.vDate}" />
                                        </h9>
                                    </li>
                                    <li>
                                        <div class="" title="vCount">
                                            <span class="text-theme-color-2">조회수 : </span> <span>${VideoVO.vCount}회</span>
                                        </div>
                                    </li>
                                </ul>
                                <!-- 리스트에 보이는 내용 subStr 100까지-->
                                <p class="listcontent" style="margin-right: 30%;">${VideoVO.vContent}</p>
                            </div>
                            </a>
                            
                            <div class="col-sm-6 col-md-4 ">

                                <div class="thumb col-md-12"><!-- videoVO.link -->
                                    <iframe id="vid_prv" height="170px" src="https://www.youtube.com/embed/${videoVO.vUrl}" frameborder="0" gesture="media"
                                        allow="encrypted-media" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>

                        <hr>

                    </c:forEach>
                    <div class="box-footer">

                        <div class="text-center">
                            <ul class="pagination theme-colored xs-pull-center mb-xs-40">
                                <c:if test="${pageMaker.prev}">
                                    <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                                </c:if>

                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                    <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" />>
                                    <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
                                </c:if>
                            </ul>
                            
                        </div>
                        <!-- .text-center END -->
                    </div>

                    <div class="box-keyword">
                        <div class="row">
                            <div class="col-md-2 col-xs-3">
                                <select name="listType" class="form-control" onchange="if(this.value) location.href=(this.value);">
                                    <option value="/video/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">정렬
                                        기준
                                    </option><!-- videoBoard 링크 다시 찍어주기 -->
                                    <option <c:out value="${cri.listType eq 'dd'?'selected':''}" /> value="/video/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=dd">최신순
                                    </option>
                                    <option <c:out value="${cri.listType eq 'da'?'selected':''}" /> value="/video/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=da">오래된순
                                    </option>
                                    <option <c:out value="${cri.listType eq 'vc'?'selected':''}" /> value="/video/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=vc">조회순
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-2 col-xs-3">
                                <!-- <div class="col-md-2 col-xs-4" style="margin-left: 50%"> -->
                                <select name="searchType" id="searchType" class="form-control">
                                    <option value="n" <c:out value="${cri.searchType == null?'selected':''}" />> ---
                                    </option>
                                    <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}" />> 제목
                                    </option>
                                    <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />> 내용
                                    </option>
                                    <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}" />> 작성자
                                    </option>
                                    <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}" />> 제목 or 내용
                                    </option>
                                    <option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}" />> 내용 or 작성자
                                    </option>
                                    <option value="twc" <c:out value="${cri.searchType eq 'twc'?'selected':''}" />> 제목 or
                                    내용 or 작성자
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-5 col-xs-4">
                                <input class="form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword}' placeholder="키워드를 입력하세요">
                            </div>
                            <div class="col-md-3 col-xs-2">
                                <div class="btn-group-custom">
                                    <button id='searchBtn' type="submit" class="btn btn-default">
                                        <i class="fa fa-search"></i> 검색
                                    </button>
                                </div>

                            </div>

                        </div>


                    </div>

                </div>
            </div>
            


            <!-- end main-content -->

            <!-- Footer -->

        </div>
        </div>
    </section>

</div>


<script>
    var result = '${msg}';

    if (result == 'SUCCESS') {
        alert("처리가 완료되었습니다.");
    }

    $(document)
        .ready(

            function () {
                $('#searchBtn')
                    .on(
                        "click",
                        function (video) {
                            if (document.getElementById("searchType").value == "n") {
                                alert("검색항목을 선택해주세요")
                                //document.searchType.option.focus();
                                return false;

                            } else if (document
                                .getElementById("keywordInput").value == "") {
                                alert("검색단어를 입력해주세요");
                                return false;

                            } else
                                self.location = "list"
                                    + '${pageMaker.makeQuery(1)}'
                                    + "&searchType="
                                    + $("#searchType option:selected").val()
                                    + "&keyword="
                                    + $('#keywordInput').val();

                        });

                $('#newBtn')
                    .on(
                        "click",
                        function (evt) {
                            self.location = "register${pageMaker.makeSearch(pageMaker.cri.page) }";
                        });
            });
</script>
<%@include file="../include/footer.jsp"%>