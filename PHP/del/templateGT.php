<?php

/**
 * @file
 * This file is empty by default because the base theme chain (Alpha & Omega) provides
 * all the basic functionality. However, in case you wish to customize the output that Drupal
 * generates through Alpha & Omega this file is a good place to do so.
 * 
 * Alpha comes with a neat solution for keeping this file as clean as possible while the code
 * for your subtheme grows. Please read the README.txt in the /preprocess and /process subfolders
 * for more information on this topic.
 */

function georgetown_aggregator_block_item($variables) {
$item = $variables['item'];

$output = '<span class=title-post><a target="_blank" href="' . check_url($variables['item']->link) . '">' . check_plain($variables['item']->title) . "</a></span>" . '<span class=date-post>' .date('F j, Y', $item->timestamp) ."</span>\n";
 
  return $output;
}
function georgetown_form_alter(&$form, &$form_state, $form_id) 
{
   //only want form with nid 124 to submit externally 
   //Note that "webform_client_form_124" means modify the Webform form for the node with NID "124". Adjust to match whichever webform node's form you're modifying
   if(($form_id == 'webform_client_form_124')   || ($form_id == 'webform_client_form_125'))
       {
            $form['#submit'][] = 'georgetown_srp_w2l_rfi_webform_extra_submit';    
       }
   if (($form_id == 'webform_client_form_123') || ($form_id == 'webform_client_form_147'))
       {
            $form['#submit'][] = 'georgetown_srp_w2l_appointment_scheduler_webform_extra_submit';    
       }
}

// Adds a submit handler/function for the app signup form (Webform ID #124) 
function georgetown_srp_w2l_rfi_webform_extra_submit($form, &$form_state) {

    $options = array();
    // Array keys are matching the key that the remote site accepts. URL encoding will be taken care later.
    $options['data'] = array(
        'first_name' => $form_state['input']['submitted']['C_FirstName'],
        'last_name' => $form_state['input']['submitted']['C_LastName'],
        'state' => $form_state['input']['submitted']['C_State1'],
        'country' => $form_state['input']['submitted']['C_Country1'],
        'mobile' => $form_state['input']['submitted']['C_MobilePhone'],
        'email' => $form_state['input']['submitted']['EmailAddress'],
        '00N60000002aTW6' => $form_state['input']['submitted']['C_IM_Username'],
        '00N60000002aLU2' => $form_state['input']['submitted']['C_Inquiry_Rating1'],
        'recordType' => $form_state['input']['submitted']['C_Record_Type1'],
        '00N60000002aLTZ' => $form_state['input']['submitted']['C_Academic_Program__from_RFI_1'],
        '00N60000002aLU6' => $form_state['input']['submitted']['C_Is_SRP_Record1'],
        'company' => $form_state['input']['submitted']['C_Company1'],
        '00N60000002aLTY' => $form_state['input']['submitted']['C_Academic_Institution__from_RFI_1'],
        //'00N60000002aLTa' => 'Manhattan College',
        '00N60000002aTW5' => '',
        '00N60000002aNND' => $form_state['input']['submitted']['C_OK_to_Text_1'],
        '00N60000002aLU7' => $form_state['input']['submitted']['C_LP_UADCAMPAIGN1'],
        '00N60000002aLU8' => $form_state['input']['submitted']['C_LP_UADGROUP1'],
        '00N60000002aLUB' => $form_state['input']['submitted']['C_LP_UREF_MEDIATYPE1'],
        '00N60000002aLU9' => $form_state['input']['submitted']['C_LP_UREFKEYWORD1'],
        '00N60000002aLUA' => $form_state['input']['submitted']['C_LP_UREFPROMOTION1'],
        '00N60000002aLUC' => $form_state['input']['submitted']['C_LP_UREURL1'],
        '00N60000002aRvB' => $form_state['input']['submitted']['C_Campaign1'],
        '00N60000002aT6F' => $form_state['input']['submitted']['C_Source'],
        '00N32000003BNYe' => $form_state['input']['submitted']['C_Order_ID'],
        'oid' => '00D60000000JELK',
    );
    $options['data'] = http_build_query($options['data']);
    $options['method'] = 'POST';

    $url = 'https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8';

    // Put your additional headers here. Cookie can be set as well.
    $headers = array('Content-Type' => 'application/x-www-form-urlencoded');

    $options['headers'] = $headers;

    // Submits data to the remote server from the drupal server. User will remain in the Drupal form submission chain.
    $response = drupal_http_request($url, $options);

}

