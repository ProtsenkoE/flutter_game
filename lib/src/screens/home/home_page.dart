import 'package:flutter/material.dart';
import 'package:flutter_game/src/config/color_constants.dart';
import 'package:flutter_game/src/config/string_constants.dart'
    as string_constant;
import 'package:flutter_game/src/models/rooms.dart';

String greetingMessage = '';
String roomImage = '';
String addition = '';
int heroLife = 0;
int numberOfRooms = 0;
int duration = 700;
String endTextButton = string_constant.endButton.toUpperCase();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    setState(() {
      Rooms.initRoom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlueColor,
      body: SafeArea(
        child: Column(
          children: [
            _imageRoom(context),
            _roomDescription(context),
            const SizedBox(height: 20),
            _northButton(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _westButton(),
                const SizedBox(width: 80),
                _eastButton(),
              ],
            ),
            const SizedBox(height: 15),
            _southButton(),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _additionalWrapper(),
                _heroLife(),
                _numberOfRooms(),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              child: _endButton(),
            )
          ],
        ),
      ),
    );
  }

  Row _southButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Center(
            child: Text(
              string_constant.southButton,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tegomin',
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            minimumSize: const Size(100, 40),
          ),
          onPressed: () {
            setState(() {
              Rooms.showYourDirection(string_constant.southButton);
              Future.delayed(Duration(milliseconds: duration), () {
                setState(() {
                  Rooms.startGame();
                });
              });
            });
          },
        ),
      ],
    );
  }

  ElevatedButton _eastButton() {
    return ElevatedButton(
      child: const Center(
        child: Text(
          string_constant.eastButton,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        minimumSize: const Size(100, 40),
      ),
      onPressed: () {
        setState(() {
          Rooms.showYourDirection(string_constant.eastButton);
          Future.delayed(Duration(milliseconds: duration), () {
            setState(() {
              Rooms.startGame();
            });
          });
        });
      },
    );
  }

  ElevatedButton _westButton() {
    return ElevatedButton(
      child: const Center(
        child: Text(
          string_constant.westButton,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        minimumSize: const Size(100, 40),
      ),
      onPressed: () {
        setState(() {
          Rooms.showYourDirection(string_constant.westButton);
          Future.delayed(Duration(milliseconds: duration), () {
            setState(() {
              Rooms.startGame();
            });
          });
        });
      },
    );
  }

  Container _additionalWrapper() {
    return Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.all(2),
      child: Center(
        child: Text(
          addition,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  Container _heroLife() {
    return Container(
      height: 40,
      width: 100,
      child: Center(
        child: Text(
          'Life: $heroLife',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        border: Border.all(
          width: 1,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  Container _numberOfRooms() {
    return Container(
      height: 40,
      width: 100,
      child: Center(
        child: Text(
          'Rooms: $numberOfRooms',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  ElevatedButton _endButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          Rooms.endOrStartGame();
        });
      },
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(150, 40),
        primary: Colors.redAccent,
      ),
      child: Center(
        child: Text(endTextButton),
      ),
    );
  }

  Row _northButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Center(
            child: Text(
              string_constant.northButton,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tegomin',
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            minimumSize: const Size(100, 40),
          ),
          onPressed: () {
            setState(() {
              Rooms.showYourDirection(string_constant.northButton);

              Future.delayed(Duration(milliseconds: duration), () {
                setState(() {
                  Rooms.startGame();
                });
              });
            });
          },
        ),
      ],
    );
  }

  Container _imageRoom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(roomImage),
      ),
    );
  }

  Container _roomDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 90,
      width: MediaQuery.of(context).size.width - 30,
      child: Center(
        child: Text(
          greetingMessage,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tegomin',
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
