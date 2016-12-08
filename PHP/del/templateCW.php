<?php



function casewestern_easy_breadcrumb($variables) {

  $is_resource = false;
  $nid = arg(1);

  if(isset($nid)) {
	$tmp_node = node_load($nid);
	//echo "<pre>";print_r($tmp_node);die();
	if(isset($tmp_node) && is_object($tmp_node)) {
	  if($tmp_node->type == "resource" || $tmp_node->type =="event" ) { //|| $tmp_node->type == "news") {
		$is_resource = true;
	  }
	}
  }
  
  $breadcrumb = $variables['breadcrumb'];
   
  if($is_resource == true) {

	unset($breadcrumb[1]);
	$breadcrumb = array_values($breadcrumb);


	$variables['segments_quantity'] = $variables['segments_quantity'] - 1;
	end($breadcrumb);         // move the internal pointer to the end of the array
	$tmp_key = key($breadcrumb);
	$tmp_title = $tmp_node->field_sub_title['und'][0]['safe_value'];
	$breadcrumb[$tmp_key]['content'] = $tmp_title;

  }
 
  $segments_quantity = $variables['segments_quantity'];
  $separator = $variables['separator'];

  $html = '';

  if ($segments_quantity > 0) {

    $html .= '<div class="easy-breadcrumb">';

    for ($i = 0, $s = $segments_quantity - 1; $i < $segments_quantity; ++$i) {
                        $it = $breadcrumb[$i];
      $content = decode_entities($it['content']);
                        if (isset($it['url'])) {
                                $html .= l($content, $it['url'], array('attributes' => array('class' => $it['class'])));
                        } else {
        $class = implode(' ', $it['class']);
                                $html .= '<span class="' . $class . '">'        . $content . '</span>';
                        }
                        if ($i < $s) {
                                $html .= '<span class="easy-breadcrumb_segment-separator"> ' . $separator . ' </span>';
                        }
    }

    $html .= '</div>';
  }

  return $html;
}



