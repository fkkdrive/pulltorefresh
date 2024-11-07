// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      activity: json['activity'] as String,
      availability: (json['availability'] as num).toDouble(),
      type: json['type'] as String,
      participants: (json['participants'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      accessibility: json['accessibility'] as String,
      duration: json['duration'] as String,
      kidFriendly: json['kidFriendly'] as bool,
      link: json['link'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'availability': instance.availability,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'accessibility': instance.accessibility,
      'duration': instance.duration,
      'kidFriendly': instance.kidFriendly,
      'link': instance.link,
      'key': instance.key,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityHash() => r'5eae0a8cd7011e25cb96bcd9d430b019b3c9d562';

/// See also [activity].
@ProviderFor(activity)
final activityProvider = AutoDisposeFutureProvider<Activity>.internal(
  activity,
  name: r'activityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivityRef = AutoDisposeFutureProviderRef<Activity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
