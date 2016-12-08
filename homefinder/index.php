<html>
<head><title>HomeFinder Test</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
 <script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.20/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="homefinder.css" type="text/css" media="all" /> 
 	<!--
 	//script src="../../ui/jquery.ui.position.js"></script
	//script src="../../ui/jquery.ui.autocomplete.js"></script
//script type="text/javascript">
  //$(document).ready(function() {
    // This is more like it!
  //});
//script
-->
	<script>
	$(function() {
		$( "#area" ).autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "http://ws.geonames.org/searchJSON",
					dataType: "jsonp",
					data: {
						featureClass: "P",
						country: "US",
						style: "full",
						maxRows: 50,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data.geonames, function( item ) {
							return {
								label: item.name + (item.adminName1 ? ", " + item.adminName1 : ""),
								value: item.name + (item.adminName1 ? ", " + item.adminName1 : "") 
							}
						}));
					}
				});
			},
			minLength: 2,
			open: function() {
				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
	
		});	
	});
	/**  function customizeDisplay(frmElement) {
		if (frmElement.type == "select") {
			switch(frmElement.name) {
				case 1:
				execute code block 1
				break;
				case 2:
				execute code block 2
				break;
				default:
				code to be executed if n is different from case 1 and 2
			}
		}
	}  **/
	</script>
</head>
<body>
<form action="simpleprocess.php" method="post">
	<div class="outterdiv">
<div class="demo">

<script type="text/javascript">
 if (navigator.appName == "Microsoft Internet Explorer") {
 	document.write("Please enter the full name for the city and state:\n");
 }
</script>
<div class='ui-widget'>
	<input id="area" name="area" placeholder="Please enter the full name for the city and state:"/>
	Powered by <a href="http://geonames.org">geonames.org</a><p>
	<select id="propertyType" name="propertyType" onChange=onchange="customizeDisplay(this)">
	    <option value="">--Select a property type--</option>
		<option value="buildingLot">buildingLot</option>
		<option value="commercial">commercial</option>
		<option value="condo">condo</option>
		<option value="coOp">coOp</option>
		<option value="duplex">duplex</option>
		<option value="farm">farm</option>
		<option value="houseboat">houseboat</option>
		<option value="mobileHome">mobileHome</option>
		<option value="multiFamilyHome">multiFamilyHome</option>
		<option value="patioHome">patioHome</option>
		<option value="rawLand">rawLand</option>
		<option value="rowHouse">rowHouse</option>
		<option value="singleFamilyHome">singleFamilyHome</option>
		<option value="townhouse">townhouse</option>
	</select><p>
</div>
	<div id="residential">
    	<select id="bed" name="bed">
	        <option value="">--No. of bedrooms--</option>
    	    	<option value="1">1</option>
        	<option value="2">2</option>
	        <option value="3">3</option>
    	    	<option value="4">4</option>
        	<option value="5">5</option>
	        <option value="6">6</option>
		</select><p>
	<select id="bath" name="bath">
    	    	<option value="">--No. of bathrooms--</option>
        	<option value="1">1</option>
	        <option value="2">2</option>
    	    	<option value="3">3</option>
        	<option value="4">4</option>
	        <option value="5">5</option>
    	    	<option value="6">6</option>
	</select><p>
	</div>
	    <select name="price">
	    <option value="">Select a price range</option>
        <option value="* TO 50000">under $50,000</option>
        <option value="50000 TO 100000">$50,000 TO $100,000</option>
        <option value="100000 TO 150000">$10,0000 TO $150,000</option>
        <option value="150000 TO 250000">$150,000 TO $25,000</option>
        <option value="250000 TO 350000">$250,000 TO $350,000</option>
        <option value="350000 TO 500000">$350,000 TO $500,000</option>
        <option value="500000 TO 1000000">$500,000 TO $1,000,000</option>
        <option value="1000000 TO *">over $,1000,000</option>
	</select><p>
	<select name="squareFootage">
	<option value="">Select a min sq. footage </option>
        <option value="* To 500">500</option>
        <option value="* To 1500">1500</option>
        <option value="* To 2000">2000</option>
        <option value="* To 3000">3000</option>
        <option value="* To 5000">5000</option>
        <option value="* To 7000">7000</option>
        <option value="* To 8000">8000</option>
        <option value="* To 10000">10000</option>
	</select><p>
<?php 
$count =0;
$booleanVals = array('areCatsAllowed' => 'Cats Allowed', 'areDogsAllowed' => 'Dogs Allowed', 'hasBasement' => 'Basement', 'hasBrickExterior' => 'Brick Exterior', 'hasCentralAir' => 'Central Air', 'hasDiningRoom' => 'Dining Room', 'hasFamilyRoom' => 'Family Room', 'hasFireplace' => 'Fireplace', 'hasGarage' => 'Garage', 'hasGasHeat' => 'Gas Heat', 'hasOpenHouse' => 'Open House', 'hasSwimmingPool' => 'Swimming Pool', 'isBeachProperty' => 'Beach Property', 'isEcoFriendly' => 'Eco Friendly', 'isFeatured' => 'Featured', 'isGatedCommunity' => 'Gated Community', 'isGolfCommunity' => 'Golf Community', 'isHorseProperty' => 'Horse Property', 'isWaterfrontProperty' => 'Waterfront Property', 'isWheelchairAccessible' => 'Wheelchair Accessible', 'isActiveAdultCommunity' => 'Active Adult Community', 'isAssistedLivingCommunity' => 'Assisted Living Community','isMaintenanceFreeCommunity' => 'Maintenance Free Community', 'isResidentialCommunity' => 'Residential Community' );


$tabs = array('2' => 'New Construction','3' => 'Agent & Broker Listings','4' => 'Owner & Newspaper Classifieds','5' => 'Foreclosures');
$tabDisplay = '<ul class="choices"><li class="choices"><input type="radio" name="tab" value="1" />All Homes</ul><ul class="choices">';
/**
foreach ($booleanVals as $key => $value) {
            if (($count % 5) == 0) {
                 $booleanDisplay .= '<ul>';
            }
            $booleanDisplay .= '<li><input type="checkbox" name="' . $key. '" value="1" />' . $value;
            if (($count % 5) == 4) {
                 $booleanDisplay .= '</ul>';
            }
            $count+=1;
        }
	if (($count % 5) != 4) {
                 $booleanDisplay .= '</ul>';
        }
**/
foreach ($booleanVals as $key => $value) {
            if (($count % 5) == 0) {
                 $booleanDisplay .= '<div class="utr">';
            }
            $booleanDisplay .= '<div class="inr"><input type="checkbox" name="' . $key. '" value="true" />' . $value . '</div>';
            if (($count % 5) == 4) {
                 $booleanDisplay .= '</div>';
            }
            $count+=1;
        }
	if (($count % 5) != 4) {
                 $booleanDisplay .= '</div>';
        }

foreach ($tabs as $key => $value)
        {
            $tabDisplay .= '<li class="choices"><input type="radio" name="tab" value="' . $key . '" /> '. $value;
        }
   
$tabDisplay .= '</ul>';
print $tabDisplay;
print $booleanDisplay;
?>
</div><!-- End demo -->


		<input type=submit>
		<div></div>

</form>




	</div>  <!-- end outterdiv -->
</body>
</html>