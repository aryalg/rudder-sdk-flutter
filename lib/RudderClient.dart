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
  static void getInstance(String writeKey, {RudderConfig config}) {
    if (config == null) {
      config = RudderConfig();
    }
    Map<String, dynamic> params = new Map();
    params['writeKey'] = writeKey;
    params['config'] = config.toMap();
    platform.invokeMethod("initializeSDK", params);
  }

  static void getInstanceWithConfigBuilder(String writeKey,
      {RudderConfigBuilder builder}) {
    if (builder != null) {
      getInstance(writeKey, config: builder.build());
      return;
    }
    getInstance(writeKey, config: null);
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
      params["options"] = options.externalIds;
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
      params["options"] = options.externalIds;
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
      params["options"] = options.externalIds;
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
      params["options"] = options.externalIds;
    }
    platform.invokeMethod("group", params);
  }

  static void alias(String newId, {RudderOption options}) {
    Map<String, dynamic> params = new Map();
    if (newId != null) {
      params["newId"] = newId;
    }
    if (options != null) {
      params["options"] = options;
    }
    platform.invokeMethod("alias", params);
  }

  static void reset() {
    platform.invokeMethod("reset");
  }

  static void putDeviceToken(String token) {
    Map<String, dynamic> params = new Map();
    if (token != null) {
      params["deviceToken"] = token;
      platform.invokeMethod("putDeviceToken", params);
    }
  }

  static void setAdvertisingId(String id) {
    Map<String, dynamic> params = new Map();
    if (id != null) {
      params["advertisingId"] = id;
      platform.invokeMethod("setAdvertisingId", params);
    }
  }

  static void setAnonymousId(String id) {
    Map<String, dynamic> params = new Map();
    if (id != null) {
      params["anonymousId"] = id;
      platform.invokeMethod("setAnonymousId", params);
    }
  }
}
