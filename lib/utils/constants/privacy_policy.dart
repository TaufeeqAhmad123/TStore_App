import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text('Privacy Policy'),
      ) ,
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
             // Text('Privacy Policy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 7),
              Text('This privacy policy applies to the TStore App app for mobile devices that was created by Taufeeq Ahmad as a Free service. This service is intended for use "AS IS".'),
                  SizedBox(height: 15),
              Text('Information Collection and Use', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 7),
              Text("The Application collects information when you download and use it. This information may include information such as \n Your device's Internet Protocol address (e.g. IP address) \n The pages of the Application that you visit, the time and date of your visit, the time spent on those pages \n The time spent on the Application \n The operating system you use on your mobile device \n The Application does not gather precise information about the location of your mobile device. \n\n The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.\n For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information, including but not limited to Email,name,phone number,gender ,location , . The information that the Service Provider request will be retained by them and used as described in this privacy policy."),
               SizedBox(height: 15),
               Text('Opt-Out Rights', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(height: 7),
              Text('You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.'),
                  SizedBox(height: 15),
              Text('Data Retention Policy, Managing Your Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
               SizedBox(height: 7),
              Text('If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at panjpir699@gmail.com.')
          
            ],
          
          ),
        ),
      ),
    );
  }
}