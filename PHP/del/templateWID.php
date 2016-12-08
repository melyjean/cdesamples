<?php


function widener_form_alter(&$form, &$form_state, $form_id) {
  if ($form_id == 'search_block_form') {
    $form['search_block_form']['#default_value'] = t('Search'); // Set a default value for the textfield
    $form['search_block_form']['#attributes']['onblur'] = "if (this.value == '') {this.value = 'Search';}";
    $form['search_block_form']['#attributes']['onfocus'] = "if (this.value == 'Search') {this.value = '';}";
    // Prevent user from searching the default text
    $form['#attributes']['onsubmit'] = "if(this.search_block_form.value=='Search'){ alert('Please enter a search value'); return false; }";
  }
  if ($form_id == 'custom_search_blocks_form_1') {
    $form['custom_search_blocks_form_1']['#default_value'] = t('Search'); // Set a default value for the textfield
    $form['custom_search_blocks_form_1']['#attributes']['onblur'] = "if (this.value == '') {this.value = 'Search';}";
    $form['custom_search_blocks_form_1']['#attributes']['onfocus'] = "if (this.value == 'Search') {this.value = '';}";
    // Prevent user from searching the default text
    $form['#attributes']['onsubmit'] = "if(this.custom_search_blocks_form_1.value=='Search'){ alert('Please enter a search value'); return false; }";
  }
     if($form_id == 'webform_client_form_7')
         {
              $form['#submit'][] = 'widener_srp_w2l_rfi_webform_extra_submit';
         }
}
function widener_breadcrumb($variables) {
  $sep = ' > ';
  if (count($variables['breadcrumb']) > 0) {
    return implode($sep, $variables['breadcrumb']) . $sep . drupal_get_title();
  }
  else {
    return t("Home");
  }
}


function widener_srp_w2l_rfi_webform_extra_submit($form, &$form_state) {

    $options = array();
    // Array keys are matching the key that the remote site accepts. URL encoding will be taken care later.
    $options['data'] = array(
        'first_name' => $form_state['input']['submitted']['C_FirstName'],
        'last_name' => $form_state['input']['submitted']['C_LastName'],
        'state' => $form_state['input']['submitted']['C_State1'],
        'country' => $form_state['input']['submitted']['C_Country1'],
        'mobile' => $form_state['input']['submitted']['C_MobilePhone'],
        'email' => $form_state['input']['submitted']['EmailAddress'],
        'zip' => $form_state['input']['submitted']['zip'],
        '00N60000002aLU2' => $form_state['input']['submitted']['C_Inquiry_Rating1'],
        'recordType' => $form_state['input']['submitted']['C_Record_Type1'],
        '00N60000002aLTZ' => $form_state['input']['submitted']['C_Academic_Program__from_RFI_1'],
        '00N60000002aLU6' => $form_state['input']['submitted']['C_Is_SRP_Record1'],
        'company' => $form_state['input']['submitted']['C_Company1'],
        '00N60000002aLTY' => $form_state['input']['submitted']['C_Academic_Institution1'],
        '00N60000002aNND' => $form_state['input']['submitted']['C_OK_to_Text_1'],
        '00N60000002aLU7' => $form_state['input']['submitted']['C_LP_UADCAMPAIGN1'],
        '00N60000002aLU8' => $form_state['input']['submitted']['C_LP_UADGROUP1'],
        '00N60000002aLUB' => $form_state['input']['submitted']['C_LP_UREF_MEDIATYPE1'],
        '00N60000002aLU9' => $form_state['input']['submitted']['C_LP_UREFKEYWORD1'],
        '00N60000002aLUA' => $form_state['input']['submitted']['C_LP_UREFPROMOTION1'],
        '00N60000002aLUC' => $form_state['input']['submitted']['C_LP_UREURL1'],
        '00N60000002aRvB' => $form_state['input']['submitted']['C_Campaign1'],
        '00N60000002aT6F' => $form_state['input']['submitted']['C_Source'],
        '00N60000002aLU0' => $form_state['input']['submitted']['C_How_Heard1'],
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