function georgetown_srp_w2l_appointment_scheduler_webform_extra_submit($form, &$form_state) {
    $options = array();
    // Array keys are matching the key that the remote site accepts. URL encoding will be taken care later.
    $options['data'] = array(
        '00N60000002aLUe' => $form_state['input']['submitted']['C_WebScheduler_Status1'],
        'first_name' => $form_state['input']['submitted']['C_FirstName'],
        'last_name' => $form_state['input']['submitted']['C_LastName'],
        'state' => $form_state['input']['submitted']['C_State1'],
        'country' => $form_state['input']['submitted']['C_Country1'],
        'mobile' => $form_state['input']['submitted']['C_Phone1'],
        'email' => $form_state['input']['submitted']['EmailAddress'],
        'lead_source'  => $form_state['input']['submitted']['C_InquirySource'],
        '00N60000002aTW6' => $form_state['input']['submitted']['C_IM_Username'],
        '00N60000002aLU2' => $form_state['input']['submitted']['C_Inquiry_Rating1'],
        'recordType' => $form_state['input']['submitted']['C_Record_Type1'],
        '00N60000002aLTZ' => $form_state['input']['submitted']['C_Academic_Program__from_RFI_1'],
        '00N60000002aLU6' => $form_state['input']['submitted']['C_Is_SRP_Record1'],
        'company' => $form_state['input']['submitted']['C_Company1'],
        '00N60000002aLTY' => $form_state['input']['submitted']['C_Academic_Institution__from_RFI_1'],
        '00N60000002aTW5' => '',
        '00N60000002aNND' => $form_state['input']['submitted']['C_OK_to_Text_1'],
        '00N60000002aLU7' => $form_state['input']['submitted']['C_LP_UADCAMPAIGN1'],
        '00N60000002aLU8' => $form_state['input']['submitted']['C_LP_UADGROUP1'],
        '00N60000002aLUB' => $form_state['input']['submitted']['C_LP_UREF_MEDIATYPE1'],
        '00N60000002aLU9' => $form_state['input']['submitted']['C_LP_UREFKEYWORD1'],
        '00N60000002aLUA' => $form_state['input']['submitted']['C_LP_UREFPROMOTION1'],
        '00N60000002aLUC' => $form_state['input']['submitted']['C_LP_UREURL1'],
        '00N60000002aRvB' => $form_state['input']['submitted']['C_Campaign1'],
        '00N60000002aT6F' => $form_state['input']['submitted']['C_Source'],
        '00N32000003BNYe' => $form_state['input']['submitted']['C_Order_ID'],
        '00N60000002aLUF' => $form_state['input']['submitted']['C_Inquiry_Source_ID1'],
        '00N60000002aLUi' => $form_state['input']['submitted']['C_Current_Web_Scheduled_Appointment1'],
        '00N60000002aLUf' => $form_state['input']['submitted']['C_WebScheduler_Email'],
        'oid' => '00D60000000JELK',
    );
    $options['data'] = http_build_query($options['data']);

    $options['method'] = 'POST';

    //$url = 'http://now.eloqua.com/e/f2';
    $url = 'https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8';
    //$url = 'http://s1700.t.eloqua.com/e/f2';

    // Put your additional headers here. Cookie can be set as well.
    $headers = array('Content-Type' => 'application/x-www-form-urlencoded');

    $options['headers'] = $headers;

    // Submits data to the remote server from the drupal server. User will remain in the Drupal form submission chain.
    $response = drupal_http_request($url, $options);

}


function gtn_srp_rfi_webform_extra_submit($form, &$form_state) {

    $options = array();
    // Array keys are matching the key that the remote site accepts. URL encoding will be taken care later.
    $options['data'] = array(
        'C_FirstName' => $form_state['input']['submitted']['C_FirstName'],
        'C_LastName' => $form_state['input']['submitted']['C_LastName'],
        'C_State1' => $form_state['input']['submitted']['C_State1'],
        'C_Country1' => $form_state['input']['submitted']['C_Country1'],
        'C_MobilePhone' => $form_state['input']['submitted']['C_MobilePhone'],
        'EmailAddress' => $form_state['input']['submitted']['EmailAddress'],
        'C_IM_Username' => $form_state['input']['submitted']['C_IM_Username'],
        'C_Inquiry_Rating1' => $form_state['input']['submitted']['C_Inquiry_Rating1'],
        'C_Record_Type1' => $form_state['input']['submitted']['C_Record_Type1'],
        'C_Academic_Program__from_RFI_1' => $form_state['input']['submitted']['C_Academic_Program__from_RFI_1'],
        'C_Is_SRP_Record1' => $form_state['input']['submitted']['C_Is_SRP_Record1'],
        'C_Company1' => $form_state['input']['submitted']['C_Company1'],
        'elqFormName' => $form_state['input']['submitted']['elqFormName'],
        'elqSiteID' => $form_state['input']['submitted']['elqSiteID'],
        'C_Academic_Institution1' => $form_state['input']['submitted']['C_Academic_Institution1'],
        'C_IM_Type' => $form_state['input']['submitted']['C_IM_Type'],
        'C_OK_to_Text_1' => $form_state['input']['submitted']['C_OK_to_Text_1'],
        'C_LP_UADCAMPAIGN1' => $form_state['input']['submitted']['C_LP_UADCAMPAIGN1'],
        'C_LP_UADGROUP1' => $form_state['input']['submitted']['C_LP_UADGROUP1'],
        'C_LP_UREF_MEDIATYPE1' => $form_state['input']['submitted']['C_LP_UREF_MEDIATYPE1'],
        'C_LP_UREFKEYWORD1' => $form_state['input']['submitted']['C_LP_UREFKEYWORD1'],
        'C_LP_UREFPROMOTION1' => $form_state['input']['submitted']['C_LP_UREFPROMOTION1'],
        'C_LP_UREURL1' => $form_state['input']['submitted']['C_LP_UREURL1'],
        'C_Campaign1' => $form_state['input']['submitted']['C_Campaign1'],
        'C_Source' => $form_state['input']['submitted']['C_Source'],
        'C_Order_ID' => $form_state['input']['submitted']['C_Order_ID'],
    );
    $options['data'] = http_build_query($options['data']);

    $options['method'] = 'POST';

    $url = 'http://now.eloqua.com/e/f2'; 

    // Put your additional headers here. Cookie can be set as well. 
    $headers = array('Content-Type' => 'application/x-www-form-urlencoded');

    $options['headers'] = $headers;

    // Submits data to the remote server from the drupal server. User will remain in the Drupal form submission chain.
    $response = drupal_http_request($url, $options);

}

