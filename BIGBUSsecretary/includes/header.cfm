<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>U-46 Enrollment</title>

<link rel="stylesheet" type="text/css" href="css/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="css/style_v1.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/printforms.css" media="print">
<link href="css/english.css" rel="stylesheet" type="text/css" title="english">
<link href="css/spanish.css" rel="alternate stylesheet" type="text/css" title="spanish">
<link href="css/bilingual.css" rel="alternate stylesheet" type="text/css" title="bilingual">

<script type="text/javascript" src="scripts/styleswitcher.js"></script>
<script type="text/javascript" src="scripts/tabcontent.js"></script>

<script language="JavaScript1.2">

//Highlight form element- © Dynamic Drive (www.dynamicdrive.com)
//For full source code, 100's more DHTML scripts, and TOS,
//visit http://www.dynamicdrive.com

var highlightcolor="#C4FFAA"

var ns6=document.getElementById&&!document.all
var previous=''
var eventobj

//Regular expression to highlight only form elements
var intended=/INPUT|TEXTAREA|SELECT|OPTION/

//Function to check whether element clicked is form element
function checkel(which){
if (which.style&&intended.test(which.tagName)){
if (ns6&&eventobj.nodeType==3)
eventobj=eventobj.parentNode.parentNode
return true
}
else
return false
}

//Function to highlight form element
function highlight(e){
eventobj=ns6? e.target : event.srcElement
if (previous!=''){
if (checkel(previous))
previous.style.backgroundColor=''
previous=eventobj
if (checkel(eventobj))
eventobj.style.backgroundColor=highlightcolor
}
else{
if (checkel(eventobj))
eventobj.style.backgroundColor=highlightcolor
previous=eventobj
}
}

</script>

</head>