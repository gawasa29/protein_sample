//設定画面
import 'package:flutter/material.dart';

class Setteing extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );

  get whiteBoldText => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('設定'), actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          icon: Icon(Icons.close),
        ),
      ]),
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Jane Doe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "Nepal",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text(
                    "Languages",
                    style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "English US",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Profile Settings",
                    style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "Jane Doe",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                SwitchListTile(
                  title: Text(
                    "Email Notifications",
                    style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "On",
                    style: greyTExt,
                  ),
                  value: true,
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  title: Text(
                    "Push Notifications",
                    style: whiteBoldText,
                  ),
                  subtitle: Text(
                    "Off",
                    style: greyTExt,
                  ),
                  value: false,
                  onChanged: (val) {},
                ),
                ListTile(
                  title: Text(
                    "Logout",
                    style: whiteBoldText,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
