import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:portfolio/app/managers/text_builder_manager.dart';
import 'package:portfolio/app/managers/text_provider_manager.dart';

final textProvider= Provider<ITextBuilder>((ref){

  return TextBuilderManager();
});


final cardTextProvider= Provider<ITextProviderManager>((ref){
 return TextProviderManager();
});

final screenToggleProvider = StateProvider<int>((ref) => 0);