<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<div class="main-content">
   <!-- Section : inner-header -->
   <section
      class="inner-header divider parallax layer-overlay overlay-dark-5"
      data-bg-img="/resources/images/newslist.jpg">
      <div class="container pt-70 pb-20">
         <!-- Section Content -->
         <div class="section-content">
            <div class="row">
               <div class="col-md-12">
                  <h2 class="title text-white">강의자료 등록</h2>
                  <ol class="breadcrumb text-left text-white">
                     <li><a href="/">&nbsp;</a></li>
                  </ol>
               </div>
            </div>
         </div>
      </div>
   </section>


   <!-- main 
   폼넣기
중복되는부분빼고
    -->

   <form role="form" method="post" class="form-horizontal"
      action="/adminVideo?command=adminVideoRegister">
      <input type="hidden" name="validation">
      <div class="box-body box-form-custom">
         <div class="form-group input-short">
            <div class="container">
               <!-- /. side Menu  -->
               <div class="col-md-2 mt-30 hidden-xs hidden-sm">
                  <div class="sidebar sidebar-left mt-sm-30">
                     <div class="widget">
                        <h5 class="widget-title line-bottom">
                           <a href="introGroup">강의자료 수정</a>
                        </h5>
                        <div class="categories">
                           <ul class="list list-border angle-double-right">
                              
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-md-9 blog-pull-right">
                  <div class="row">
                     <div style="height: 50px;">
                        <h4 class="line-bottom mt-20 mb-20 text-theme-colored">강의자료
                           등록</h4>
                     </div>


                     <div class="form-group input-short">
                        <label for="exampleInputEmail1" class="col-sm-2 control-label">제목<span
                           class="must-mark">*</span></label>
                        <div class="col-sm-10">
                           <!-- input type의 name중요시 -->
                           <input type="hidden" name="vNum" value="${videoVO.vNum}">
                           <input type="text" name="vTitle" class="form-control"
                             value="${videoVO.vTitle}">
                        </div>
                     </div>
                     <div class="form-group input-double">
                        <label for="exampleInputEmail1" class="col-sm-2 control-label">
                           강의 구분<span class="must-mark">*</span>
                        </label>
                        <div class="col-sm-4">
                           <select id="vSubject" name="vSubject" class="form-control">
                                 <option value="">선택</option>
                                 <option value="${videoVO.vSubject}">Java</option>
                                 <option value="${videoVO.vSubject}">JSP</option>
                                 <option value="${videoVO.vSubject}">DB</option>
                                 <option value="${videoVO.vSubject}">기타</option>
                           </select>

                        </div>
                        </div>

                        <div class="form-group input-short">
                           <label for="exampleInputEmail1" class="col-sm-2 control-label">내용<span
                              class="must-mark">*</span></label>
                           <div class="col-sm-10">
                              <input type="text" name="vContent" class="form-control"
                                value="${videoVO.vContent}"> <span id="vContent"></span>
                           </div>
                        </div>

                        <div class="form-group input-short">
                           <label for="exampleInputEmail1" class="col-sm-2 control-label">URL<span
                              class="must-mark">*</span></label>
                           <div class="col-sm-10">
                              <input type="text" name="vUrl" class="form-control"value="${videoVO.vUrl}"> 
                              <span id="vUrl"></span>
                           </div>    
                        </div>
							<div class="form-group input-short">
                        <label for="exampleInputEmail1" class="col-sm-2 control-label">작성자<span
                           class="must-mark"></span></label>
                       <!--  <div class="col-sm-10"> -->
                         <input type ="hidden" name = "adminid" value="admin" readonly="readonly">
                        <%--    <input type="text" name="adminId" class="form-control"
                             value="${AssignmentVO.adminId}" > <span id="assContent"></span>
                        </div> --%>
                     </div>


                        <div class="box-footer btn-group-center">
                           <button type="button" class="btn btn-cancel">취소</button>
                           <button type="submit" class="btn btn-primary" id="submitbutton">수정</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
   </form>
</div>


<!-- /.content -->


<script>
   var result = '${msg}';

   if (result == 'SUCCESS') {
      alert("처리가 완료되었습니다.");
   }
</script>
<!-- 스크립트 메세지 -->

<!-- 페이지이동 스트립트 -->

<!-- <script>
   $(document).ready(
         function() {

            $('#searchBtn').on(
                  "click",
                  function(event) {

                     self.location = "/admin/video/list"
                           + '${pageMaker.makeQuery(1)}'
                           + "&searchType="
                           + $("#searchType option:selected").val()
                           + "&keyword=" + $('#keywordInput').val();

                  });

            $('#newBtn').on("click", function(evt) {

               self.location = "/admin/video/register.jsp";

            });

         });
</script> -->
<!-- 검색버튼, 등록버튼 스크립트 -->



<form>
   <!--  id="jobForm"  -->
   <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
   <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>

</form>






<%@include file="../include/footer.jsp"%>