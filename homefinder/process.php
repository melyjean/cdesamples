<?php
// jSON URL which should be requested
$json_url = 'http://services.homefinder.com/listingServices/search';
 
 
 echo $json_url;
 echo '<P>';
$username = 'your_username';  // authentication
$password = 'your_password';  // authentication
 
// jSON String for request
$a = array('area' => 'Chicago%2C%20IL', 'dogsAllowed' => 'true', 'apikey' => 'qmst25d2nccpygxwxujj4fcy');

print_r ($a);
 echo '<P>';
$json_string = json_encode($a);
 
 
 echo $json_string ;
 echo '<P>';
  
// Initializing curl
$ch = curl_init( $json_url );
 echo $json_url;
 echo '<P>';
  
// Configuring curl options
$options = array(
CURLOPT_RETURNTRANSFER => true,
CURLOPT_POSTFIELDS => $a
);
print_r ($options );
 echo '<P>'; 

// Setting curl options
curl_setopt_array( $ch, $options );
 
// Getting results
$result =  curl_exec($ch); // Getting jSON result string
curl_close ($ch);
//var_dump(json_decode($result, true));
var_dump($result);


?>