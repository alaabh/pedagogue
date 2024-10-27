import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/widget/loading_widget.dart';
import 'card_player_widget.dart';

class OneJoueurPage extends StatefulWidget {
  final Player? player;
  const OneJoueurPage({super.key, this.player});

  @override
  State<OneJoueurPage> createState() => _OneJoueurPageState();
}

class _OneJoueurPageState extends State<OneJoueurPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.playerInformations)),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  imageUrl:
                      "https://sportspedagogue.com/wp-content/uploads/2022/10/football-player.png",
                  imageBuilder: (context, imageProvioder) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvioder, fit: BoxFit.fill),
                      ),
                    );
                  },
                  placeholder: (context, url) => const SizedBox(
                    height: 250,
                    width: 164,
                    child: Center(child: LoadingWidget()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Text(
                    "Mr.${widget.player!.firstName} ${widget.player!.lastName}"),
                Text(
                    "${intl.address}: ${widget.player!.address}, ${widget.player!.city}, ${widget.player!.zipCode} ,${widget.player!.country}"),
                Text("${intl.email}:${widget.player!.email}"),
                Text("Tel :${widget.player!.mobile}"),
                Text(
                  "${intl.informationfamily}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "${intl.situationFamilly} :${widget.player!.situation_family_en}"),
                    Text(
                        "${intl.situationProfessionel}  :${widget.player!.situation_professionel_en}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "${intl.nameFadher}  :${widget.player!.fadherFirstName} ${widget.player!.fadherLastName}"),
                    Text(
                        "${intl.nameMother}  :${widget.player!.motherFirstName} ${widget.player!.motherLastName}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${intl.birthdate}  :${widget.player!.birthdate} "),
                    Text("${intl.birthPlace}   :${widget.player!.birthplace} "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${intl.post}  :${widget.player!.post_en}"),
                  ],
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/victoire.54b32be.jpeg",
                  title: "${intl.victoire}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/defeat.02e535a.webp",
                  title: "${intl.defeat}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/null.2422776.webp",
                  title: "Null",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/red_card.958267c.jpeg",
                  title: "${intl.redCard}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/yellow_card.cddc1d8.webp",
                  title: "${intl.yellowCard}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/matches_played.8244348.jpeg",
                  title: "${intl.matchesPlayed}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/goals_scored%20.6695fab.jpeg",
                  title: "${intl.scorer}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/injured.6a672f8.png",
                  title: "${intl.injured}",
                  number: "0",
                ),
                CardPlayerWidget(
                  imgUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/absence.2f60a17.png",
                  title: "${intl.presence}",
                  number: "0",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
