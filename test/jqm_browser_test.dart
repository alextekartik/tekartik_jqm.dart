library jqm_browser_test;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/version.dart';
import 'package:tekartik_utils/test_utils_browser.dart';

void main() {
  useHtmlConfiguration();

  group('Global', () {
    test('version', () {
      // Simple test we make sure you run unit test when jquery is updated...
      devPrint(jQuery.version);
      expect(jQueryVersion, "2.1.0");
            
      Version versionMin = new Version(1, 4, 2);
      devPrint(jQueryMobile.version);
      expect(jQueryMobile.version >= versionMin, isTrue);
    });
  });
  
 

}
