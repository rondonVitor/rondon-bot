FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* /app/
RUN dart pub get

COPY . /app
RUN dart pub get --offline

RUN dart run nyxx_commands:compile bin/rondon_bot.dart -o bot.dart

CMD [ "./bot.exe" ]
