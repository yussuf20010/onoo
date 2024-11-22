import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/wp_config.dart';
import '../../core/components/app_logo.dart';
import '../../core/constants/constants.dart';
import '../../core/controllers/config/config_controllers.dart';
import '../../core/utils/app_utils.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider).value;
    final description = config?.appDescription ?? '';
    final email = config?.ownerEmail ?? 'medithen@medithen.com';
    final name = config?.ownerName ?? 'MediThen Ai';
    // final phone = config?.ownerPhone ?? 'No phone provided';
    final address = config?.ownerAddress ?? 'Cairo,Egypt';

    void copyData(String data) async {
      await Clipboard.setData(ClipboardData(text: data));
      Fluttertoast.showToast(msg: 'Copied');
    }

    return Scaffold(
      appBar: AppBar(title: Text('contact_us'.tr())),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 100,
              width: 100,
              child: AppLogo(),
            ),
          ),
          AppSizedBox.h10,
          Text(
            WPConfig.appName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(AppDefaults.margin),
              child: Text(description),
            ),
          const Divider(),
          ListTile(
            title: const Text('Name'),
            subtitle: Text(name),
            leading: const Icon(Icons.person),
            onLongPress: () => copyData(name),
          ),
          const Divider(),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(email),
            leading: const Icon(Icons.email),
            onLongPress: () => copyData(email),
            trailing: IconButton(
              onPressed: () {
                AppUtil.sendEmail(
                  email: email,
                  content: 'write something here...',
                  subject: 'MediThen ...',
                );
              },
              icon: const Icon(Icons.send_outlined),
            ),
          ),

          // ListTile(
          //   title: const Text('Phone'),
          //   subtitle: Text(phone),
          //   leading: const Icon(Icons.phone),
          //   onLongPress: () => copyData(phone),
          //   trailing: IconButton(
          //     onPressed: () => copyData(phone),
          //     icon: const Icon(Icons.copy),
          //   ),
          // ),

          ListTile(
            title: const Text('Address'),
            subtitle: Text(address),
            leading: const Icon(Icons.gps_fixed_rounded),
            onLongPress: () => copyData(address),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
