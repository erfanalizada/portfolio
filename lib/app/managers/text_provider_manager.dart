import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';

class TextProviderManager implements ITextProviderManager{
  @override
  Map<String, List<String>> customTimePickerText() {
    
  return( 
   {
      'custom_time_picker_erfan: ': [
        'This flutter package offers a modern\n   advanced time picker widget that\n   has validations included with date ',
      ],
    });
  }

  @override
  Map<String, List<String>> flutterThemeChangerText() {
  return(  {
      'flutter_theme_changer_erfan:': [
        'This flutter package allows users\n   to implement a widget that allows\n   dynamic theme changes.',
      ],
    });
  }

  @override
  Map<String, List<String>> youtubeDonwloaderText() {
  return(  {
      'youtube_muxer_2025:': [
        'Allows you to download and mux\n   YouTube video and audio streams\n   into a single video file.',
        'Support for multiple qualities.',
        'Platform-specific permission\n   handling.',
        ],
    });
  }
  
  @override
  Map<String, List<String>> aiForSocietyText() {
  return(  {
      'Ai fundumnetals and impact on society': [
        'Awarness on impact of ai tools on society',
        'Learned how to train a basic model \n  for student grade prediction',
        'Learned basic data analyzation',
      ],
    });
  }
  
  @override
  Map<String, List<String>> cyberSecurityText() {
    return(  {
      'Cyber Security Specialization:': [
        'Learned about OWASP vunrebilities',
        'Practiced hacking tricks on DVWA',
        'Learned what counts as a risk and\n   how to take care of them while\n   developing a product',
      ],
    });
  }


  
}