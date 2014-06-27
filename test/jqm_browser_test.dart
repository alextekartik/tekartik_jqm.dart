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
      //devPrint(jQuery.version);
      expect(jQuery.version >= new Version(2, 1, 0), isTrue);

      Version versionMin = new Version(1, 4, 2);
      //devPrint(jQueryMobile.version);
      expect(jQueryMobile.version >= versionMin, isTrue);
    });
  });


  group('PageContainer', () {
    test('JPageChangeOptions', () {
      JPageChangeOptions options = new JPageChangeOptions(changeHash: true, transition: "fade", param: 12345, reverse: false);
      expect(options.changeHash, true);
      expect(options.transition, "fade");
      expect(options.reverse, false);
      expect(options.param, 12345);

      options = new JPageChangeOptions(changeHash: false, transition: "none", param: 123456, reverse: true);
      expect(options.changeHash, false);
      expect(options.transition, "none");
      expect(options.reverse, true);
      expect(options.param, 123456);

      JsObject jsOptions = options.jsObject;
      options = new JPageChangeOptions.fromEventOptions(jsOptions);
      expect(options.changeHash, false);
      expect(options.transition, "none");
      expect(options.reverse, true);
      expect(options.param, 123456);
      
      options.transition = "fade";
      expect(options.transition, "fade");
    });
  });




}
