import 'package:flutter/material.dart';
import 'package:rudder_sdk_flutter/RudderClient.dart';
import 'package:rudder_sdk_flutter/RudderConfig.dart';
import 'package:rudder_sdk_flutter/RudderTraits.dart';
import 'package:rudder_sdk_flutter/RudderProperty.dart';

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  void __identify() {
    //userId
    //userId, RudderTraits, RudderOption
    //Ruddertraits,. Rudderoption
    //RudderTraits
    RudderTraits traits = RudderTraits()
        .putFirstName("Desu")
        .putLastName("Sai Venkat")
        .putAge("22")
        .putEmail("saivenkatdesu@gmail.com")
        .putGender("Male");
    RudderClient.identify(userId: "161FA04009", traits: traits);
    //platform.invokeMethod("identify", params);
  }

  void __track() {
    //eventName
    // eventName, Property
    // eventName, RudderProperty property, RudderOption option
    RudderProperty property = RudderProperty();
    property.put("colour", "red");
    property.put("manufacturer", "hyundai");
    property.put("model", "i20");
    RudderClient.track("Went on a drive", properties: property);
    //platform.invokeMethod("track", params);
  }

  void __screen() {
    // screen name
    // screen name , RudderProperty property
    // screen name, category, RudderProperty property, RudderOption option
    //  screen name, RudderProperty property, RudderOption option
    RudderProperty screenProperty = new RudderProperty();
    screenProperty.put("browser", "chrome");
    screenProperty.put("device", "mac book pro");
    RudderClient.screen("Walmart Cart", properties: screenProperty);
  }

  void __group() {
    RudderTraits groupTraits = RudderTraits();
    groupTraits.put("place", "kolkata");
    groupTraits.put("size", "fiteen");
    RudderClient.group("Integrations-Rudder", groupTraits: groupTraits);
  }

  void __reset() {
    RudderClient.reset();
  }

  void __alias() {
    RudderClient.alias("4009");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Initialize SDK'),
              onPressed: () {
                RudderConfigBuilder config = RudderConfigBuilder();
                config.withDataPlaneUrl("https://54989f198999.ngrok.io");
                RudderClient.getInstance("1n0JdVPZTRUIkLXYccrWzZwdGSx",
                    builder: config);
              },
            ),
            ElevatedButton(
              child: Text('Identify call'),
              onPressed: __identify,
            ),
            ElevatedButton(
              child: Text('Track Call'),
              onPressed: __track,
            ),
            ElevatedButton(
              child: Text('Screen'),
              onPressed: __screen,
            ),
            ElevatedButton(
              child: Text('Group'),
              onPressed: __group,
            ),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: __reset,
            ),
            ElevatedButton(
              child: Text('Alias'),
              onPressed: __alias,
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: PlatformChannel()));
}
