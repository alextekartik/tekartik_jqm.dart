import 'package:polymer/polymer.dart';

import 'dart:js';
import 'dart:html';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jqm_page.dart';
import 'package:tekartik_jqm/jqm_pagecontainer.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart' as jq;
/**
 * A Polymer click counter element.
 */
@CustomTag('simple-page')
class SimplePage extends JqmPage {

  JPageElement jPageElement;
  SimplePage.created() : super.created() {
    print('SimplePage created');

  }

  ready() {
    print('SimplePage ready');
  }
  attached() {
    try {

      // id not valid before
      super.attached();
    print("SimplePage attached id '$id'");
    

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

   
    } catch (e, st) {
      print("$e $st");
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
