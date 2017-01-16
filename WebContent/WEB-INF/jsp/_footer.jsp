<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/jquery.form.min.js"></script>
<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

<script src="lib/handlebars.js"></script>
<!--引入CSS-->
<link rel="stylesheet" type="text/css"
	href="lib/webuploader/0.1.5/webuploader.css">

<!--引入JS-->
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.js"></script>

<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/message.js"></script>
<script type="text/javascript" src="lib/snd.js"></script>

<script type="text/javascript">
//for default dataTable format 
var table = $('.table-sort').DataTable({
	"bSort": false, // not sorting
	"language": {
	    "decimal":        "",
	    "emptyTable":     "No data available in table",
	    "info":           "Showing _START_ to _END_ of _TOTAL_ entries",
	    "infoEmpty":      "Showing 0 to 0 of 0 entries",
	    "infoFiltered":   "(filtered from _MAX_ total entries)",
	    "infoPostFix":    "",
	    "thousands":      ",",
	    "lengthMenu":     "Show _MENU_ entries",
	    "loadingRecords": "Loading...",
	    "processing":     "Processing...",
	    "search":         "Search: ",
	    "zeroRecords":    "No matching records found",
	    "paginate": {
	        "first":      "First",
	        "last":       "Last",
	        "next":       "Next",
	        "previous":   "Previous"
	    },
	    "aria": {
	        "sortAscending":  ": activate to sort column ascending",
	        "sortDescending": ": activate to sort column descending"
	    }
	}
});
	
</script>

<!--/_footer /作为公共模版分离出去-->
