<script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="css/panel.css" type="text/css"/>
<script src ="js/bvl_feedback_panel.js"></script>
<link rel="stylesheet" href="css/jasny-bootstrap-all.css" type="text/css" />
<meta itemprop="candID" context="{$candID}">
<meta itemprop="sessionID" context="{$sessionID}">
<meta itemprop="commentID" context="{$commentID}">
<script src="/js/react-with-addons-0.13.3.js"></script>
<script src="https://fb.me/JSXTransformer-0.13.3.js"></script>



<!-- <div class ="ui-responsive-panel" data-role="panel" id="right-panel" data-position-fixed="true" data-display="push" data-position="div"> -->
<body>
<div class ="panel-wrapper" id="bvl_feedback_menu">
  {*<right class="navmenu navmenu-default navmenu-fixed-right offcanvas" id="bvl_feedback_menu">*}
  {*<div class="navbar"> <a style="color: white" href="main.php?test_name=candidate_list" id="candID"" name ="{$candID}">CANDID: {$candID}</a> - PSCID: {$PSCID}</div>*}
  {*<div class="breadcrumb-panel"><a style="color: white" href="main.php?test_name=candidate_list" id="candID"" name ="{$candID}">CANDID: {$candID}</a> - PSCID: {$PSCID}</div>*}
  {*<div id="accordion">*}

  {*</div><!-- accordion -->*}

  {*<div class="panel-group" id="accordion">*}
  {*<div class="panel panel-default" id="panel1">*}
  {*<div class="panel-heading">*}
  {*<h4 class="panel-title">*}
  {*<a data-toggle="collapse" data-target="#collapseOne"*}
  {*href="#collapseOne">*}
  {*Candidate Overview*}
  {*</a>*}
  {*</h4>*}

  {*</div>*}
  {*<div id="collapseOne" class="panel-collapse collapse in">*}
  {*<div class="panel-body">*}
  {*<table class = "table table-hover table-primary table-bordered dynamictable">*}
  {*<thead>*}
  {*<tr class = "info">*}
  {*<th nowrap="nowrap">QC Class</th>*}
  {*{if $sessionID!=""}*}
  {*<th nowrap="nowrap">Instrument</th>*}
  {*{else}*}
  {*<th nowrap="nowrap">Visit</th>*}
  {*{/if}*}
  {*<th nowrap="nowrap"># Threads</th>*}
  {*</tr>*}
  {*</thead>*}
  {*{section name=record loop=$thread_summary_data}*}
  {*<tr>*}
  {*<td nowrap="nowrap">{$thread_summary_data[record].QC_Class}</td>*}
  {*{if $sessionID!=""}*}
  {*<td nowrap="nowrap">*}
  {*{if $thread_summary_data[record].CommentID != $commentID}*}
  {*<a target="GUI" href="main.php?test_name={$thread_summary_data[record].Instrument}&candID={$candID}&sessionID={$sessionID}&commentID={$thread_summary_data[record].CommentID}">*}
  {*{/if}*}
  {*{$thread_summary_data[record].Instrument}</a></td>*}
  {*{else}*}
  {*<td nowrap="nowrap"><a target="GUI" href="main.php?test_name=instrument_list&candID={$candID}&sessionID={$thread_summary_data[record].SessionID}">{$thread_summary_data[record].Visit}</a></td>*}
  {*{/if}*}
  {*<td nowrap="nowrap">{$thread_summary_data[record].No_Threads}</td>*}
  {*</tr>*}
  {*{sectionelse}*}
  {*<tr><td colspan="7">No feedback</td></tr>*}
  {*{/section}*}
  {*</table>*}
  {*</div>*}
  {*</div>*}
  {*</div>*}

  {*<div class="panel panel-default" id="panel3">*}
  {*<div class="panel-heading">*}
  {*<h4 class="panel-title">*}
  {*<a data-toggle="collapse" data-target="#collapseThree"*}
  {*href="#collapseThree" class="collapsed">*}
  {*Create a new {$feedback_level} level thread*}
  {*</a>*}
  {*</h4>*}

  {*</div>*}
  {*<div id="collapseThree" class="panel-collapse collapse in">*}
  {*<div class="panel-body">*}
  {*<div id ="new_feedback">*}
  {*<textarea class="form-control" rows="3" id="comment"></textarea>*}
  {*<select name = "input_type">*}
  {*{foreach from=$feedback_types item=value}*}
  {*<option value = "{$value['Type']}">{$value['Name']}</option>*}
  {*{/foreach}*}
  {*</select>*}
  {*{if $FieldNames}*}
  {*{html_options name="fieldname" values=$FieldNames selected=$new_thread_data[$newTypeCounter].FieldNameValue options=$FieldNames}*}
  {*{/if}*}
  {*<button id="save_data">Save data</button>*}

  {*</div>*}
  {*</div>*}
  {*</div>*}
  {*</div>*}

  {*<div class="panel panel-default" id="panel2">*}
  {*<div class="panel-heading">*}
  {*<h4 class="panel-title">*}
  {*<a data-toggle="collapse" data-target="#collapseTwo"*}
  {*href="#collapseTwo" class="collapsed">*}
  {*View {$feedback_level} threads*}
  {*</a>*}
  {*</h4>*}

  {*</div>*}
  {*<div id="collapseTwo" class="panel-collapse collapse in">*}
  {*<div class="panel-body">*}

  {*<table id="current_thread_table" class ="table table-hover table-primary table-bordered dynamictable">*}
  {*<thead id ="current_thread_table_header">*}

  {*<tr class="info">*}
  {*<td>ID</td>*}
  {*<td>Date</td>*}
  {*<td>Author</td>*}
  {*{if $feedback_level == "instrument"}*}
  {*<td>Field</td>*}
  {*{/if}*}

  {*</thead>*}
  {*{if $thread_list}*}
  {*{foreach from=$thread_list item=value}*}
  {*<tbody id="{$value.FeedbackID}" name="entries">*}
  {*<tr>*}
  {*<td>{$value.FeedbackID}<span id="comment_icon_{$value.FeedbackID}" class="glyphicon glyphicon-pencil" name="comment_icon"></span></td>*}
  {*<td>{$value.Date}</td>*}
  {*<td>{$value.User}</td>*}
  {*{if $feedback_level == "instrument"}*}
  {*<td>{$value.FieldName}</td>*}
  {*{/if}*}
  {*<td name = "action_bar">*}
  {*<div class="btn-group">*}
  {*{if $value.QC_status == 'opened'}*}
  {*<button name ="thread_button" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">*}
  {*Opened <span class="caret"></span>*}
  {*</button>*}
  {*<ul class="dropdown-menu">*}
  {*<li><a id="close_thread_{$value.FeedbackID}">Close</a></li>*}
  {*</ul>*}
  {*{/if}*}
  {*{if $value.QC_status == 'closed'}*}
  {*<button name="thread_button" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">*}
  {*Closed <span class="caret"></span>*}
  {*</button>*}
  {*<ul class="dropdown-menu">*}
  {*<li><a id="open_thread_{$value.FeedbackID}">Re-Open</a></li>*}
  {*</ul>*}
  {*{/if}*}

  {*</div>*}
  {*<div class = "bvl_table_icons" name="bvl_table_icons">*}
  {*<span class="glyphicon glyphicon-chevron-right" id="toggle_entries_{$value.FeedbackID}"></span>*}
  {*<span id="comment_icon_{$value.FeedbackID}" class="glyphicon glyphicon-pencil" name="comment_icon"></span>*}
  {*<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="FeedbackID: {$value.FeedbackID} Type: {$value.Type}"></span></div>*}
  {*</td>*}
  {*</tr>*}
  {*</tbody>*}

  {*{/foreach}*}
  {*{else}*}
  {*No current {$feedback_level} level threads*}
  {*{/if}*}
  {*</table>*}


  {*</div>*}
  {*</div>*}
  {*</div>*}
  {*</div>*}

  <div id ="subby">

  </div>

</div><!-- /panel -->
</body>

<script type="text/jsx" src="js/jsx/behavioural_feedback_panel.jsx"></script>

<script type="text/jsx">

{*var feedback_level = {$feedback_level|@json_encode};*}
{*feedback_level = JSON.parse(feedback_level);*}

var feedback_level = {$feedback_level|@json_encode};
var candID = {$candID|@json_encode};
var PSCID = {$pscid|@json_encode};
var sessionID = {$sessionID|@json_encode};
var commentID = {$commentID|@json_encode};
var select_option = {$FieldNames};
var feedback_types = {$feedback_types|@json_encode}

var bvl_panel = BehaviouralFeedbackPanel({
	feedback_level : feedback_level,
	candID : candID,
	pscid: PSCID,
	sessionID : sessionID,
	commentID : commentID,
  select_options: select_option,
  feedback_types: feedback_types
});

React.render(bvl_panel, document.getElementById("subby"));
</script>
