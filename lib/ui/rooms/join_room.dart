// //import 'package:capstone_project_intune/Helpers/text_styles.dart';
// import 'package:capstone_project_intune/Helpers/utils.dart';
// import 'package:capstone_project_intune/video_call.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class JoinRoom extends StatelessWidget {
//   final TextEditingController roomTxtController = TextEditingController();
//
//   FirebaseDatabase database = FirebaseDatabase.instance; // Instance of DB
//   FirebaseAuth auth = FirebaseAuth.instance; // Instance of Auth
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       title: Text("Join Room"),
//       content: ListView(
//         shrinkWrap: true,
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: roomTxtController,
//             decoration: InputDecoration(
//                 hintText: "Enter room id to join",
//                 focusedBorder: OutlineInputBorder(
//                     borderSide:
//                     BorderSide(color: const Color(0xFF1A1E78), width: 2)),
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide:
//                     BorderSide(color: const Color(0xFF1A1E78), width: 2))),
//             style: const TextStyle(
//                 color: Colors.black87,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           FloatingActionButton(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//             //color: const Color(0xFF1A1E78),
//             onPressed: () async {
//               if (roomTxtController.text.isNotEmpty) {
//                 bool isPermissionGranted =
//                 await handlePermissionsForCall(context);
//                 if (isPermissionGranted) { // Start Call
//                   addUserToDatabase(roomTxtController.text); // add user to room in database
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => VideoCallScreen(
//                             channelName: roomTxtController.text,
//                           )));
//                 } else {
//                   Get.snackbar("Failed", "Enter Room-Id to Join.",
//                       backgroundColor: Colors.white,
//                       colorText: Color(0xFF1A1E78),
//                       snackPosition: SnackPosition.BOTTOM);
//                 }
//               } else {
//                 Get.snackbar(
//                     "Failed", "Microphone Permission Required for Video Call.",
//                     backgroundColor: Colors.white,
//                     colorText: Color(0xFF1A1E78),
//                     snackPosition: SnackPosition.BOTTOM);
//               }
//             },
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.arrow_forward, color: Colors.white),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   "Join Room",
//                   style: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void addUserToDatabase(String roomID) async
//   {
//     // DatabaseReference db = database.ref(); // get reference to read and write
//     final user = auth.currentUser; // get current user
//     final userID;
//     final rID = roomID;
//
//     if (user == null)
//     {
//       print ("FirebaseAuth Error, create_room.dart, line 125: Mo current user");
//     }
//     else
//     {
//       userID = user.uid; // get User ID of current user
//
//       // Create entry in rooms of named after roomId
//       final roomRef = database.ref("rooms/$rID"); // rooms/${rID} ?
//
//       // Write data into that entry
//       await roomRef.update({
//         "user_$userID":{ // add field for user
//           "uid" : userID // save userID, might be redundant, probably is
//         },
//       }); // set
//     }
//   }
//
// }