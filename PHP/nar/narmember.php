/**
 * Implementation of hook_form_alter().
 * Removal of registration and reset password option.
 */
function narmember_menu_alter(&$items) {
  $items['user']['type'] = MENU_CALLBACK;
  $items['user/register']['type'] = MENU_CALLBACK;
  $items['user/password']['type'] = MENU_CALLBACK;
  $items['user/reset/%/%/%']['type'] = MENU_CALLBACK;
  $items['user/register']['access callback'] = FALSE;
  $items['user/password']['access callback'] = FALSE;
 $items['user/reset/%/%/%']['access callback'] = FALSE;

}


/**
 * Actions for member function triggers
 * narmember module
 *
**/


 function narmember_action_info() {
   return array(

     'narmember_togglecontentpremium_action' => array(
       'type' => 'node',
       'label' => t('narmember: Set preimium option based upon choice for the ~view permissions~ field'),
       'configurable' => FALSE,
       'behavior' => array('changes_property'),
       'triggers' => array('node_presave', 'node_insert', 'node_update'),
     ),
   );
}

/**
 * Action function for narmember_togglecontentpremium_action.
 *
 * @param $node
 *   A node object provided by the associated trigger.
 * @param $context
 */
function narmember_togglecontentpremium_action($node, $context) {
  if (function_exists('dsm')) {
    dsm($node, 'narmember_togglecontentpremium_action is firing. Here is the $node');
    dsm($context, 'narmember_togglecontentpremium_action is firing. Here is the $context');
  }
  // Is the node view permission set to 'Member'.
  if ($node->field_view_permissions['und'][0]['value']) {
          if ((strtolower($node->field_view_permissions['und'][0]['value']) == 'member') || (strtolower($node->field_view_permissions['und'][0]['value']) == 'staff')) {
            $node->premium = 1;
            watchdog('action', 'Set @type %title to %premium based upon field view permissions %viewpermissions.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%premium' => $node->premium, '%viewpermissions' => $node->field_view_permissions['und'][0]['value']));
            drupal_set_message(t('Set @type %title to %premium based upon %viewpermissions.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%premium' => $node->premium, '%viewpermissions' => $node->field_view_permissions['und'][0]['value'])));
          } else {
            $node->premium = 0;
            watchdog('action', 'UnSet @type %title to %premium based upon field view permissions %viewpermissions.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%premium' => $node->premium, '%viewpermissions' => $node->field_view_permissions['und'][0]['value']));
            drupal_set_message(t('UnSet @type %title to %premium based upon %viewpermissions.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%premium' => $node->premium, '%viewpermissions' => $node->field_view_permissions['und'][0]['value'])));
          }
  } else {
           watchdog('action', 'There is no field named view permissions.' . $node->premium);
           drupal_set_message(t('There is no field named view permissions.'));
  }
}


