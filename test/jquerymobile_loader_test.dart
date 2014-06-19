library jquery_browser_test;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile_loader.dart';
import 'package:tekartik_utils/test_utils_browser.dart';

void main() {
  useHtmlConfiguration();

  group('loader', () {
    test('version', () {
      // Simple test we make sure you run unit test when jquery is updated...
      expect(jsQuery, null);
      return loadJQueryMobile().then((jqm) {
        expect(jsQueryMobile, isNotNull);
        expect(jqm.version, JQUERYMOBILE_DEFAULT_VERSION);
        expect(jQueryMobile.version, JQUERYMOBILE_DEFAULT_VERSION);

      });
    });

  });


}
