<?php


function google_appliance_advancedform_validate($form, &$form_state) {
    $year_of_birth = $form_state['values']['year_of_birth'];
//    $orgq =$form_state['values']['q'];
    $as_q =$form_state['values']['as_q'];
    $as_epq =$form_state['values']['as_epq'];
    $as_oq =$form_state['values']['as_oq'];
    $as_eq =$form_state['values']['as_eq'];

    $first_name = $form_state['values']['first'];
    $last_name = $form_state['values']['last'];
    if ((!$as_q) && (!$as_epq) && (!$as_oq) && (!$as_eq) ) {
        form_set_error('as_q', 'Please enter a search term.');
    }
    if ($year_of_birth && ($year_of_birth < 1900 || $year_of_birth > 2000)) {
        form_set_error('year_of_birth', 'Enter a year between 1900 and 2000.');
    }
        $gglsrch_chk_start = $form_state['values']['dte_start'];
        $gglsrch_chk_end = $form_state['values']['dte_end'];
    if ((trim($form_state['values']['dte_start']) != '') &&  (trim($form_state['values']['dte_end']) != '')) {
            if (trim($form_state['values']['dte_start']) != '') {
                $start_date_array = explode('/', trim($form_state['values']['dte_start']));
                if (count($start_date_array) > 2 )
                $strt = $start_date_array[2] . '-' . $start_date_array[0] . '-' . $start_date_array[1];
            }
            if (trim($form_state['values']['dte_end']) != '') {
                $end_date_array = explode('/', trim($form_state['values']['dte_end']));
                $nd = $end_date_array[2] . '-' .  $end_date_array[0] . '-' . $end_date_array[1];
            }
                if (strcmp($nd,$strt) < 0 ) {
                         form_set_error('dte_start', 'The start date must be less than the end date.');
                }
    }

}

/**
 * Submit handler for the search form.
 */
function google_appliance_search_form_submit($form, &$form_state) {
  $form_state['redirect'] = $form['#google_appliance_search_base'] .'/'. $form_state['values']['keys'];
}

function google_appliance_advancedform_clear($form, &$form_state) {
    $form_state['rebuild'] = TRUE;
}

/**
 * Submit handler for the search form.
 * CUSTOM SEARCH - MJB
 */
function google_appliance_advancedform_submit($form, &$form_state) {
$keys = '';
$dotdot = '..';
$daterange = '';
$strt = '';
$nd = '';
$qry_str = '';
$start_date_array = array();
    if (trim($form_state['values']['as_q']) != '') $keys .= ' ' . trim($form_state['values']['as_q']);
    if (trim($form_state['values']['as_oq']) != '') $keys .= ' ' . str_replace(' ', ' OR ', trim($form_state['values']['as_oq']));
    if (trim($form_state['values']['as_eq']) != '') $keys .= ' -' . str_replace(' ', ' -', trim($form_state['values']['as_eq']));
    if (trim($form_state['values']['as_epq']) != '') $keys .= ' "' . trim($form_state['values']['as_epq']) . '"';
    if ((trim($form_state['values']['dte_start']) != '') || (trim($form_state['values']['dte_end']) != '')) {
            if (trim($form_state['values']['dte_start']) != '') {
                $start_date_array = explode('/', trim($form_state['values']['dte_start']));
                if (count($start_date_array) > 2 )
                $strt = $start_date_array[2] . '-' . $start_date_array[0] . '-' . $start_date_array[1];
            }
            if (trim($form_state['values']['dte_end']) != '') {
                $end_date_array = explode('/', trim($form_state['values']['dte_end']));
                $nd = $end_date_array[2] . '-' .  $end_date_array[0] . '-' . $end_date_array[1];
            }
            $daterange =  ' daterange:' . $strt . $dotdot . $nd;
                $keys .= ' ' . $daterange;
    }
    if ((trim($form_state['values']['contenttype']) != '') || (trim($form_state['values']['publicationname']) != '') || (trim($form_state['values']['adv']) != '')) {
        $qry_cnnctr = '';
        if (trim($form_state['values']['contenttype']) != '') {
                $qry_str .= $qry_cnnctr . 'contenttype=' . $form_state['values']['contenttype'];
                $qry_cnnctr = '&';
        }
        if (trim($form_state['values']['publicationname']) != '') {
                $qry_str .= $qry_cnnctr . 'publicationname=' . $form_state['values']['publicationname'];
                $qry_cnnctr = '&';
        }
        if (trim($form_state['values']['adv']) != '') {
                $qry_str .= $qry_cnnctr . 'adv=' . $form_state['values']['adv'];
                $qry_cnnctr = '&';
        }
}

  //$form_state['redirect'] = $form['#google_appliance_search_base'] .'/'. $form_state['values']['keys'];
//drupal_set_message(t('The form has been submitted.'));
  $form_state['redirect'] = array('search/google-appliance/' . $keys, $qry_str);
}
?>