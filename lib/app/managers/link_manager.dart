import 'package:erfan_portfolio/app/interfaces/i_link_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkManager implements ILinkManager{
 

  @override
  Future<void> openExternalWebsite(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  
}