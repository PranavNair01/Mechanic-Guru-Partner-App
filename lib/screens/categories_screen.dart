import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = '/categories';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<String> items = [
    'Car Service',
    'Electrical',
    'Mechanical',
    'Denter/Painter',
    'AC Service',
    'Car Washing',
    'Car Spa & Cleaning',
    'Car Accessories',
    'Car Detailing',
    'Car Spares',
    'Insurance Claim',
    'Tyres and Wheel Care',
    'Batteries',
    'Lights and Fitments',
    'Windshields and Glass',
  ];//Mention length in state and icon in icons

  var icons = {
    'Car Service': Icons.car_repair,
    'Electrical': Icons.electrical_services_rounded,
    'Mechanical': Icons.pan_tool_rounded,
    'Denter/Painter': Icons.format_paint_rounded,
    'AC Service': Icons.ac_unit_rounded,
    'Car Washing': Icons.wash_rounded,
    'Car Spa & Cleaning': Icons.spa_rounded,
    'Car Accessories': Icons.vpn_key_sharp,
    'Car Detailing': Icons.design_services_rounded,
    'Car Spares': Icons.departure_board_sharp,
    'Insurance Claim': Icons.file_copy_rounded,
    'Tyres and Wheel Care': Icons.stop_circle,
    'Batteries': Icons.battery_charging_full_rounded,
    'Lights and Fitments': Icons.lightbulb_outline_rounded,
    'Windshields and Glass': Icons.filter_frames_rounded,
  };

  var state = List<bool>.generate(15, (index) => false);
  var trailIcons = List<Icon>.generate(15, (index) => Icon(Icons.add_circle_outline));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Categories',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFF56D00)),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index){
                items.sort();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        icons['${items[index]}'],
                      ),
                      trailing: trailIcons[index],
                      hoverColor: Colors.grey,
                      selected: state[index],
                      selectedTileColor: Color(0xFFAAD6EF),
                      onTap: (){
                        setState(() {
                          if(state[index]==true){
                            state[index]=false;
                            trailIcons[index]=Icon(Icons.add_circle_outline);
                          }
                          else{
                            state[index]=true;
                            trailIcons[index]=Icon(Icons.check);
                          }
                        });
                      },
                      title: Text(
                        '${items[index]}',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
