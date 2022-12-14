import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_intune/ui/updateProfile.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
          title: const Text("Profile"),
      ),

      body: Column(
        children: <Widget>[
          const SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Center(
                  child: Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),

          //Account Settings
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child:
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UpdateProfile();},),),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade100),
                ),
                child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                          "Update Account",
                          style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 2,
                              color: Colors.black
                          ),
                        )
                      ),
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black
                      )]
                ),
              )
          ),

          //Uploaded Sheets
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child:
              ElevatedButton(
                onPressed: () => {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) {
                 //   return const UpdateProfile();},),),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade100),
                ),
                child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                            "Uploaded Sheets",
                            style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 2,
                                color: Colors.black
                            ),
                          )
                      ),
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black
                      )
                    ]
                ),
              )
          ),

          //Created Sheets
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child:
              ElevatedButton(
                onPressed: () => {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) {
                   // return const UpdateProfile();},),),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade100),
                ),
                child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                            "Created Sheets",
                            style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 2,
                                color: Colors.black
                            ),
                          )
                      ),
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black
                      )
                    ]
                ),
              )
          ),
          const SizedBox(height: 50,),

          //Log Out
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child:
              ElevatedButton(
                key: Key("SignOut"),
                onPressed: () => {
                  FirebaseAuth.instance.signOut(),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade100),
                ),
                child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 2,
                                color: Colors.red
                            ),
                          )
                      ),
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red
                      )
                    ]
                ),
              )
          ),

          //Delete Account
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child:
              ElevatedButton(
                key: Key("Delete"),
                onPressed: () =>{
                  FirebaseAuth.instance.currentUser!.delete(),
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Account Deleted"),),),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade900),
                ),
                child: Row(
                    children: const [
                       Expanded(
                          child: Text(
                            "Delete Account",
                            style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 2,
                                color: Colors.white
                            ),
                          )
                      ),
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                      )
                    ]
                ),
              )
          )
        ],
      ),
    );
  }
}

