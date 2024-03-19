
import 'package:highlight_sevice/highlight_link.dart';

final _phoneNumberRegex = RegExp(
  r'^(.*?)((tel:)?[+]*[\s/0-9]{8,15})',
  caseSensitive: false,
  dotAll: true,
);

class PhoneLink extends HighlighLink {
  const PhoneLink();

  @override
  List<LinkElement> parse(elements, options) {
    final list = <LinkElement>[];

    for (var element in elements) {
      if (element is TextElement) {
        var match = _phoneNumberRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          final text = element.text.replaceFirst(match.group(0)!, '');

          if (match.group(1)?.isNotEmpty == true) {
            list.add(TextElement(match.group(1)!));
          }

          if (match.group(2)?.isNotEmpty == true) {
            list.add(PhoneElement(
              match.group(2)!.replaceFirst(RegExp(r'tel:'), ''),
            ));
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

/// Represents an element containing a phone number
class PhoneElement extends LinkableElement {
  final String phoneNumber;

  PhoneElement(this.phoneNumber)
      : super(
          phoneNumber,
          'tel:$phoneNumber',
        );

  @override
  String toString() {
    return "PhoneElement: '$phoneNumber' ($text)";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url, phoneNumber);

  @override
  bool equals(other) =>
      other is PhoneElement && phoneNumber == other.phoneNumber;
}