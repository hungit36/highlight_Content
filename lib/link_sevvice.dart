import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<String> domainsList = [".vn",".com.vn",".net.vn",".biz.vn",".edu.vn",".org.vn",".gov.vn",".health.vn",".int.vn",".ac.vn",".pro.vn",".info.vn",".ai.vn",".id.vn",".io.vn",".name.vn",".com",".net",".org",".top",".xyz",".asia",".site",".online",".info",".click",".store",".us",".co.uk",".biz",".bz",".ws",".agency",".bargains",".cheap",".zone",".boutique",".pink",".blue",".red",".farm",".cc",".viajes",".limo",".mobi",".codes",".partners",".ink",".christmas",".blackfriday",".rest",".services",".vision",".fish",".tools",".parts",".industries",".pub",".community",".cleaning",".catering",".cards",".marketing",".holiday",".buzz",".photo",".gift",".guitars",".pics",".webcam",".trade",".bid",".events",".productions",".report",".supply",".supplies",".futbol",".reviews",".wiki",".eu",".dance",".exposed",".democrat",".foundation",".ninja",".condos",".fo",".saarland",".tel",".in",".name",".maison",".com.co",".net.co",".tienda",".flights",".tw",".com.tw",".net.tw",".org.tw",".nom.co",".cruises",".villas",".properties",".social",".rentals",".vacations",".immobilien",".de",".xxx",".works",".expert",".kiwi",".watch",".jp",".cool",".build",".pw",".cn",".mn",".photography",".technology",".com.cn",".markets",".guru",".photos",".bike",".clothing",".holdings",".plumbing",".singles",".ventures",".camera",".equipment",".estate",".gallery",".graphics",".lighting",".contractors",".construction",".directory",".kitchen",".diamonds",".enterprises",".tips",".voyage",".recipes",".careers",".tattoo",".shoes",".sexy",".domains",".systems",".management",".center",".academy",".computer",".support",".email",".solutions",".training",".builders",".ca",".repair",".camp",".glass",".education",".institute",".ceo",".menu",".coffee",".florist",".house",".solar",".international",".dating",".bar",".capital",".engineering",".exchange",".gripe",".moda",".tax",".fund",".furniture",".claims",".finance",".insure",".bayern",".lease",".university",".financial",".healthcare",".clinic",".dental",".surgery",".cash",".discount",".fitness",".digital",".church",".life",".guide",".surf",".beer",".direct",".place",".deals",".associates",".media",".kaufen",".consulting",".town",".toys",".nyc",".fail",".limited",".wtf",".care",".cooking",".country",".fishing",".horse",".rodeo",".vodka",".republican",".vet",".soy",".investments",".credit",".accountants",".loans",".schule",".gratis",".city",".reisen",".desi",".hiphop",".creditcard",".global",".nagoya",".tokyo",".yokohama",".pictures",".rocks",".audio",".juegos",".actor",".haus",".scot",".london",".vegas",".network",".sg",".com.sg",".com.au",".net.au",".io",".cymru",".wales",".business",".rip",".football",".run",".diet",".help",".band",".video",".news",".world",".how",".gifts",".sarl",".market",".engineer",".hosting",".property",".casa",".yoga",".immo",".auction",".software",".rehab",".gives",".forsale",".money",".party",".science",".flowers",".chat",".style",".school",".wedding",".fashion",".garden",".fit",".plus",".sale",".army",".navy",".airforce",".express",".cafe",".team",".show",".dog",".date",".faith",".review",".love",".accountant",".download",".loan",".racing",".win",".lol",".quebec",".attorney",".lawyer",".dentist",".irish",".mortgage",".degree",".restaurant",".ltd",".delivery",".pizza",".coach",".memorial",".legal",".poker",".design",".apartments",".bingo",".tennis",".golf",".tours",".jewelry",".theater",".taxi",".hockey",".paris",".cricket",".green",".bio",".physio",".best",".energy",".tires",".adult",".porn",".archi",".gold",".reise",".casino",".sucks",".live",".college",".fans",".rent",".wine",".vin",".salon",".feedback",".tickets",".game",".mom",".theatre",".car",".auto",".games",".family",".hiv",".protection",".reit",".security",".cars",".group",".observer",".realty",".fm",".men",".stream",".blog",".uk",".eu.com",".cab",".charity",".coupons",".doctor",".fyi",".gmbh",".hospital",".jetzt",".mba",".movie",".shopping",".soccer",".studio",".travel",".co.com",".br.com",".cn.com",".ru.com",".sa.com",".jpn.com",".za.com",".gb.net",".uk.com",".uk.net",".us.com",".ae.org",".us.org",".se.net",".gr.com",".hu.net",".de.com",".com.de",".jp.net",".in.net",".mex.com",".com.se",".radio.fm",".radio.am",".ooo",".storage",".miami",".law",".abogado",".boston",".gd",".vg",".fan",".ac",".bet",".pet",".promo",".llc",".ski",".lotto",".organic",".kim",".black",".lgbt",".shiksha",".app",".voto",".vote",".motorcycles",".boats",".autos",".yachts",".homes",".gay",".forum",".beauty",".hair",".makeup",".quest",".skin",".luxury",".coop",".uno",".cfd",".it",".dev",".qpon",".spa",".sh",".sbs",".kids",".giving",".lat",".dealer",".inc",".broker",".forex",".trading",".net.sg",".org.au",".au",".org.sg",".ai",".com.ai",".net.ai",".org.ai",".net.cn",".org.cn",".lc",".org.uk",".me.uk",".fr",".id",".hk",".day",".boo",".page",".rsvp",".dad",".foo",".ing",".meme",".mov",".nexus",".zip",".esq",".phd",".prof",".pr",".sc",".vc",".watches",".co.in",".compare",".select",".website",".link",".one",".me",".work",".contact",".vip",".club",".monster",".tv",".cam",".pro",".co",".today",".company",".host",".press",".space",".tech",".cloud",".fun",".art",".baby",".land",".icu",".cyou",".bond",".study",".luxe"];

