import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _createdata = TextEditingController();
  TextEditingController _updatedata = TextEditingController();
  List<String> item = [];

  void _create() {
    setState(() {
      item.add(_createdata.text);
      _createdata.clear();
    });
  }

  void _delete(int index) {
    setState(() {
      item.removeAt(index);
    });
  }

  void _update(int index) {
    setState(() {
      item[index] = _updatedata.text;
      _updatedata.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.grey,
        title: Text("CRUD OPREATION",style: GoogleFonts.montserrat(),),
        actions: [
          IconButton(onPressed: (){Get.changeTheme(ThemeData.light());}, icon: Icon(Icons.light_mode_sharp)),
          IconButton(onPressed: (){Get.changeTheme(ThemeData.dark());}, icon: Icon(Icons.dark_mode_sharp))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              controller: _createdata,
            ),
          ),
          ElevatedButton(
              onPressed: _create,
              child: Text(
                "Add List",
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black))),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  item[index],
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          _update(index);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update Info"),
                                actions: [
                                  TextFormField(
                                    controller: _updatedata,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          _update(index);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Update")),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                        )),
                    IconButton(
                        onPressed: () {
                          _delete(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
