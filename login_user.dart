import 'package:flutter/material.dart';
import 'package:internship_dp_flutter/Screens/Sign_up.dart';

class Login_Page_main extends StatefulWidget {
  const Login_Page_main({super.key});

  @override
  State<Login_Page_main> createState() => _Login_Page_mainState();
}

TextEditingController Useremail = TextEditingController();
class _Login_Page_mainState extends State<Login_Page_main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[700],
      body:
      Center(child:
          SingleChildScrollView(
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/img.png',),radius: MediaQuery.sizeOf(context).height/15,),
              SizedBox(height: 20,),
              card(context),
            ],
            )),
          )
    );
  }
}

Widget card(context,){
  return AspectRatio(aspectRatio: 1.62/2,
  child: SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,color: Colors.blue[200]),
      margin: EdgeInsets.only(left: 30,right: 30),

      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/img_1.png"),
              radius: MediaQuery.sizeOf(context).height/15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 50,),
                TextField(
                  controller: Useremail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                      label: Text("Email"),
                    hintText: "Enter your Email"
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      label: Text("Password"),
                    hintText: 'Enter the password'
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.sizeOf(context).aspectRatio*2000,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                    onPressed: (){}, child: Text("Login"),),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?  "),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup_Page_main()));}, child: Text("SignUp")),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);}