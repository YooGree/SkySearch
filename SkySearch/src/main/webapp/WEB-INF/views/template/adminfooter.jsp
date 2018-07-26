<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

 

<!-- JavaScript -->
    <link type='text/css' href="<c:url value='/resources/assets/css/google_font.css'/>" rel="stylesheet"/>
      
    <!-- <script type="text/javascript" src="<c:url value='/resources/assets/js/html5shiv.min'/>"> </script> -->
    
    <script type="text/javascript" src="<c:url value='/resources/assets/js//popper.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/plugins.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/main.js'/>"></script>


    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/chart-js/Chart.bundle.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/dashboard.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/vector-map/jquery.vmap.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/vector-map/jquery.vmap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/vector-map/jquery.vmap.sampledata.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/vector-map/country/jquery.vmap.world.js'/>"></script>
    
    <!-- data-table -->
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js?ver=1'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/dataTables.buttons.min.js?ver=1'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/buttons.bootstrap.min.js?ver=1'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/buttons.colVis.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/assets/js/lib/data-table/datatables-init.js'/>"></script>
  
  
 

   <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
  
    <script type="text/javascript">

function add_div(){

    var div = document.createElement('div');



    div.innerHTML = document.getElementById('room_type').innerHTML;

    document.getElementById('field').appendChild(div);

}



function remove_div(obj){

document.getElementById('field').removeChild(obj.parentNode);

}

</script>



      
      
      
      
 