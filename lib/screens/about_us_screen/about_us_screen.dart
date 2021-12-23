import 'package:flutter/foundation.dart';
import 'package:car_rental/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
        ),
        backgroundColor: kButtonsColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                SvgPicture.asset(
                  kPaths['logo']!,
                  height: 100.0,
                  width: 100.0,
                ),
                const SizedBox(height: 10.0),
                const VersionNumber()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VersionNumber extends StatelessWidget {
  const VersionNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            if (snapshot.hasError) {
              if (kDebugMode) {
                print('Something went wrong!');
              }
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data![0],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text('Version: ${snapshot.data![2]}'),
                  const SizedBox(height: 50.0),
                  GestureDetector(
                    child: const Text(
                      'Licenses',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF0645AD),
                      ),
                    ),
                    onTap: () => showLicensePage(
                      context: context,
                      applicationName: snapshot.data![0],
                      applicationIcon: const Padding(
                        padding: EdgeInsets.all(20.0),
                        // child: Image.asset(
                        //   kPaths['appLogoPng']!,
                        //   width: 48.0,
                        //   height: 48.0,
                        // ),
                      ),
                      applicationLegalese: kCopyright,
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  ),
                ],
              );
            }
        }
        return Container();
      },
    );
  }
}

Future<List<String>>? fetchData() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;
  return [appName, packageName, version, buildNumber];
}
