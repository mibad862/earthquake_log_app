import 'package:earthquake_log_app/providers/app_data_provider.dart';
import 'package:earthquake_log_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Consumer<AppDataProvider>(
        builder: (context, provider, child) => ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            Text("Time Settings",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Start Time"),
                    subtitle: Text(provider.startTime),
                    trailing: IconButton(
                      onPressed: () async {
                        final date = await selectDate();
                        if (date != null) {
                          provider.setStartTime(date);
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                  ListTile(
                    title: const Text("End Time"),
                    subtitle: Text(provider.endTime),
                    trailing: IconButton(
                      onPressed: () async {
                        final date = await selectDate();
                        if (date != null) {
                          provider.setEndTime(date);
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      provider.getEarthquakeData();
                      showMsg(context, "Times are updated");
                    },
                    child: const Text("Update Time Changes"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text("Location Settings",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Card(
              child: SwitchListTile(
                title: Text(provider.currentCity ?? 'Your city is unknown'),
                value: provider.shouldUseLocation,
                subtitle: provider.currentCity == null ? null : Text("Earthquake data will be shown within ${provider.maxRadiusKm} km radius from ${provider.currentCity}"),
                onChanged: (value) async{
                  EasyLoading.show(status: "Getting Device Location.");
                  await provider.setLocation(value);
                  EasyLoading.dismiss();
                },
              ),
            ),
            // const SizedBox(height: 5),
            // Text("Magnitude Settings",
            //     style: Theme.of(context).textTheme.titleMedium),
            // Slider(
            //   min: 0.0,
            //   max: 100.0,
            //   value: provider.magnitude,
            //   divisions: 10,
            //   label: '${provider.magnitude.round()}',
            //   onChanged: (value) {
            //    provider.setMagnitude(value);
            //   },
            // )
          ],
        ),
      ),
    );
  }

  Future<String?> selectDate() async {
    final dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (dt != null) {
      return getFormattedDateTime(dt.millisecondsSinceEpoch);
    }
    return null;
  }
}