final _looseUrlRegex = RegExp(
  r'''^(.*?)((https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//="'`]*))''',
  caseSensitive: false,
  dotAll: true,
);

final _protocolIdentifierRegex = RegExp(
  r'^(https?:\/\/)',
  caseSensitive: false,
);

final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+([a-zA-Z0-9]{2,})");
final _phoneNumberRegex = RegExp(
  r'^(.*?)((tel:)?[+]*[\s/0-9]{8,15})',
  caseSensitive: false,
  dotAll: true,
);

final _userTagRegex = RegExp(
  r'^(.*?)@([\w@]+(?:[.!][\w@]+)*)',
  unicode: true,
  caseSensitive: false,
  dotAll: true,
);

final _hashTagRegex = RegExp(
  r'^(.*?)#([\w#]+(?:[.!][\w#]+)*)',
  unicode: true,
  caseSensitive: false,
  dotAll: true,
);

abstract class LinkElement {
  final String text;
  final bool isTag;

  LinkElement(this.text, [bool? isTag])
      : isTag = isTag ?? false;

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, isTag);

  bool equals(other) => other is LinkElement && other.text == text;
}

class LinkableElement extends LinkElement {
  final String url;

  LinkableElement(String? text, this.url, [bool? isTag])
      : super(text ?? url, isTag);

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, isTag, url);

  @override
  bool equals(other) =>
      other is LinkableElement && super.equals(other) && other.url == url;
}

/// Represents an element containing text
class TextElement extends LinkElement {
  TextElement(super.text);

  @override
  String toString() {
    return "TextElement: '$text'";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, isTag);

  @override
  bool equals(other) => other is TextElement && super.equals(other);
}

class LinkOptions {
  /// Show user tag.
  final bool showUserTag;

  /// Show hashtag
  final bool showHashTag;

  /// Show email
  final bool showEmail;

  /// Show phone number
  final bool showPhoneNumber;

  /// Show url
  final bool showUrl;

  /// Enables loose URL parsing (any string with "." is a URL).
  final bool looseUrl;

  /// When used with [looseUrl], default to `https` instead of `http`.
  final bool defaultToHttps;

  /// Excludes `.` at end of URLs.
  final bool excludeLastPeriod;

  const LinkOptions({
    this.showUserTag = true,
    this.showHashTag = true,
    this.showEmail = true,
    this.showPhoneNumber = true,
    this.showUrl = true,
    this.looseUrl = false,
    this.defaultToHttps = false,
    this.excludeLastPeriod = true,
  });
}

/// Callback clicked link
typedef LinkCallback = void Function(LinkableElement link);

/// Turns URLs into links
class LinkService extends StatefulWidget {
  /// Text to be linkified
  final String text;

  /// Callback for tapping a link
  final LinkCallback? onOpen;

