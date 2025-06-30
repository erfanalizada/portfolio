import 'package:erfan_portfolio/app/interfaces/i_navigation_manager.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_builder.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:erfan_portfolio/app/managers/navigation_manager.dart';
import 'package:erfan_portfolio/app/managers/text_builder_manager.dart';
import 'package:erfan_portfolio/app/managers/text_provider_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider= Provider<ITextBuilder>((ref){

  return TextBuilderManager();
});


final cardTextProvider= Provider<ITextProviderManager>((ref){
 return TextProviderManager();
});

final navigationManagerProvider= Provider<INavigationManager>((ref){
return NavigationManager();

});

