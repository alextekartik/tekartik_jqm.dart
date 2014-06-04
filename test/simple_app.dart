import 'package:polymer/polymer.dart';

import 'dart:js';
import 'dart:html';

import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jqm_app.dart' show JqmApp;
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart' as jq;
/**
 * A Polymer click counter element.
 */
@CustomTag('simple-app')
class SimpleApp extends JqmApp {
  SimpleApp.created() : super.created() {
     devPrint('SimpleApp created');
   }
  
  void attached() {
    super.attached();
    // switch ot it
//    JPageChangeOptions options = new JPageChangeOptions(transition: 'none', changeHash: true);
//    print(options);
//    jQueryMobilePageContainer.changeTo(jPageElement, options);
//    //print($['simple'].innerHtml);
//    print('changed');
    
    var jPageElement = new JPageElement(jq.queryElement($['simple']));
    JPageChangeOptions options = new JPageChangeOptions(transition: 'none', changeHash: true);
//    print(options);
    jQueryMobilePageContainer.changeTo(jPageElement, options);
//  
    
    print($['simple']);
  }
}