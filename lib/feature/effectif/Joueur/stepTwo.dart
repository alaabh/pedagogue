import 'package:flutter/material.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';

class stepTwo extends StatefulWidget {
  final Player? player;
  TextEditingController? addressController;

  TextEditingController? cityController;

  TextEditingController? emailController;
  TextEditingController? ZipCodeController;

  TextEditingController? phoneController;
  TextEditingController? countryController;

  stepTwo({
    super.key,
    this.player,
    this.addressController,
    this.cityController,
    this.emailController,
    this.ZipCodeController,
    this.phoneController,
    this.countryController,
  });

  @override
  State<stepTwo> createState() => _stepTwoState();
}

class _stepTwoState extends State<stepTwo> {
  final _formKey = GlobalKey<FormState>();
  final JoueurController joueurController = JoueurController();

  /* Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Player player = Player(
      id: widget.player?.id,
      address: _addressController.text,
      city: _cityController.text,
      email: _emailController.text,
      zipCode: _ZipCodeController.text,
      mobile: _phoneController.toString(),
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.player != null
          ? joueurController.update(player)
          : joueurController.add(player),
      successFunction: () => Navigator.pop(context),
    );
  } */

  @override
  void initState() {
    widget.countryController = TextEditingController(
        text: getValueForKey(widget.countryController!.text, countries));

    // TODO: implement initState
    for (var country in countries) {
      countryList!.add(country.values.first.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String>? countryList = [];
  String getKeyForValue(String? value, List<Map<String, String>> list) {
    for (var map in list) {
      for (var entry in map.entries) {
        if (entry.value == value) {
          return entry.key;
        }
      }
    }
    return "";
  }

  String getValueForKey(String? key, List<Map<String, String>> list) {
    for (var map in list) {
      for (var entry in map.entries) {
        if (entry.key == key) {
          return entry.value;
        }
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimensions.verticalSpacingSmall,
            Text(
              intl.address,
              /*style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                letterSpacing: 1.2, // Optional: Adjust letter spacing
              ),*/
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.addressController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.city,
              /* style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                letterSpacing: 1.2, // Optional: Adjust letter spacing
              ),*/
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.cityController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.email,
              /*style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                letterSpacing: 1.2, // Optional: Adjust letter spacing
              ),*/
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.emailController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.zipCode,
              /*style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                letterSpacing: 1.2, // Optional: Adjust letter spacing
              ),*/
            ),
            Dimensions.verticalSpacingSmall,
            CustomTextField(
              hintText: '',
              labelText: ' ',
              controller: widget.ZipCodeController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            Text(
              intl.country,
              /*style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                // You can add more styling properties as needed
              ),*/
            ),
            CustomInput(
              inputType: InputType.dropdown,
              dropdownItems: countryList,
              controller: widget.countryController,
            ),

            Dimensions.verticalSpacingSmall,
            Text(
              intl.mobile,
              /* style: GoogleFonts.lato(
                // Replace with your desired Google Font
                fontSize: 16.0, // Replace with your desired font size
                color: AppColors.accentColor, // Replace with your desired color
                // You can add more styling properties as needed
              ),*/
            ),
            CustomTextField(
              hintText: '',
              labelText: '',
              controller: widget.phoneController, // Pass the controller here
            ),
            Dimensions.verticalSpacingSmall,
            // _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> countries = [
  {"AF": "Afghanistan"},
  {"AL": "Albania"},
  {"DZ": "Algeria"},
  {"AS": "American Samoa"},
  {"AD": "Andorra"},
  {"AO": "Angola"},
  {"AI": "Anguilla"},
  {"AQ": "Antarctica"},
  {"AR": "Argentina"},
  {"AM": "Armenia"},
  {"AW": "Aruba"},
  {"AU": "Australia"},
  {"AT": "Austria"},
  {"AZ": "Azerbaijan"},
  {"BS": "Bahamas"},
  {"BH": "Bahrain"},
  {"BD": "Bangladesh"},
  {"BB": "Barbados"},
  {"BY": "Belarus"},
  {"BE": "Belgium"},
  {"BZ": "Belize"},
  {"BJ": "Benin"},
  {"BM": "Bermuda"},
  {"BT": "Bhutan"},
  {"BO": "Bolivia"},
  {"BW": "Botswana"},
  {"BV": "Bouvet Island"},
  {"BR": "Brazil"},
  {"BN": "Brunei Darussalam"},
  {"BG": "Bulgaria"},
  {"BF": "Burkina Faso"},
  {"BI": "Burundi"},
  {"KH": "Cambodia"},
  {"CM": "Cameroon"},
  {"CA": "Canada"},
  {"CV": "Cape Verde"},
  {"KY": "Cayman Islands"},
  {"CF": "Central African Republic"},
  {"TD": "Chad"},
  {"CL": "Chile"},
  {"CN": "China"},
  {"CX": "Christmas Island"},
  {"CC": "Cocos (Keeling) Islands"},
  {"CO": "Colombia"},
  {"KM": "Comoros"},
  {"CG": "Congo"},
  {"CK": "Cook Islands"},
  {"CR": "Costa Rica"},
  {"CI": "Cote d'Ivoire"},
  {"HR": "Croatia (Hrvatska)"},
  {"CU": "Cuba"},
  {"CY": "Cyprus"},
  {"CZ": "Czech Republic"},
  {"DK": "Denmark"},
  {"DJ": "Djibouti"},
  {"DM": "Dominica"},
  {"DO": "Dominican Republic"},
  {"EC": "Ecuador"},
  {"EG": "Egypt"},
  {"SV": "El Salvador"},
  {"GQ": "Equatorial Guinea"},
  {"ER": "Eritrea"},
  {"EE": "Estonia"},
  {"ET": "Ethiopia"},
  {"FK": "Falkland Islands (Malvinas)"},
  {"FO": "Faroe Islands"},
  {"FJ": "Fiji"},
  {"FI": "Finland"},
  {"FR": "France"},
  {"GF": "French Guiana"},
  {"PF": "French Polynesia"},
  {"GA": "Gabon"},
  {"GM": "Gambia"},
  {"GE": "Georgia"},
  {"DE": "Germany"},
  {"GH": "Ghana"},
  {"GI": "Gibraltar"},
  {"GR": "Greece"},
  {"GL": "Greenland"},
  {"GD": "Grenada"},
  {"GP": "Guadeloupe"},
  {"GU": "Guam"},
  {"GT": "Guatemala"},
  {"GN": "Guinea"},
  {"GW": "Guinea-Bissau"},
  {"GY": "Guyana"},
  {"HT": "Haiti"},
  {"HN": "Honduras"},
  {"HK": "Hong Kong"},
  {"HU": "Hungary"},
  {"IS": "Iceland"},
  {"IN": "India"},
  {"ID": "Indonesia"},
  {"IQ": "Iraq"},
  {"IE": "Ireland"},
  {"IL": "Israel"},
  {"IT": "Italy"},
  {"JM": "Jamaica"},
  {"JP": "Japan"},
  {"JO": "Jordan"},
  {"KZ": "Kazakhstan"},
  {"KE": "Kenya"},
  {"KI": "Kiribati"},
  {"KR": "Korea, Republic of"},
  {"KW": "Kuwait"},
  {"KG": "Kyrgyzstan"},
  {"LV": "Latvia"},
  {"LB": "Lebanon"},
  {"LS": "Lesotho"},
  {"LR": "Liberia"},
  {"LY": "Libyan Arab Jamahiriya"},
  {"LI": "Liechtenstein"},
  {"LT": "Lithuania"},
  {"LU": "Luxembourg"},
  {"MO": "Macau"},
  {"MG": "Madagascar"},
  {"MW": "Malawi"},
  {"MY": "Malaysia"},
  {"MV": "Maldives"},
  {"ML": "Mali"},
  {"MT": "Malta"},
  {"MH": "Marshall Islands"},
  {"MQ": "Martinique"},
  {"MR": "Mauritania"},
  {"MU": "Mauritius"},
  {"YT": "Mayotte"},
  {"MX": "Mexico"},
  {"MD": "Moldova, Republic of"},
  {"MC": "Monaco"},
  {"MN": "Mongolia"},
  {"MS": "Montserrat"},
  {"MA": "Morocco"},
  {"MZ": "Mozambique"},
  {"MM": "Myanmar"},
  {"NA": "Namibia"},
  {"NR": "Nauru"},
  {"NP": "Nepal"},
  {"NL": "Netherlands"},
  {"AN": "Netherlands Antilles"},
  {"NC": "New Caledonia"},
  {"NZ": "New Zealand"},
  {"NI": "Nicaragua"},
  {"NE": "Niger"},
  {"NG": "Nigeria"},
  {"NU": "Niue"},
  {"NF": "Norfolk Island"},
  {"MP": "Northern Mariana Islands"},
  {"NO": "Norway"},
  {"OM": "Oman"},
  {"PW": "Palau"},
  {"PA": "Panama"},
  {"PG": "Papua New Guinea"},
  {"PY": "Paraguay"},
  {"PE": "Peru"},
  {"PH": "Philippines"},
  {"PN": "Pitcairn"},
  {"PL": "Poland"},
  {"PT": "Portugal"},
  {"PR": "Puerto Rico"},
  {"QA": "Qatar"},
  {"RE": "Reunion"},
  {"RO": "Romania"},
  {"RU": "Russian Federation"},
  {"RW": "Rwanda"},
  {"KN": "Saint Kitts and Nevis"},
  {"LC": "Saint Lucia"},
  {"WS": "Samoa"},
  {"SM": "San Marino"},
  {"ST": "Sao Tome and Principe"},
  {"SA": "Saudi Arabia"},
  {"SN": "Senegal"},
  {"SC": "Seychelles"},
  {"SL": "Sierra Leone"},
  {"SG": "Singapore"},
  {"SK": "Slovakia (Slovak Republic)"},
  {"SI": "Slovenia"},
  {"SB": "Solomon Islands"},
  {"SO": "Somalia"},
  {"ZA": "South Africa"},
  {"ES": "Spain"},
  {"LK": "Sri Lanka"},
  {"SH": "St. Helena"},
  {"PM": "St. Pierre and Miquelon"},
  {"SD": "Sudan"},
  {"SR": "Suriname"},
  {"SZ": "Swaziland"},
  {"SE": "Sweden"},
  {"CH": "Switzerland"},
  {"SY": "Syrian Arab Republic"},
  {"TW": "Taiwan, Province of China"},
  {"TJ": "Tajikistan"},
  {"TZ": "Tanzania, United Republic of"},
  {"TH": "Thailand"},
  {"TG": "Togo"},
  {"TK": "Tokelau"},
  {"TO": "Tonga"},
  {"TT": "Trinidad and Tobago"},
  {"TN": "Tunisia"},
  {"TR": "Turkey"},
  {"TM": "Turkmenistan"},
  {"TC": "Turks and Caicos Islands"},
  {"TV": "Tuvalu"},
  {"UG": "Uganda"},
  {"UA": "Ukraine"},
  {"AE": "United Arab Emirates"},
  {"GB": "United Kingdom"},
  {"US": "United States"},
  {"UY": "Uruguay"},
  {"UZ": "Uzbekistan"},
  {"VU": "Vanuatu"},
  {"VE": "Venezuela"},
  {"VN": "Viet Nam"},
  {"VG": "Virgin Islands (British)"},
  {"VI": "Virgin Islands (U.S.)"},
  {"WF": "Wallis and Futuna Islands"},
  {"EH": "Western Sahara"},
  {"YE": "Yemen"},
  {"ZM": "Zambia"},
  {"ZW": "Zimbabwe"}
];
