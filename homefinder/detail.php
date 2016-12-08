<html>
<head><title>HomeFinder Test</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
 <script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.20/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="homefinder.css" type="text/css" media="all" /> 

</head>
<body>
<div class="outterdiv">
<?php

$address = '';

/**
 * Initialize the cURL session
 */
 $ch = curl_init();


foreach($_GET as $name => $value) {
  $encoded .= urlencode($name).'='.urlencode($value).'&';
}


// set URL and other appropriate options
$options = array(CURLOPT_URL => 'http://services.homefinder.com/listingServices/details?' . $encoded . 'apikey=qmst25d2nccpygxwxujj4fcy',
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
  	if ($parsetheobject['status']->code == '200') {


 
  			$aListing = $parsetheobject['data']->listing;
			print '<div class="singleListingRow">';
			print '<h1>' . $aListing->address->line1 . '</h1><p>';
   			print '</div>';  			  			
  			print '<div class="singleListingRow">';
				if ($aListing->primaryPhoto->url) { print '<img src="' . $aListing->primaryPhoto->urlLarge . '" border="0"></a>';}   			 
			if ($aListing->price) { print '$' . $aListing->price;	}
			if ($aListing->type) { print '<br>' . $aListing->type;}
  			if ($aListing->bed) { print ' <br>Bed:' . $aListing->bed;}
  			if ($aListing->bath->total) { print '<br>Bath:' . $aListing->bath->total;}
  			 if ($aListing->description) { print '<p>' . substr($aListing->description,0,250) . '...';}
   			print '</div>';  		
  			
  			 			
  			print '<div class="singleListingRow">';

   			if ($aListing->photos) {
   				foreach ($aListing->photos as $key => $value) {
   					print '<img  class="sml" src="' . $value->url . '" border="0">';
   				}
   			}
  			print '</div>';   			
   			print '<div class="singleListingRow">';;

 			if ($aListing->agent->name) {	print '<a href="' . $aListing->agent->listingsUrl . '">' . $aListing->agent->name . '</a>';}
  			if ($aListing->agent->email) {	print '<br>e-mail: ' . $aListing->agent->email; }
  			if ($aListing->agent->phone) {	print '<br>phone : ' . $aListing->agent->phone; }  			


  			if ($aListing->broker->logoUrl ) {print ' <a href="' . $aListing->broker->listingsUrl . '"><img src="' . $aListing->broker->logoUrl . '" border="0"></a>';}
 
  			print '</div>';  
  			print '<hr>';			 						


 		
  	        print '<P>';
  	        
	} else {
  		//print $parsetheobject['status']->code;
		print $parsetheobject['status']->errorStack['0']->message;
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