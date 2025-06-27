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
      'Ai fundumnetals and impact on society: ': [
        'Awarness on impact of ai tools on\n   society',
        'Learned how to train a basic model',
      ],
    });
  }
  
  @override
  Map<String, List<String>> cyberSecurityText() {
    return(  {
      'Cyber Security Specialization:': [
        'Learned about OWASP vunrebilities',
        'Practiced hacking tricks on DVWA',
        'learned how to avoid code breaches',
        'Created BOK(process documentation)'
      ],
    });
  }
  
  @override
  Map<String, List<String>> languagesSpoken() {
    return(  {
      'Languages i speak:': [
        'Dutch(Fluent)',
        'English(Fluent)',
        'Persian(Native)',
        'Dari(Native)'
      ],
    });
  }


  
}