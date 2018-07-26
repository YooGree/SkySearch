<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars" ></i>
                </button>
                <a class="navbar-brand" href="<c:url value='/'/>">
                <i class="mdi mdi-airplane-takeoff"></i> <strong> SKY
					Search</strong></a>
                <a class="navbar-brand hidden" href="<c:url value='/'/>"><i class="mdi mdi-airplane-takeoff"></i></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<c:url value='/manage/main/index'/>"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    <h3 class="menu-title">관리 메뉴</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="<c:url value='/manage/member/list'/>" > <i class="menu-icon fa fa-laptop"></i>회원 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="<c:url value='/manage/ti/ti_cilist'/>" > <i class="menu-icon fa fa-th"></i>여행정보 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                        </ul>
                    </li>

                   
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->