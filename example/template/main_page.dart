import 'package:polymer/polymer.dart';

import 'dart:js';
import 'dart:html';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jqm_page.dart';
import 'package:tekartik_jqm/jqm_pagecontainer.dart';
import 'package:logging/logging.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart' as jq;
/**
 * A Polymer click counter element.
 */
@CustomTag('main-page')
class MainPage extends JqmPage with PageHandleOnBeforeShow, PageHandleOnBeforeHide, PageHandleOnShow, PageHandleOnHide {

  static Logger log = new Logger('MainPage');

  MainPage.created() : super.created() {
    log.fine('created');
  }

  @override
  void onBeforeShow() {
    log.fine('onBeforeShow');
  }

  @override
  void onBeforeHide() {
    log.fine('onBeforeHide');
  }

  @override
  void onShow() {
    log.fine('onShow');
  }

  @override
  void onHide() {
    log.fine('onHide');
  }

  @override
  ready() {
    super.ready();
    log.fine('ready');
  }
}