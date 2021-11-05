import 'dart:math';
import 'package:flutter_game/src/config/image_constants.dart';
import 'package:flutter_game/src/screens/home/home_page.dart';
import 'package:flutter_game/src/config/string_constants.dart'
    as string_constant;

class Rooms {
  late String description;
  late String image;

  Rooms({required this.description, required this.image});

  static void showYourDirection(String direction) {
    greetingMessage = 'You opened $direction door';
  }

  static bool isDisabledButton() {
    return endTextButton == string_constant.startButton;
  }

  static bool ifCompletedTenRooms() {
    return heroLife > 0 && numberOfRooms == 10;
  }

  static void isGameOver() {
    if (heroLife <= 0) {
      greetingMessage = string_constant.gameOver;
      endTextButton = string_constant.startButton;
    }
  }

  static void startGame() {
    int randomRoom = getRandomRoom();

    if (ifCompletedTenRooms()) {
      greetingMessage = string_constant.successfully;
      endTextButton = string_constant.startButton;
    }

    if (roomsDescription.isNotEmpty && heroLife > 0 && numberOfRooms < 10) {
      setModifier();
      greetingMessage = roomsDescription[randomRoom].description;
      roomImage = roomsDescription[randomRoom].image;
      numberOfRooms++;
      roomsDescription.removeAt(randomRoom);
    }

    isGameOver();
  }

  static void setModifier() {
    int randomModifier = getRandomModifier();
    switch (roomModifier[randomModifier]) {
      case 0:
        {
          addition = string_constant.emptyRoom;
        }
        break;

      case -2:
        {
          addition = string_constant.roomWithMonsters;
          heroLife = heroLife - 2;
        }
        break;

      case 2:
        {
          addition = string_constant.freshWaterWell;
          heroLife = heroLife + 2;
        }
        break;

      default:
        {
          addition = string_constant.additional;
        }
        break;
    }
  }

  static bool existenceOfRooms() {
    return roomsDescription.isNotEmpty;
  }

  static int getRandomRoom() {
    return Random().nextInt(roomsDescription.length);
  }

  static int getRandomModifier() {
    return Random().nextInt(roomModifier.length);
  }

  static void initRoom() {
    greetingMessage = string_constant.greetingMessage;
    addition = string_constant.additional;
    endTextButton = string_constant.endButton;
    numberOfRooms = 0;
    heroLife = 10;
    roomImage = AllImages().defaultImage;
  }

  static void endOrStartGame() {
    if (existenceOfRooms() && endTextButton == string_constant.endButton) {
      greetingMessage = string_constant.gameOver;
      endTextButton = string_constant.startButton;
    } else {
      initRoom();
    }
  }
}

final List<int> roomModifier = [0, -2, 2];

final List<Rooms> roomsDescription = [
  Rooms(
      description:
          'A gloomy dungeon, a bare brick wall, a collapsed ceiling, several doors leading in different directions',
      image: '${AllImages().image}/1.jpeg'),
  Rooms(
      description:
          'Apparently this is the former armory room. But everything has long been rusted and covered with dust',
      image: '${AllImages().image}/2.jpg'),
  Rooms(
      description: 'Looks like something was stored here, wooden shelves, bags',
      image: '${AllImages().image}/3.png'),
  Rooms(
      description: 'Looks like something was stored here, wooden shelves, bags',
      image: '${AllImages().image}/4.jpeg'),
  Rooms(
      description:
          'Drip-Drip-Drip - there is a sound of falling drops. Damp and disgusting',
      image: '${AllImages().image}/5.jpeg'),
  Rooms(
      description: 'Bare stone walls, nothing seems to be here',
      image: '${AllImages().image}/6.jpeg'),
  Rooms(
      description:
          'The remains of furniture suggested that there was once a comoro',
      image: '${AllImages().image}/7.jpeg'),
  Rooms(
      description: 'Four walls, dry air, nothing special',
      image: '${AllImages().image}/8.jpeg'),
  Rooms(
      description: 'An ordinary room is four meters by four',
      image: '${AllImages().image}/9.jpeg'),
  Rooms(
      description:
          'This room is larger than usual, but it looks like there is nothing in it.',
      image: '${AllImages().image}/10.jpg'),
  Rooms(
      description: 'Apart from the skeleton on the floor, nothing interesting',
      image: '${AllImages().image}/11.jpeg'),
  Rooms(
      description: 'Long corridor at the end of which doors are visible',
      image: '${AllImages().image}/12.jpeg'),
  Rooms(
      description:
          'Looks like a guard room, a few bunks and a broken cauldron in the corner',
      image: '${AllImages().image}/13.jpeg'),
  Rooms(
      description: 'An ordinary room, bare walls and stone underfoot',
      image: '${AllImages().image}/14.jpeg'),
];