  /// link's options.
  final LinkOptions options;

  // TextSpan

  /// Style for non-link text
  final TextStyle? style;

  /// Style of link text
  final TextStyle? linkStyle;

  // Text.rich

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// Text direction of the text
  final TextDirection? textDirection;

  /// The maximum number of lines for the text to span, wrapping if necessary
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel
  final double textScaleFactor;

  /// Whether the text should break at soft line breaks.
  final bool softWrap;

  /// The strut style used for the vertical layout
  final StrutStyle? strutStyle;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale
  final Locale? locale;

  /// Defines how to measure the width of the rendered text.
  final TextWidthBasis textWidthBasis;

  /// Defines how the paragraph will apply TextStyle.height to the ascent of the first line and descent of the last line.
  final TextHeightBehavior? textHeightBehavior;

  final bool useMouseRegion;

  const LinkService({
    super.key,
    required this.text,
    this.onOpen,
    this.options = const LinkOptions(),
    // TextSpan
    this.style,
    this.linkStyle,
    // RichText
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.softWrap = true,
    this.strutStyle,
    this.locale,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.useMouseRegion = true,
  });

  @override
  State<LinkService> createState() => _State();
}

  class _State extends State<LinkService> {

    @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final elements = getHighLightOfText(widget.text);

    return Text.rich(
      buildTextSpan(
        elements,
        style: widget.style ?? Theme.of(context).textTheme.bodyMedium,
        onOpen: widget.onOpen,
        useMouseRegion: widget.useMouseRegion,
        linkStyle: (widget.style ?? Theme.of(context).textTheme.bodyMedium)
            ?.copyWith(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            )
            .merge(widget.linkStyle),
      ),
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      softWrap: widget.softWrap,
      strutStyle: widget.strutStyle,
      locale: widget.locale,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
    );
  }

  bool hasDomain(String text) {
  if(text.isEmpty) return false;
  if(domainsList.isEmpty) return false;
  if(_emailRegex.hasMatch(text)) return false;
  final domain = domainsList.firstWhereOrNull((element) => text.toLowerCase().contains(element.toLowerCase()));
  if (domain == null) return false;
  final temps = domain.split('.');
  for (var temp in temps) {
    temp = '.$temp';
    if (temp.isNotEmpty && domainsList.firstWhereOrNull((element) => temp.toLowerCase() == element.toLowerCase()) != null) {
      return true;
    }
  }
  return false;
}

  List<LinkElement> getHighLightOfText (String input) {
    List<LinkElement> items = [];
    final temps = input.split(' ');
    for (var temp in temps) {
      if(temp.contains('\n')) {
        final array = temp.split('\n');
        for (var e in array) {
          _convertToLink(e, items, '\n');
        }
      } else {
        _convertToLink(temp, items,' ');
      }
    }
    return items;
  }

  void _convertToLink(String temp, List<LinkElement> items, String beforeCharecter) {
    //url
    if(widget.options.showUrl && _emailRegex.firstMatch(temp) == null && _looseUrlRegex.firstMatch(temp) != null) {
      var match = _looseUrlRegex.firstMatch(temp);
      final text = temp.replaceFirst(match!.group(0)!, '');

        if (match.group(1)?.isNotEmpty == true && text.isNotEmpty) {
          if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
          items.add(TextElement(match.group(1)!));
        }

        if (match.group(2)?.isNotEmpty == true) {
          var originalUrl = match.group(2)!;
          var originText = originalUrl;
          if(hasDomain(originText) || text.startsWith(_protocolIdentifierRegex)) {
            if (!originalUrl.startsWith(_protocolIdentifierRegex)) {
              originalUrl = (widget.options.defaultToHttps ? "https://" : "http://") +
                  originalUrl;
            }
            if (items.isNotEmpty) {
                items.add(TextElement(beforeCharecter));
              }
              items.add(LinkableElement(temp, originalUrl));
            
          }  else if (originText.isNotEmpty) {
            if (items.isNotEmpty) {
              items.add(TextElement(beforeCharecter));
            }
            items.add(TextElement(originText));
          }
        } else {
          if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
          items.add(TextElement(temp));
        }
    } else if(widget.options.showEmail && _emailRegex.firstMatch(temp) != null) {
      //email
      if (items.isNotEmpty) {
        items.add(TextElement(beforeCharecter));
      }
      // Always humanize emails
      items.add(LinkableElement(
        temp,
        'mailto:$temp',
      ));
    } else if(widget.options.showPhoneNumber && _phoneNumberRegex.firstMatch(temp) != null) {
      //phone
      var match = _phoneNumberRegex.firstMatch(temp);
      final text = temp.replaceFirst(match!.group(0)!, '');

      if (match.group(1)?.isNotEmpty == true) {
        if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
        items.add(TextElement(match.group(1)!));
      }

      if (match.group(2)?.isNotEmpty == true) {
        if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
        items.add(LinkableElement(text,
          match.group(2)!.replaceFirst(RegExp(r'tel:'), ''),
        ));
      }else  {
        if (items.isNotEmpty) {
          items.add(TextElement(beforeCharecter));
        }
          items.add(TextElement(temp));
      }
    } else if(widget.options.showUserTag && _userTagRegex.firstMatch(temp) != null) {
      //uaser tag
      var match = _userTagRegex.firstMatch(temp);

      if (match?.group(2)?.isNotEmpty == true && temp.isNotEmpty) {
          final temp1 = temp.split(' ');
          for (var e in temp1) {
            if (e.contains('@')) {
              final arrString = e.split('@');
              if (arrString.isNotEmpty) {
                final start = temp.toLowerCase().indexOf(arrString.last.toLowerCase());
                var text = '';
                if (start < 0) {
                  text = '@${temp.substring(0)}';
                } else {
                  final end = start + arrString.last.length;
                  text += '@${temp.substring(start, end)}';
                }
                if (items.isEmpty) {
                  items.add(LinkableElement(text,'@$text',true));
                } else {
                  items.add(TextElement(' '));
                  items.add(LinkableElement(text,'@$text',true));
                }
                
              } else {
                if (items.isEmpty) {
                  items.add(LinkableElement(e,'@$e',true));
                } else {
                  items.add(TextElement(' '));
                  items.add(LinkableElement(e,'@$e',true));
                }
                
              }
            } else {
              items.add(TextElement(items.isEmpty ? e : ' $e'));
            }
          }
          
        } else {
        if (items.isNotEmpty) {
          items.add(TextElement(beforeCharecter));
        }
          items.add(TextElement(temp));
        }
    } else if (widget.options.showHashTag && _hashTagRegex.firstMatch(temp) != null) {
      //hash tag
      var match = _hashTagRegex.firstMatch(temp);

      var textElement = '';
        var text = temp.replaceFirst(match!.group(0)!, '');
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
          if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
          items.add(TextElement(textElement + (match?.group(1) ?? '')));
        }

        if (match?.group(2)?.isNotEmpty == true) {
          if (items.isNotEmpty) {
            items.add(TextElement(beforeCharecter));
          }
          items.add(LinkableElement(match!.group(2)!,'#${match.group(2)!}',true));
        }

        if (text.isNotEmpty) {
          items.add(TextElement(text));
        }
    } else {
      if (items.isNotEmpty) {
        items.add(TextElement(beforeCharecter));
      }
      items.add(TextElement(temp));
    }
  }
}

