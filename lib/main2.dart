import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future sendEmail() async {
  final email = "email";
  final SmtpServer = gmailSaslXoauth2(userEmail, accessToken);
  final message = Message()
    ..from Address(email, 'name');
    ..recipients = ['email'];
    ..subject = "Package Arrival";
    ..text = "Your package has arrived, please get it in the main office";

    try{
      await send(message, SmtpServer);
      showSnackBar('Sent email successfully!');
    } 
}
