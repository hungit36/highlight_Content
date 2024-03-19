import './src/email.dart';
import './src/url.dart';

export './src/hashtag.dart'
    show HashTagLink, HashTagElement;
export './src/email.dart' show EmailLink, EmailElement;
export './src/url.dart' show UrlLink, UrlElement;
export './src/user_tag.dart'
    show UserTagLink, UserTagElement;
export './src/phone.dart'
    show PhoneLink, PhoneElement;

abstract class LinkElement {
  final String text;
  final String originText;

  LinkElement(this.text, [String? originText])
      : originText = originText ?? text;

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText);

  bool equals(other) => other is LinkElement && other.text == text;
}

class LinkableElement extends LinkElement {
  final String url;

  LinkableElement(String? text, this.url, [String? originText])
      : super(text ?? url, originText);

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url);

  @override
  bool equals(other) =>
      other is LinkableElement && super.equals(other) && other.url == url;
}

/// Represents an element containing text
class TextElement extends LinkElement {
  TextElement(String text) : super(text);

  @override
  String toString() {
    return "TextElement: '$text'";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText);

  @override
  bool equals(other) => other is TextElement && super.equals(other);
}

abstract class HighlighLink {
  const HighlighLink();

  List<LinkElement> parse(
      List<LinkElement> elements, LinkOptions options);
}

class LinkOptions {
  /// Removes http/https from shown URLs.
  final bool humanize;

  /// Removes www. from shown URLs.
  final bool removeWww;

  /// Enables loose URL parsing (any string with "." is a URL).
  final bool looseUrl;

  /// When used with [looseUrl], default to `https` instead of `http`.
  final bool defaultToHttps;

  /// Excludes `.` at end of URLs.
  final bool excludeLastPeriod;

  const LinkOptions({
    this.humanize = true,
    this.removeWww = false,
    this.looseUrl = false,
    this.defaultToHttps = false,
    this.excludeLastPeriod = true,
  });
}

const _urlHighlighLink = UrlLink();
const _emailHighlighLink = EmailLink();
const defaultHighlighLinks = [_urlHighlighLink, _emailHighlighLink];

/// Turns [text] into a list of [LinkElement]
///
/// Use [humanize] to remove http/https from the start of the URL shown.
/// Will default to `false` (if `null`)
///
/// Uses [linkTypes] to enable some types of links (URL, email).
/// Will default to all (if `null`).
List<LinkElement> link(
  String text, {
  LinkOptions options = const LinkOptions(),
  List<HighlighLink> highlighLinks = defaultHighlighLinks,
}) {
  var list = <LinkElement>[TextElement(text)];

  if (text.isEmpty) {
    return [];
  }

  if (highlighLinks.isEmpty) {
    return list;
  }

  for (var highlighLink in highlighLinks) {
    list = highlighLink.parse(list, options);
  }

  return list;
}