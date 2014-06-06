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
@CustomTag('jqm-demo-page')
class JqmDemoPage extends JqmPage {

  JPageElement jPageElement;
  JqmDemoPage.created() : super.created() {
    print('JqmDemoPage created');

  }

  ready() {
    super.ready();
    print('JqmDemoPage ready');
  }
  attached() {
    try {

      // id not valid before
      super.attached();
      print("JqmDemoPage attached id '$id'");

    } catch (e, st) {
      print("$e $st");
    }

  }
}
