// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:flutter/foundation.dart';

import 'dart:js' as js;

Future trackEvent(
  String eventName,
  dynamic? parameters,
) async {
  try {
    final _parameters = <String, dynamic>{};
    // check if we have the parameters
    if (parameters is Map<String, dynamic>? &&
        parameters != null &&
        parameters.isNotEmpty) {
      // Prepare the parameters map
      parameters.forEach((key, value) {
        // Check if the value can be parsed as a double
        var _revisedParamDoubleValue = double.tryParse(value);
        if (_revisedParamDoubleValue != null) {
          _parameters.putIfAbsent(key, () => _revisedParamDoubleValue);
        } else {
          // Check if the value can be parsed as a boolean
          var _revisedParamBoolValue = bool.tryParse(value);
          if (_revisedParamBoolValue != null) {
            _parameters.putIfAbsent(key, () => _revisedParamBoolValue);
          } else {
            // Just put the String value in the map
            _parameters.putIfAbsent(key, () => value);
          }
        }
      });
    }

    _parameters['analytics_event_name'] = eventName;
    final _encodedPayload = jsonEncode(_parameters);

    // Call the track event function
    if (kIsWeb) {
      js.context.callMethod(
        'trackAnalyticsEvent',
        [_encodedPayload],
      );
    }
  } catch (error, stacktrace) {
    print(error);
    print(stacktrace);
  }
}
