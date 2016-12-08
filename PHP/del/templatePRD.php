<?php



function purdue_aggregator_block_item($variables) {
$item = $variables['item'];

$output = '<span class=title-post><a target="_blank" href="' . check_url($variables['item']->link) . '">' . check_plain($variables['item']->title) . '</a></span><span class=link-post><a target="_blank" href="' . check_url($variables['item']->link) . '">Read Full Press Release</a></span>';



  return $output;
}
/*
function purdue_preprocess_page(&$variables) {
    drupal_add_js('http://use.typekit.net/cue6qoq.js', 'external');
    drupal_add_js('try{Typekit.load();}catch(e){}', 'inline');
    //drupal_add_js('/sites/purdue/themes/purdue/js/typkt.js', 'file');
}

*/

/*
function purdue_form_views_exposed_form_alter(&$form, &$form_state){
 
  if ($form['#id'] == 'views-exposed-form-course-finder-page') {
  
    $form['colors']['#options'] = _get_associative_array_from_view(
      'view-programdetail', // view id
      'default', // view display id
      'taxonomy_term_data_field_data_field_areaofstudy_tid', // key field id
      'taxonomy_term_data_field_data_field_areaofstudy_name' // value field id
    );
  }
}


function _get_associative_array_from_view($viewID, $viewDisplayID, $keyFieldID, $valueFieldID){
 
  $associativeArray = array();
  $associativeArray['All'] = t('- Any -');

  $viewResults = views_get_view_result($viewID, $viewDisplayID);
 
  foreach($viewResults as $viewRow) {
    $associativeArray[$viewRow->$keyFieldID] = $viewRow->$valueFieldID;
  }
 
  return $associativeArray;
}

*/

function purdue_aggregator_feed_items_load($type, $data = NULL) {
  $items = array();
  switch ($type) {
    case 'sum':
      $query = db_select('aggregator_item', 'i');
      $query->join('aggregator_feed', 'f', 'i.fid = f.fid');
      $query->fields('i');
      $query->addField('f', 'title', 'ftitle');
      $query->addField('f', 'link', 'flink');
      break;
    case 'source':
      $query = db_select('aggregator_item', 'i');
      $query
        ->fields('i')
        ->condition('i.fid', $data->fid);
      break;
    case 'category':
      $query = db_select('aggregator_category_item', 'c');
      $query->leftJoin('aggregator_item', 'i', 'c.iid = i.iid');
      $query->leftJoin('aggregator_feed', 'f', 'i.fid = f.fid');
      $query
        ->fields('i')
        ->condition('cid', $data['cid']);
      $query->addField('f', 'title', 'ftitle');
      $query->addField('f', 'link', 'flink');
      break;
  }

  $result = $query
    ->extend('PagerDefault')
    ->limit(10)
    ->orderBy('i.timestamp', 'DESC')
    ->orderBy('i.iid', 'DESC')
    ->execute();

  foreach ($result as $item) {
    $item->categories = db_query('SELECT c.title, c.cid FROM {aggregator_category_item} ci LEFT JOIN {aggregator_category} c ON ci.cid = c.cid WHERE ci.iid = :iid ORDER BY c.title', array(':iid' => $item->iid))->fetchAll();
    $items[] = $item;
  }

  return $items;
}


