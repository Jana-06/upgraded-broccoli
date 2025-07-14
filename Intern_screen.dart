import 'package:flutter/material.dart';
import 'package:internship_dp_flutter/Screens/login_user.dart';

class InternList extends StatefulWidget {
  const InternList({super.key});

  @override
  State<InternList> createState() => _InternListState();
}

class _InternListState extends State<InternList> {

  @override
  int _selectedindex =0;
  final List<Widget> _widgetOption = [
    HomeScreen(),
    Jobs(),
    Personal(),
    Notifications()
  ];
  void _onitemtapped(int index) {
    setState(() =>
      _selectedindex = index
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        Builder(builder: (context) {
        return IconButton(
          icon: Icon(Icons.menu), onPressed: () {
          Scaffold.of(context).openDrawer();
          },);})
      ),
      body: Center(
        child: _widgetOption[_selectedindex],
      ),
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.green,
        items: const[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'jobs',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Network',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_active),
            label: 'Notification',
            backgroundColor: Colors.black)
      ],
        currentIndex: _selectedindex,
        onTap: _onitemtapped,
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/Des-3_logo.png'))
                ),
                child:
                Text(
                  "",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () {
                print("home button pressed");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Details"),
              onTap: () {
                print("home button pressed");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("logout"),
              onTap: () {
                showDialog(context: context, builder: (context)=>AlertDialog(
                  title: Text("Logout Action"),
                  content: Text("Confirm logout?"),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page_main()));
                      //SignUpController.instance.logout();
                    }, child: Text("confirm",style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),)
                  ],
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget UiIntern(title,company,description,stipend){
  return AspectRatio(aspectRatio: 3.62/1,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(5)
    ),
    child: Column(
      children: [
        Text("$title"),
        Text("$company"),
        Text("$description"),
        Text("$stipend"),
      ],
    ),
  ),
  );
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text("Interships Available"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for(int i = 0;i<=3;i++)
              Column(
                children: [
                  UiIntern('Appdev','Google','Eff. app dev',"2000"),
                  SizedBox(height: 5,)
                ],
              ),
          ],
        ),
      ),
    );
  }
}
class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("network"),
      ),
    );
  }
}
class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Jobs"),
      ),
    );
  }
}
class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Notification"),
      ),
    );
  }
}