function gtn_srp_appointment_scheduler_webform_extra_submit($form, &$form_state) {

    $options = array();
    // Array keys are matching the key that the remote site accepts. URL encoding will be taken care later.
    $options['data'] = array(
        'C_FirstName' => $form_state['input']['submitted']['C_FirstName'],
        'C_LastName' => $form_state['input']['submitted']['C_LastName'],
        'C_Phone1' => $form_state['input']['submitted']['C_Phone1'],
        'EmailAddress' => $form_state['input']['submitted']['EmailAddress'],
        'C_Inquiry_Rating1' => $form_state['input']['submitted']['C_Inquiry_Rating1'],
        'C_InquirySource' => $form_state['input']['submitted']['C_InquirySource'],
        'C_Inquiry_Source_ID1' => $form_state['input']['submitted']['C_Inquiry_Source_ID1'],
        'C_Record_Type1' => $form_state['input']['submitted']['C_Record_Type1'],
        'C_Academic_Program__from_RFI_1' => $form_state['input']['submitted']['C_Academic_Program__from_RFI_1'],
        'C_Is_SRP_Record1' => $form_state['input']['submitted']['C_Is_SRP_Record1'],
        'C_Company1' => $form_state['input']['submitted']['C_Company1'],
        'elqFormName' => $form_state['input']['submitted']['elqFormName'],
        'elqSiteID' => $form_state['input']['submitted']['elqSiteID'],
        'C_Campaign1' => $form_state['input']['submitted']['C_Campaign1'],
        'C_Source' => $form_state['input']['submitted']['C_Source'],
        'C_Current_Web_Scheduled_Appointment1' => $form_state['input']['submitted']['C_Current_Web_Scheduled_Appointment1'],
        'C_WebScheduler_Status1' => $form_state['input']['submitted']['C_WebScheduler_Status1'],
        'C_WebScheduler_Email' => $form_state['input']['submitted']['C_WebScheduler_Email'],
        'C_Country1' => $form_state['input']['submitted']['C_Country1'],
        'C_Academic_Institution__from_RFI_1' => $form_state['input']['submitted']['C_Academic_Institution__from_RFI_1'],
    );
    $options['data'] = http_build_query($options['data']);

    $options['method'] = 'POST';

    $url = 'http://now.eloqua.com/e/f2'; 
    //$url = 'http://s1700.t.eloqua.com/e/f2'; 

    // Put your additional headers here. Cookie can be set as well. 
    $headers = array('Content-Type' => 'application/x-www-form-urlencoded');

    $options['headers'] = $headers;

    // Submits data to the remote server from the drupal server. User will remain in the Drupal form submission chain.
    $response = drupal_http_request($url, $options);

}

function georgetown_preprocess_html(&$variables) {

 if ($node = menu_get_object()) {
  if ($node && $node->nid) {
    $variables['theme_hook_suggestions'][] = 'html__' . $node->type;
  }

 }
  /*drupal_add_js(drupal_get_path('theme', 'MYTHEME') . '/js/ff.js', array(
    'scope' => 'header',
    'weight' => '0'
  ));*/

} 

function georgetown_preprocess_page(&$variables) {
  // This disables message-printing on ALL page displays
  if($node = menu_get_object()) {
    if($node->type == "mobile_landing_page") {
      $variables['show_messages'] = FALSE;
    }
  }
}

function georgetown_preprocess_node(&$vars) {
	if ($vars['type'] == 'mobile_landing_page') {
	    drupal_add_css(drupal_get_path('theme', 'boston') . "/css/styles.css");
      $vars['messages'] = theme('status_messages');
	 }
}
  


