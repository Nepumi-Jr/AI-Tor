import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _icon(),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 30, left: 30, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add Event Title',
                  hintStyle: TextStyle(fontSize: 28, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 28),
              ), //Title

              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(margin: const EdgeInsets.only(left: 20, right: 20),child: const Icon(CupertinoIcons.clock),),
                        const Text('All Day', style: TextStyle(fontSize: 16)),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(CupertinoIcons.switch_camera),
                                  SizedBox(width: 20),
                                ]))],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 73),
                          child: GestureDetector(
                            child: const Text('Monday, 6, March', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  child: const Text('19:30', style: TextStyle(fontSize: 16)),
                                )))],
                    ),
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 73),
                            child: GestureDetector(
                              child: const Text('Monday, 6, March', style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  child: const Text('22:30', style: TextStyle(fontSize: 16)),
                                ),
                              ))]
                    ),
                  ],
                ),
              ), //Time

              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.notifications_active_outlined),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        child: const Text('30 minute before event', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            child: const Text('edit', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ),))
                  ],
                ),
              ), //Notification Time

              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(padding: EdgeInsetsDirectional.only(start: 20),
                      child: Icon(Icons.location_on_outlined)),
                  prefix: SizedBox(width: 15),
                  contentPadding: EdgeInsets.only(top: 18, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add location',
                  hintStyle: TextStyle(fontSize: 16, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 16),
              ), //Location

              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(padding: EdgeInsetsDirectional.only(start: 20),
                      child: Icon(CupertinoIcons.list_bullet)),
                  prefix: SizedBox(width: 15),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add description',
                  hintStyle: TextStyle(fontSize: 16, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 16),
              ), //description
            ],
          )
        )),
    );
  }

  Widget _icon() {
    return Row(
      children: [
        Expanded(
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(onPressed: () {
                      Navigator.of(context).pop();

                    },
                        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.primary)))
              ],
            )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.primary,
                      margin: const EdgeInsets.only(left: 20, right: 30),
                      child: GestureDetector(
                        child: Text('save', style: TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ))
              ],
            ))],
    );
  }
}