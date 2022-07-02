import 'dart:io';

import 'package:nyxx/nyxx.dart';

String getEnv(String key, [String? def]) =>
    Platform.environment[key] ??
    def ??
    (throw Exception('Missing `$key` environment variable'));

bool getEnvBool(String key, [bool? def]) =>
    ['true', '1'].contains(getEnv(key, def?.toString()).toLowerCase());

/// The token to use for this instance.
final String token = getEnv('ROD_TOKEN');

/// Whether to enable features requiring privileged intents for this instance.
final bool intentFeaturesEnabled = getEnvBool('ROD_INTENT_FEATURES_ENABLE');

final List<Snowflake> adminIds =
    getEnv('ROD_ADMIN_IDS').split(RegExp(r'\s+')).map(Snowflake.new).toList();

/// The prefix to use for text commands for this instance.
final String prefix = getEnv('ROD_PREFIX');

/// The address of the lavalink running server to connect to.
String serverAddress = getEnv('LAVALINK_ADDRESS');

/// The port of the lavalink running server to use to connect.
int serverPort = int.parse(getEnv('LAVALINK_PORT'));

/// The password used to connect to the lavalink server.
String serverPassword = getEnv('LAVALINK_PASSWORD');

/// Whether to use or not ssl to establish a connection.
bool useSSL = getEnvBool('LAVALINK_USE_SSL');

/// Whether this instance should run in development mode.
// final bool dev = getEnvBool('ROD_DEV');

/// If this instance is in development mode, the ID of the guild to register commands to, else
/// `null`.
// final Snowflake? devGuildId =
//     dev ? Snowflake(getEnv('ROD_DEV_GUILD_ID')) : null;

final Snowflake? devGuildId = null;

/// The basic intents needed to run RondonBot without privileged intents.
final int _baseIntents = GatewayIntents.directMessages |
    GatewayIntents.guilds |
    GatewayIntents.guildVoiceState;

/// Privileged intents that can be enabled to add addtional features to RondonBot.
final int _privilegedIntents =
    _baseIntents | GatewayIntents.guildMessages | GatewayIntents.guildMembers;

/// The intents to use for this instance.
final int intents = intentFeaturesEnabled ? _privilegedIntents : _baseIntents;
