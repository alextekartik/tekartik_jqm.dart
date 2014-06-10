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
@CustomTag('test-subpage')
class TestSubPage extends JqmPage {

  TestSubPage.created() : super.created() {
    print('TestSubPage.created');
  }

  @override
  attached() {
    print('TestSubPage.attached');
    super.attached();

  }

  @override
  detached() {
    print('TestSubPage.detached');
    super.detached();

  }
}
