//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:internship_dp_flutter/Screens/Intern_screen.dart';

class Signup_Page_main extends StatefulWidget {
  const Signup_Page_main({super.key});

  @override
  State<Signup_Page_main> createState() => _Login_Page_mainState();
}

TextEditingController Useremail = TextEditingController();
TextEditingController Username = TextEditingController();
class _Login_Page_mainState extends State<Signup_Page_main> {

  List<String> classification = [];
  final _medicationsController = TextEditingController();
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
            )
        ),
        )
    );
  }
  Widget card(context){
    return AspectRatio(aspectRatio: 0.82/1.50,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,color: Colors.blue[200]),
          margin: EdgeInsets.only(left: 30,right: 30),

          child:Padding(
            padding: const EdgeInsets.all(14.0),
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
                      controller: Username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          label: Text("Name"),
                          hintText: "Enter your Full Name"
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10,),
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
                    _buildChipsSection(
                      title: 'Role',
                      description: 'Please Select a role',
                      chips: classification,
                      onAdd: (value) {
                        if (value.isNotEmpty && !classification.contains(value)) {
                          setState(() =>classification.add(value));
                          _medicationsController.clear();
                        }
                      },
                      controller: _medicationsController,
                      suggestions: const [
                        "Intern",
                        "Recruiter",
                        "Job Seeker"
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).aspectRatio*2000,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>InternList()));}, child: Text("Signup"),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?  "),
                        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Login")),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isRequired = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: isRequired
          ? (value) => value?.isEmpty ?? true ? 'Required field' : null
          : null,
      onTap: onTap,
    );
  }

  Widget _buildChipsSection({
    required String title,
    required String description,
    required List<String> chips,
    required Function(String) onAdd,
    required TextEditingController controller,
    required List<String> suggestions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        if (chips.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips.map((item) => Chip(
              label: Text(item),
              backgroundColor: Colors.blue[50],
              deleteIcon: Icon(Icons.close, size: 18),
              onDeleted: () => setState(()  => chips.remove(item)),
            )).toList(),
          ),
        const SizedBox(height: 12),

        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestions.map((item) => FilterChip(
            label: Text(item),
            selected: chips.contains(item),
            onSelected: (selected) {
              if (selected && !chips.contains(item)) {
                  setState(()=> chips.add(item));
              } else {
                setState(() => chips.remove(item));
              }
            },
            selectedColor: Colors.blue[100],
            checkmarkColor: Colors.blue[800],
            labelStyle: TextStyle(
              color: chips.contains(item) ? Colors.blue[800] : Colors.grey[700],
            ),
          )).toList(),
        ),
      ],
    );
  }
}

