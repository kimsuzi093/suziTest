<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="middleWrap">
	<ul class="nav nav-tabs nav-justified">
	    <li class="active"><a href="">줄거리</a></li>
	    <li><a href="./movieView_trailer?num=${movieDTO.num }">예고편</a></li>
	</ul>
	<div class="middle" style="overflow-y: scroll; text-indent: 10px; margin: 10px 10px;">
		${movieDTO.story }	
	</div>
</div>