import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

part 'pull.g.dart';
part 'pull.freezed.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ActivityView());
  }
}

class ActivityView extends ConsumerWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pull to refresh',
          style: GoogleFonts.zenDots(
            fontSize: 20.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activityProvider.future),
        child: ListView(
          children: [
            ListTile(
              title: switch (activity) {
                AsyncValue<Activity>(:final valueOrNull?) => Text(
                    valueOrNull.activity,
                    style: GoogleFonts.zeyada(
                      fontSize: 50.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                AsyncValue(:final error?) => Text(
                    'Error: $error',
                    style: const TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                _ => const CircularProgressIndicator(),
              },
            ),
          ],
        ),
      ),
    );
  }
}

@riverpod
Future<Activity> activity(Ref ref) async {
  http.Response response = await http.get(
    Uri.https('bored-api.appbrewery.com', '/random'),
  );

  final json = await jsonDecode(response.body) as Map;
  return Activity.fromJson(Map.from(json));
}

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String activity,
    required double availability,
    required String type,
    required int participants,
    required double price,
    required String accessibility,
    required String duration,
    required bool kidFriendly,
    required String link,
    required String key,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
