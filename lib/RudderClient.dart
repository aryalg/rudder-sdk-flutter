import './RudderConfig.dart';
import './RudderTraits.dart';
import './RudderOption.dart';
import './RudderProperty.dart';
import 'package:flutter/services.dart';

class RudderClient {
    /* API for getting RudderClient instance with bare minimum
     *
     * @param context  Your Application context
     * @param writeKey Your Android WriteKey from RudderStack dashboard
     * @return RudderClient instance to be used further
     */
  static const platform = const MethodChannel('rudder_sdk_flutter');
  static void getInstance(String writeKey,
      {RudderConfig config, RudderOption options}) {
    if (config == null) {
      config = RudderConfig();
    }
    Map<String, dynamic> params = new Map();
    params['writeKey'] = writeKey;
    params['config'] = config.toMap();
    if (options != null) {
      params['options'] = options.toMap();
    }
    platform.invokeMethod("initializeSDK", params);
    track("Application Opened");
  }

  static void identify(String userId,
      {RudderTraits traits, RudderOption options}) {
    Map<String, dynamic> params = new Map();

    if (userId != null) {
      params["userId"] = userId;
    }

    if (traits != null) {
      params["traits"] = traits.traitsMap;
    }

    if (options != null) {
      params["options"] = options.toMap();
    }

    platform.invokeMethod("identify", params);
  }

  static void track(String eventName,
      {RudderProperty properties, RudderOption options}) {
    Map<String, dynamic> params = new Map();

    if (eventName != null) {
      params["eventName"] = eventName;
    }

    if (properties != null) {
      params["properties"] = properties.getMap();
    }

    if (options != null) {
      params["options"] = options.toMap();
    }

    platform.invokeMethod("track", params);
  }

  static void screen(String screenName,
      {RudderProperty properties, RudderOption options}) {
    Map<String, dynamic> params = new Map();

    if (screenName != null) {
      params["screenName"] = screenName;
    }

    if (properties != null) {
      params["properties"] = properties.getMap();
    }

    if (options != null) {
      params["options"] = options.toMap();
    }

    platform.invokeMethod("screen", params);
  }

  static void group(String groupId,
      {RudderTraits groupTraits, RudderOption options}) {
    Map<String, dynamic> params = new Map();

    if (groupId != null) {
      params["groupId"] = groupId;
    }

    if (groupTraits != null) {
      params["groupTraits"] = groupTraits.traitsMap;
    }

    if (options != null) {
      params["options"] = options.toMap();
    }

    platform.invokeMethod("group", params);
  }

  static void alias(String newId, {RudderOption options}) {
    Map<String, dynamic> params = new Map();

    if (newId != null) {
      params["newId"] = newId;
    }

    if (options != null) {
      params["options"] = options.toMap();
    }

    platform.invokeMethod("alias", params);
  }

  static void reset() {
    platform.invokeMethod("reset");
  }

  static void putDeviceToken(String deviceToken) {
    Map<String, dynamic> params = new Map();

    if (deviceToken != null) {
      params["deviceToken"] = deviceToken;
      platform.invokeMethod("putDeviceToken", params);
    }
  }

  static void setAdvertisingId(String advertisingId) {
    Map<String, dynamic> params = new Map();

    if (advertisingId != null) {
      params["advertisingId"] = advertisingId;
      platform.invokeMethod("setAdvertisingId", params);
    }
  }

  static void setAnonymousId(String anonymousId) {
    Map<String, dynamic> params = new Map();

    if (anonymousId != null) {
      params["anonymousId"] = anonymousId;
      platform.invokeMethod("setAnonymousId", params);
    }
  }
}
