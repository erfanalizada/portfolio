
import 'package:erfan_portfolio/app/interfaces/i_text_builder.dart';

class TextBuilderManager implements ITextBuilder {

@override
String buildUnorderedList(Map<String, List<String>> data) {
  final StringBuffer buffer = StringBuffer();

  final title = data.keys.first;
  final items = data.values.first;

  buffer.writeln(title);
  buffer.writeln(); // blank line after the title

  for (final item in items) {
  buffer.writeln(" • $item");
  }

  return buffer.toString();
}


}