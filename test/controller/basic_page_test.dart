library index;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile_controller.dart';
import 'package:tekartik_jqm/jquerymobile_loader.dart';
import 'package:tekartik_utils/test_utils_browser.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/log_utils.dart';

import 'dart:html';

void main() {

  debugQuickLogging(Level.FINE);
  loadJQueryMobile().then((jqm) {
    PageContainer pageContainer = new PageContainer(jQueryMobilePageContainer);
    JPage jPage = new JPage.fromElement(jNewPageElement('home'));
    Page page = new Page.withJPage(pageContainer, jPage);
    jPage.element.children.add(jNewPageHeaderElement(title: "dynamic basic page"));
    pageContainer.navigate('home', new PageChangeOptions(changeHash: false));
  });



}
