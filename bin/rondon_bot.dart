import "package:nyxx/nyxx.dart";
import 'package:nyxx_commands/nyxx_commands.dart';
import 'package:rondon_bot/src/commands/music.dart';
import 'package:rondon_bot/src/error_handler.dart';
import 'package:rondon_bot/src/services/music.dart';
import 'package:rondon_bot/src/settings.dart';

void main() async {
  final client =
      NyxxFactory.createNyxxWebsocket(token, GatewayIntents.allUnprivileged);

  final commands = CommandsPlugin(
    prefix: mentionOr((_) => prefix),
    guild: devGuildId,
    options: CommandsOptions(logErrors: false, hideOriginalResponse: false),
  );

  // Register our commands
  commands.addCommand(music);

  // Add our error handler
  commands.onCommandError.listen(commandErrorHandler);

  // Add logging, CLI, exceptions and commands plugin to our client
  client
    ..registerPlugin(Logging())
    ..registerPlugin(IgnoreExceptions())
    ..registerPlugin(commands);

  // Initialise our services
  MusicService.init(client);

  // Connect
  await client.connect();
}
