
import 'package:highlight_sevice/highlight_link.dart';

/// For details on how this RegEx works, go to this link.
/// https://regex101.com/r/QN046t/1
/// 

final _userTagRegex = RegExp(
  r'^(.*?)@([\w@]+(?:[.!][\w@]+)*)',
  unicode: true,
  caseSensitive: false,
  dotAll: true,
);

class UserTagLink extends HighlighLink {
  const UserTagLink();

  @override
  List<LinkElement> parse(elements, options) {
    final list = <LinkElement>[];

    for (var element in elements) {
      if (element is TextElement) {
        var match = _userTagRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          if (match.group(2)?.isNotEmpty == true && element.text.isNotEmpty) {
            final temp = element.text.split(' ');
            for (var e in temp) {
              if (e.contains('@')) {
                final arrString = e.split('@');
                if (arrString.isNotEmpty) {
                  final start = element.text.toLowerCase().indexOf(arrString.last.toLowerCase());
                  var text = '';
                  if (start < 0) {
                    text = element.text.substring(0);
                  } else {
                    final end = start + arrString.last.length;
                    text += element.text.substring(start, end);
                  }
                  if (list.isEmpty) {
                    list.add(UserTagElement('@$text'));
                  } else {
                    list.addAll(parse([TextElement(' ')], options));
                    list.add(UserTagElement('@$text'));
                  }
                  
                } else {
                  if (list.isEmpty) {
                    list.add(UserTagElement('@$e'));
                  } else {
                    list.addAll(parse([TextElement(' ')], options));
                    list.add(UserTagElement('@$e'));
                  }
                  
                }
              } else {
                list.addAll(parse([TextElement(list.isEmpty ? e : ' $e')], options));
              }
            }
            
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
class UserTagElement extends LinkableElement {
  final String userTag;

  UserTagElement(this.userTag) : super(userTag, userTag);

  @override
  String toString() {
    return "UserTagElement: '$userTag' ($text)";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url, userTag);

  @override
  bool equals(other) =>
      other is UserTagElement &&
      super.equals(other) &&
      other.userTag == userTag;
}