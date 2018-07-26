<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tiles:insertAttribute name="layout.header" />
<title><tiles:getAsString name="layout.title" /></title>
</head>
<body>
     	<tiles:insertAttribute name="layout.top" />
		<tiles:insertAttribute name="layout.body" />
  <div class="a">
     <a href="#" class="Totop" style="display: block;"><i class="fa mdi mdi-arrow-up-bold"></i></a>
    </div>
		<tiles:insertAttribute name="layout.footer" />
</body>
</html>

<%--Top버튼 --%>
<script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.Totop' ).fadeIn();
          } else {
            $( '.Totop' ).fadeOut();
          }
        } );
        $( '.Totop' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
    </script>

