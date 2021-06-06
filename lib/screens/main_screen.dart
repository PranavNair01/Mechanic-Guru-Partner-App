import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mg_partner_app/screens/mobile_number_screen.dart';
import 'package:mg_partner_app/screens/categories_screen.dart';
import 'package:mg_partner_app/screens/tnc_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:mg_partner_app/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/home';
  @override
  _MainScreenState createState() => _MainScreenState();
}

int _currentIndex = 0;
int amount = 100;
const String razorpayAPIKey = 'rzp_test_vNCy1VlDnvuQlI';
BuildContext mainScreenContext;
bool tnc = false;
bool edit = false;
bool validEmail;
String editIcon;
String gname;
String oname;
String email;
String area;
String address;
String city;

final List<Map<String, dynamic>> cities = [
  {
    'value': 'Delhi',
    'label': 'Delhi',
  },
  {
    'value': 'Faridabad',
    'label': 'Faridabad',
  },
  {
    'value': 'Gurugram',
    'label': 'Gurugram',
  },
];

Razorpay razorpay = new Razorpay();


void handlerPaymentSuccess(){
  print('Payment Successful');
}

void handlerErrorFailure(){
  print('Payment Failed');
}

void handlerExternalWallet(){
  print('External Wallet');
}

void openCheckOut(){
  var options = {
    "key": razorpayAPIKey,
    "amount": amount,
    "name": "Mechanic Guru",
    "description": "Payment of pending dues",
    "prefill": {
      "contact": mobileNumber,
    },
    "external": {
      "wallets": ["paytm"],
    },
  };
  try{
    razorpay.open(options);
  }
  catch(err){
    print(err.toString());
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mainScreenContext = context;

    final List tabs = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 200.0,
              width: 350.0,
              child: Carousel(
                images: [
                  AssetImage('images/example-1.jpg'),
                  AssetImage('images/example-2.jpg'),
                  AssetImage('images/example-3.jpg'),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Color(0xFFF56D00),
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.grey.withOpacity(0.5),
                borderRadius: true,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.category_outlined,
                size: 35.0,
              ),
              ElevatedButton(
                child: Text(
                  'Select Categories',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(mainScreenContext, CategoriesScreen.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFF56D00)),
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Text(
            'Orders',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage('images/payment_page_icon.jpg'),
            height: 220.0,
            width: double.infinity,
          ),
          Text(
            'Payments',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
          Row(
            children: [
              Text(
                'To pay: ',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              Image(
                image: AssetImage('images/inr_icon.jpg'),
                height: 75.0,
              ),
              Text(
                '$amount',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              'Pay',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
              openCheckOut();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFF56D00)),
            ),
          ),
        ],
      ),
      ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    Icon(
                      Icons.person,
                      color: Color(0xFFF56D00),
                      size: 60.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, TnCScreen.id);
                          },
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Switch(
                          value: tnc,
                          activeColor: Color(0xFFF56D00),
                          activeTrackColor: Color(0xFFF56D00),
                          onChanged: (value){
                            setState(() {
                              if(edit == true)
                                tnc=value;
                            });
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: (edit==true)?Icon(Icons.check):Icon(Icons.edit),
                      color: Color(0xFFF56D00),
                      iconSize: 25.0,
                      onPressed: (){
                        setState(() {
                          if(edit==false)
                            edit=true;
                          else
                            {
                              validEmail=EmailValidator.validate(email);
                              if(tnc==false) {
                                Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: "WARNING",
                                  desc: "Please accept Terms and Conditions",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              }
                                if(validEmail==false){
                                  Alert(
                                    context: context,
                                    type: AlertType.warning,
                                    title: "WARNING",
                                    desc: "Please enter a valid email ID",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                }
                                // if(gname==null || oname==null || email==null || area==null || address==null){
                                //   Alert(
                                //     context: context,
                                //     type: AlertType.error,
                                //     title: "WARNING",
                                //     desc: "Please enter all fields",
                                //     buttons: [
                                //       DialogButton(
                                //         child: Text(
                                //           "OK",
                                //           style: TextStyle(color: Colors.white, fontSize: 20),
                                //         ),
                                //         onPressed: () => Navigator.pop(context),
                                //         width: 120,
                                //       )
                                //     ],
                                //   ).show();
                                // }
                                else if(tnc==true && validEmail==true)
                                  edit=false;
                              }

                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: !edit,
                  decoration: kProfileTextFieldDecoration.copyWith(hintText: 'Garage Name:'),
                  onChanged: (value){
                    gname=value;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: !edit,
                  decoration: kProfileTextFieldDecoration.copyWith(hintText: 'Owner Name:'),
                  onChanged: (value){
                    oname=value;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: !edit,
                  decoration: kProfileTextFieldDecoration.copyWith(hintText: 'Email ID: '),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    email=value;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: !edit,
                  decoration: kProfileTextFieldDecoration.copyWith(hintText: 'Area:'),
                  onChanged: (value){
                    area=value;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: !edit,
                  decoration: kProfileTextFieldDecoration.copyWith(hintText: 'Address:'),
                  onChanged: (value){
                    address=value;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SelectFormField(
                  enabled: edit,
                  enableSuggestions: edit,
                  enableSearch: true,
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'Gurugram',
                  hintText: 'Select City',
                  icon: Icon(
                      Icons.location_city_rounded,
                      color: Color(0xFFFD5600),
                  ),
                  labelText: 'City',
                  items: cities,
                  onChanged: (val) {
                    city=val;
                  },
                  onSaved: (val){
                    city=val;
                  },
                )
              ),
            ],
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            backgroundColor: Color(0xFFF56D00),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Orders',
            backgroundColor: Color(0xFFF56D00),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Payments',
            backgroundColor: Color(0xFFF56D00),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_rounded),
            label: 'Profile',
            backgroundColor: Color(0xFFF56D00),
          ),
        ],
        onTap: (selectedIndex){
          setState(() {
            _currentIndex=selectedIndex;
            print(_currentIndex);
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}
