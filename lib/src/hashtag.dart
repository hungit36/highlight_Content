
import 'package:highlight_sevice/highlight_link.dart';

/// For details on how this RegEx works, go to this link.
/// https://regex101.com/r/QN046t/1
/// 

final _hashTagRegex = RegExp(
  r'^(.*?)#([\w#]+(?:[.!][\w#]+)*)',
  unicode: true,
  caseSensitive: false,
  dotAll: true,
);

class HashTagLink extends HighlighLink {
  const HashTagLink();

  @override
  List<LinkElement> parse(elements, options) {
    final list = <LinkElement>[];

    for (var element in elements) {
      if (element is TextElement) {
        var match = _hashTagRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          var textElement = '';
          var text = element.text.replaceFirst(match.group(0)!, '');
          while (match?.group(1)?.contains(RegExp(r'[\w#]$')) == true) {
            textElement += match!.group(0)!;
            match = _hashTagRegex.firstMatch(text);
            if (match == null) {
              textElement += text;
              text = '';
            } else {
              text = text.replaceFirst(match.group(0)!, '');
            }
          }

          if (textElement.isNotEmpty || match?.group(1)?.isNotEmpty == true) {
            list.add(TextElement(textElement + (match?.group(1) ?? '')));
          }

          if (match?.group(2)?.isNotEmpty == true) {
            list.add(HashTagElement('#${match!.group(2)!}'));
          }

          if (text.isNotEmpty) {
            list.addAll(parse([TextElement(text)], options));
          }
        }
      } else {
        list.add(element);
      }
    }

    return list;
  }
}

/// Represents an element containing an user tag
class HashTagElement extends LinkableElement {
  final String userTag;

  HashTagElement(this.userTag) : super(userTag, userTag);

  @override
  String toString() {
    return "HashTagElement: '$userTag' ($text)";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url, userTag);

  @override
  bool equals(other) =>
      other is HashTagElement &&
      super.equals(other) &&
      other.userTag == userTag;
}