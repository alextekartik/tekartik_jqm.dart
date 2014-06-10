library tekartik_jqm_page;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jqm_page.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('test-pagewithlistview')
class TestPageWithListview extends JqmPage {

  TestPageWithListview.created() : super.created() {
    print('TestPageWithListview.created');
  }

  @override
  attached() {
    print('TestPageWithListview.attached');
    devPrint($['my_ul']);
    super.attached();

  }

  @override
  detached() {
    print('TestPageWithListview.detached');
    super.detached();

  }
}
