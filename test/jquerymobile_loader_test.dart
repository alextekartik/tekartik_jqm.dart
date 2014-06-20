library jquery_browser_test;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile_loader.dart';
import 'package:tekartik_utils/test_utils_browser.dart';
import 'package:tekartik_utils/log_utils.dart';
import 'dart:async';
void main() {
  useHtmlConfiguration();

  group('loader', () {
    test('version', () {
      // Simple test we make sure you run unit test when jquery is updated...
      expect(jsQuery, null);
      debugQuickLogging(Level.FINE);
      return loadJQueryMobile().then((jqm) {
        new Future.delayed(new Duration(milliseconds: 500)).then((_) {
        expect(jsQueryMobile, isNotNull);
        expect(jqm.version, JQUERYMOBILE_DEFAULT_VERSION);
        expect(jQueryMobile.version, JQUERYMOBILE_DEFAULT_VERSION);
        expect(jQueryMobilePageContainer.element.tagName, "BODY");

      });
      });
    });

  });


}
