import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text("Fordcer",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Chakra Petch",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),)),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text("Lv.1 (0/100)",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Chakra Petch",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),)),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/test.jpg"),
                        radius: 100,
                      )
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text("69%",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Chakra Petch",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),)),
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    child: const Text('"Keep going"',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Chakra Petch",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),))
              ],
            ),
          ),
          Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text('01/01/2023',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: "Chakra Petch",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("กิจกรรม:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("นัดประชุม",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ),),
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("สถานที่:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("EN040101",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            )),
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("เวลา:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("13.00 - 16.00",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text('27/01/2023',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: "Chakra Petch",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("กิจกรรม:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("สอบ",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ),),
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("สถานที่:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("EN040101",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            )),
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("เวลา:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("13.00 - 16.00",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text('27/01/2023',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: "Chakra Petch",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("กิจกรรม:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("สอบ",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ),),
                            Expanded(child: Container(
                              child: Column(
                                children: const [
                                  Text("สถานที่:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("EN040101",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            )),
                            Expanded(child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: const [
                                  Text("เวลา:",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Text("13.00 - 16.00",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Chakra Petch",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
          )
        ],
      ),
    );
  }
}