class LinkableSpan extends WidgetSpan {
  LinkableSpan({
    required MouseCursor mouseCursor,
    required InlineSpan inlineSpan,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor,
            child: Text.rich(
              inlineSpan,
            ),
          ),
        );
}

/// Raw TextSpan builder for more control on the RichText
TextSpan buildTextSpan(
  List<LinkElement> elements, {
  TextStyle? style,
  TextStyle? linkStyle,
  LinkCallback? onOpen,
  bool useMouseRegion = false,
}) =>
    TextSpan(
      children: buildTextSpanChildren(
        elements,
        style: style,
        linkStyle: linkStyle,
        onOpen: onOpen,
        useMouseRegion: useMouseRegion,
      ),
    );

/// Raw TextSpan builder for more control on the RichText
List<InlineSpan>? buildTextSpanChildren(
  List<LinkElement> elements, {
  TextStyle? style,
  TextStyle? linkStyle,
  LinkCallback? onOpen,
  bool useMouseRegion = false,
}) =>
    [
      for (var element in elements)
        if (element is LinkableElement)
          TextSpan(
            text: element.text,
            style: linkStyle,
            recognizer: onOpen != null
                ? (TapGestureRecognizer()..onTap = () => onOpen(element))
                : null,
            mouseCursor: useMouseRegion ? SystemMouseCursors.click : null,
          )
        else
          TextSpan(
            text: element.text,
            style: style,
          ),
    ];
