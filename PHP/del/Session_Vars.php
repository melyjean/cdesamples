<?php

if (!isset($_SESSION['logged_in_at']))  {
    $_SESSION['logged_in_at'] = time();
} else if ((isset($_SESSION['logged_in_at']))  && ( time() - $_SESSION['logged_in_at'] > 3*60)) {
     $_SESSION['logged_in_at'] = time();
     unset ($_SESSION['utm_source']);
     unset ($_SESSION['utm_medium']);
     unset ($_SESSION['utm_campaign']);
     unset ($_SESSION['utm_term']);
     unset ($_SESSION['utm_content']);
     unset ($_SESSION['utm_referrer']);
     unset ($_SESSION['adgroup']);
     unset ($_SESSION['adcampaign']);
     unset ($_SESSION['referralurl']);
}

if ((!isset($_SESSION['utm_source'])) && isset($_GET['utm_source'])) {
  $_SESSION['utm_source'] = $_GET['utm_source'];
}

if ((!isset($_SESSION['utm_medium'])) && isset($_GET['utm_medium'])) {
  $_SESSION['utm_medium'] = $_GET['utm_medium'];
}

if ((!isset($_SESSION['utm_campaign'])) && isset($_GET['utm_campaign'])) {
  $_SESSION['utm_campaign'] = $_GET['utm_campaign'];
}

if ((!isset($_SESSION['utm_term'])) && isset($_GET['utm_term'])) {
  $_SESSION['utm_term'] = $_GET['utm_term'];
}

if ((!isset($_SESSION['utm_content'])) && isset($_GET['utm_content'])) {
  $_SESSION['utm_content'] = $_GET['utm_content'];
}

if ((!isset($_SESSION['utm_referrer'])) && isset($_GET['utm_referrer'])) {
  $_SESSION['utm_referrer'] = $_GET['utm_referrer'];
}

if ((!isset($_SESSION['adgroup'])) && isset($_GET['adgroup'])) {
  $_SESSION['adgroup'] = $_GET['adgroup'];
}

if ((!isset($_SESSION['adcampaign'])) && isset($_GET['adcampaign'])) {
  $_SESSION['adcampaign'] = $_GET['adcampaign'];
}

if (!isset($_SESSION['referralurl'])) {
  $svr_nm = $_SERVER['SERVER_NAME'];
  $rfrr = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
    if (strpos($rfrr, $svr_nm) === false){
        $_SESSION['referralurl'] = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_SCHEME) . '://' . parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST) . parse_url($_SERVER['HTTP_REFERER'], PHP_URL_PATH);
  }  else {
      $_SESSION['referralurl'] = '';
  }
}



?>