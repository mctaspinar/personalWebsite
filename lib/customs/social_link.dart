import 'package:flutter/material.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:url_launcher/link.dart';

class SocialLink extends StatelessWidget {
  Widget _buildLinkWidget(String url, Color color, String imgPath) {
    return Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank,
        builder: (context, goToLink) {
          return InkWell(
            hoverColor: Colors.brown[400],
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(48),
            onTap: goToLink,
            child: Image.asset(
              "asset/images/$imgPath.png",
              height: 48,
              width: 48,
              color: color,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildLinkWidget(Strings.fb, Colors.blueAccent, "fb"),
      SizedBox(
        width: 12,
      ),
      _buildLinkWidget(Strings.ig, Colors.pink.withOpacity(.6), "ig"),
      SizedBox(
        width: 12,
      ),
      _buildLinkWidget(Strings.tw, Colors.blue.shade400, "twitter"),
      SizedBox(
        width: 12,
      ),
      _buildLinkWidget(Strings.lin, Colors.lightBlue.shade900, "lin"),
      SizedBox(
        width: 12,
      ),
      _buildLinkWidget(Strings.ghub, Colors.black87, "gh"),
    ]);
  }
}
