<html>
<head><title>HomeFinder Test</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
 <script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.20/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="homefinder.css" type="text/css" media="all" /> 
<script type="text/javascript">
function submitPrevForm()
{
  document.prev.submit();
}
function submitNextForm()
{
  document.next.submit();
}
</script>
</head>
<body>
<div class="outterdiv">
<?php

$address = '';
$submitForm = '';
$submitFormPrev = '<form name="prev" action="simpleprocess.php" method="post">';
$submitFormNext = '<form name="next" action="simpleprocess.php" method="post">';
/**
 * Initialize the cURL session
 */
 $ch = curl_init();


foreach($_POST as $name => $value) {
  $encoded .= urlencode($name).'='.urlencode($value).'&';
}


// set URL and other appropriate options
$options = array(CURLOPT_URL => 'http://services.homefinder.com/listingServices/search?' . $encoded . 'apikey=qmst25d2nccpygxwxujj4fcy',
                 CURLOPT_RETURNTRANSFER => 1
                );

curl_setopt_array($ch, $options);


 /**
 * Execute the cURL session
 */
 $contents = curl_exec ($ch);

if($contents === false)
{
    echo 'Curl error: ' . curl_error($ch);
    die ('<br> Write this to a log file');
}



if (json_decode($contents) === false) {
        //all of these would actually written to some sort of error logging 
	echo 'decoding error: ';
	switch (json_last_error()) {
        	case JSON_ERROR_NONE:
           	 	echo ' - No errors';
       	 		break;
        	case JSON_ERROR_DEPTH:
            		echo ' - Maximum stack depth exceeded';
        		break;
        	case JSON_ERROR_STATE_MISMATCH:
            		echo ' - Underflow or the modes mismatch';
        		break;
        	case JSON_ERROR_CTRL_CHAR:
            		echo ' - Unexpected control character found';
        		break;
        	case JSON_ERROR_SYNTAX:
            		echo ' - Syntax error, malformed JSON';
        		break;
        	case JSON_ERROR_UTF8:
            		echo ' - Malformed UTF-8 characters, possibly incorrectly encoded';
        		break;
        	default:
            		echo ' - Unknown error';
        		break;
    	}
} else if (is_null(get_object_vars(json_decode($contents)))) {
  echo "some kind of error";
} else {
  $parsetheobject = get_object_vars(json_decode($contents));
  //print '<!--';
//var_dump($parsetheobject);
//print '-->';
  	if ($parsetheobject['status']->code == '200') {

  		foreach ($parsetheobject['data']->listings as $key => $value) {
  			//print "<br>number: " . $key . '<br>';
  			$aListing = $value;
			print '<div class="singleListingRow">';
			print '<h3><a href="detail.php?id=' . $aListing->id . '">' . $aListing->address->line1 . '</a></h3>';
   			print '</div>';  			  			
  			print '<div class="singleListingRow">';
				if ($aListing->primaryPhoto->url) { print '<img src="' . $aListing->primaryPhoto->url . '" border="0"></a>';}   			 
			if ($aListing->price) { print '$' . $aListing->price;	}
			if ($aListing->type) { print '<br>' . $aListing->type;}
  			if ($aListing->bed) { print '&nbsp;&nbsp;&nbsp;Bed:' . $aListing->bed;}
  			if ($aListing->bath->total) { print '&nbsp;&nbsp;&nbsp;Bath:' . $aListing->bath->total;}
  			 if ($aListing->description) { print '<p>' . substr($aListing->description,0,250) . '...';}
   			print '</div>';  		
  			
  			 			
  			print '<div class="singleListingRow">';
   			print '<div class="floatleft">';
  			print '</div>';   			
   			print '<div class="floatright">';

 			if ($aListing->agent->name) {	print '<a href="' . $aListing->agent->listingsUrl . '">' . $aListing->agent->name . '</a>';}
  			if ($aListing->agent->email) {	print '<br>e-mail: ' . $aListing->agent->email; }
  			if ($aListing->agent->phone) {	print '<br>phone : ' . $aListing->agent->phone; }  			


  			if ($aListing->broker->logoUrl ) {print ' <a href="' . $aListing->broker->listingsUrl . '"><img src="' . $aListing->broker->logoUrl . '" border="0"></a>';}
  			print '</div>'; 
  			print '</div>';  
  			print '<hr>';			 						
    		}
  		
  	        print '<P>';
  	        foreach($_POST as $name => $value) {
  			$submitForm .= '<input type="hidden" name="' . $name .'" value="' . $value .'">';
  			$submitForm .= '<input type="hidden" name="' . $name .'" value="' . $value .'">';  			
		}
		if (($parsetheobject['data']->meta->currentPage) && ($parsetheobject['data']->meta->currentPage > 1)){
			print $submitFormPrev . $submitForm . '<input type="hidden" name="page" value="' . ($parsetheobject['data']->meta->currentPage - 1) . '"></form><a href="javascript: submitPrevForm()"> << Previous </a>';
		}
		
		if (($parsetheobject['data']->meta->currentPage) && ($parsetheobject['data']->meta->totalPages) && ($parsetheobject['data']->meta->currentPage) != ($parsetheobject['data']->meta->totalPages)) {
			print $submitFormNext . $submitForm . '<input type="hidden" name="page" value="' . ($parsetheobject['data']->meta->currentPage + 1) . '"></form><a href="javascript: submitNextForm()"> Next >> </a>';
		}
	} else {
  		//print $parsetheobject['status']->code;
		if ($parsetheobject['status']->code == '606') {
			print 'No results found<P>';
		} else {
			print $parsetheobject['status']->errorStack['0']->message;
		}
	}
	print '&nbsp;&nbsp;&nbsp;&nbsp;<a href="/homefinder">Try a new search </a>';
}



 /**
 * Close cURL session
 */
 curl_close ($ch);
 ?>
 </div>
 </body>
 </html>