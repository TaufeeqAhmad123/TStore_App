import 'package:flutter/material.dart';

class Termofuse extends StatelessWidget {
  const Termofuse({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar:AppBar(
        title: const Text('Term of use'),
      ) ,
      body: const Padding(
        padding:  EdgeInsets.only(left: 15, right: 15,bottom: 20),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Term of Use',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text(
                  'These terms and conditions applies to the TStore app appfor mobile devices that was created by Taufeeq Ahmad as a Free service. \n\n Upon downloading or utilizing the Application, you are automatically agreeing to the following terms. It is strongly advised that you thoroughly read and understand these terms prior to using the Application. Unauthorized copying, modification of the Application, any part of the Application, or our trademarks is strictly prohibited. Any attempts to extract the source code of the Application, translate the Application into other languages, or create derivative versions are not permitted. All trademarks, copyrights, database rights, and other intellectual property rights related to the Application remain the property of the Service Provider\n\n The Service Provider is dedicated to ensuring that the Application is as beneficial and efficient as possible. As such, they reserve the right to modify the Application or charge for their services at any time and for any reason. The Service Provider assures you that any charges for the Application or its services will be clearly communicated to you.\n\nThe Application stores and processes personal data that you have provided to the Service Provider in order to provide the Service. It is your responsibility to maintain the security of your phone and access to the Application. The Service Provider strongly advise against jailbreaking or rooting your phone, which involves removing software restrictions and limitations imposed by the official operating system of your device. Such actions could expose your phone to malware, viruses, malicious programs, compromise your phone security features, and may result in the Application not functioning correctly or at all.\nPlease note that the Application utilizes third-party services that have their own Terms and Conditions. Below are the links to the Terms and Conditions of the third-party service providers used by the Application.\n\n Please be aware that the Service Provider does not assume responsibility for certain aspects. Some functions of the Application require an active internet connection, which can be Wi-Fi or provided by your mobile network provider. The Service Provider cannot be held responsible if the Application does not function at full capacity due to lack of access to Wi-Fi or if you have exhausted your data allowance.'),
              SizedBox(height: 15),
              Text(
                'Changes to These Terms and Conditions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text(
                  "The Service Provider may periodically update their Terms and Conditions. Therefore, you are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page.\nThese terms and conditions are effective as of 2024-01-14"),
              SizedBox(height: 15),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text(
                  'If you have any questions or suggestions about the Terms and Conditions, please do not hesitate to contact the Service Provider at panjpir699@gmail.com..'),
                   
            ],
          ),
        ),
      ),
    );
  }
}
