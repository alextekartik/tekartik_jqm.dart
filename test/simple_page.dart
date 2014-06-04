import 'package:polymer/polymer.dart';

import 'dart:js';
import 'dart:html';
import 'package:tekartik_jqm/jquerymobile.dart'; 
import 'package:tekartik_jqm/jqm_pagecontainer.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart' as jq;
/**
 * A Polymer click counter element.
 */
@CustomTag('simple-page')
class SimplePage extends PolymerElement with NoShadowDom {

  JPageElement jPageElement;
  SimplePage.created() : super.created() {
    print('SimplePage created');
  
  }

//  ready() {
//    print('SimplePage ready');
//  }
  attached() {
    
    print('SimplePage attached');
    super.attached();
//
    JsObject jsObject = jq.queryElement($['simple']);
      //devPrint(jsObjectAsMap(jsObject));
      jPageElement = new JPageElement(jsObject)..page();
//    // switch ot it
//    JPageChangeOptions options = new JPageChangeOptions(transition: 'none', changeHash: true);
//    print(options);
//    jQueryMobilePageContainer.changeTo(jPageElement, options);
//    //print($['simple'].innerHtml);
//    print('changed');
      
      JqmPageContainer container = findPageContainer(parent);
      if (container != null) {
        container.onChildrenAttached();
        
      }

  }
  //This enables the bootstrap javascript to see the elements
//  @override
//  Node shadowFromTemplate(Element template) {
//    var dom = instanceTemplate(template);
//    append(dom);
//    shadowRootReady(this, template);
//    return null; // no shadow here, it's all bright and shiny
//  }

  //This enables the styling via bootstrap.css
  // bool get applyAuthorStyles => true;
}

