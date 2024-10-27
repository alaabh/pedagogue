import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/feature/authentication/login_screen.dart';
import 'package:pedagogue/model/user.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';
import '../../../../utils/resources/api/token_manager.dart';
import '../../../../utils/resources/api/user_session.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _character = UserSession.currentUser.sex;

  TextEditingController firstName =
      TextEditingController(text: UserSession.currentUser.firstName);
  TextEditingController lastName =
      TextEditingController(text: UserSession.currentUser.lastName);
  TextEditingController emailAddress =
      TextEditingController(text: UserSession.currentUser.email);
  TextEditingController mobile =
      TextEditingController(text: UserSession.currentUser.mobile);
  TextEditingController adresse =
      TextEditingController(text: UserSession.currentUser.address);
  TextEditingController zipCode =
      TextEditingController(text: UserSession.currentUser.zipCode);
  TextEditingController city =
      TextEditingController(text: UserSession.currentUser.city);
  TextEditingController country =
      TextEditingController(text: UserSession.currentUser.country);
  TextEditingController dateofBirth =
      TextEditingController(text: UserSession.currentUser.birthdate);

  TextEditingController placeofBirth =
      TextEditingController(text: UserSession.currentUser.birthplace);

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  List<String>? countryList = [];

  Future<void> changePassword(dynamic old_password, dynamic new_password,
      dynamic new_password_confirmation, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/admin/change-password');
    final response = await http.post(url, headers: headers, body: {
      "old_password": old_password,
      "new_password": new_password,
      "new_password_confirmation": new_password_confirmation,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('Succes'),
            content: Text("your password has been changed"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      print(data);
    } else {
      print(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text(response.body.substring(11, 38)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/account/delete');
    final response = await http.post(url, headers: headers, body: {});
    print(response.statusCode);
    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body) as Map<String, dynamic>;

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      print(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text(response.body.substring(11, 38)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> updateProfile(
      dynamic firstName,
      dynamic lastName,
      dynamic email,
      dynamic sex,
      dynamic mobile,
      dynamic address,
      dynamic country,
      dynamic zip_code,
      dynamic city,
      dynamic birthdate,
      dynamic birthplace,
      //dynamic image,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/admin/update/profile');
    final response = await http.post(url, headers: headers, body: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,

      "sex": sex,
      "mobile": mobile,
      "address": address,
      "country": getKeyForValue(country, countries),
      "zip_code": zip_code,
      "city": city,
      "birthdate": birthdate,
      "birthplace": birthplace,
      //"image": image,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      User user = User.fromJson(data['data']);
      print("heeeeeeeeeeeerrrrrrrrrreeeeeeeeeee");
      print(user.firstName);
      UserSession.instance.saveUserSession(user);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('Succes'),
            content: Text("your Profile is Updated"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text(response.body.substring(11, 38)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
  void initState() {
    print(UserSession.currentUser.image);
    country = TextEditingController(
        text: getValueForKey(UserSession.currentUser.country, countries));

    // TODO: implement initState
    for (var country in countries) {
      countryList!.add(country.values.first.toString());
    }
    print(countryList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_character);
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.profile}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Dimensions.verticalSpacingSmall,
                    Card(
                      color: AppColors.primaryColor,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                child: Center(
                                    child: Text("${intl.pERSONALINFO}"))),
                          ],
                        ),
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio<String?>(
                              value: "mr",
                              groupValue: _character,
                              onChanged: (String? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            Text(intl.male)
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String?>(
                              value: "mme",
                              groupValue: _character,
                              onChanged: (String? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            Text(intl.female)
                          ],
                        ),
                      ],
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: firstName,
                        hint: "${intl.firstName}",
                        title: "${intl.firstName}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: lastName,
                        hint: "${intl.lastName}",
                        title: "${intl.lastName}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: emailAddress,
                        hint: "${intl.email}",
                        title: "${intl.email}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: mobile,
                        hint: "${intl.mobile}",
                        title: "${intl.mobile}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: adresse,
                        hint: "${intl.address}",
                        title: "${intl.address}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: zipCode,
                        hint: "${intl.zipCode}",
                        title: "${intl.zipCode}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: city,
                        hint: "${intl.city}",
                        title: "${intl.city}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: country,
                        hint: "${intl.country}",
                        title: "${intl.country}",
                        inputType: InputType.dropdown,
                        dropdownItems: countryList,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: dateofBirth,
                        hint: "${intl.birthdate}",
                        title: "${intl.birthdate}",
                        inputType: InputType.date,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: placeofBirth,
                        hint: "${intl.birthPlace}",
                        title: "${intl.birthPlace}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    CustomButton(
                      onPressed: () {
                        updateProfile(
                          firstName.text,
                          lastName.text,
                          emailAddress.text,
                          _character,
                          mobile.text,
                          adresse.text,
                          country.text,
                          zipCode.text,
                          city.text,
                          dateofBirth.text,
                          placeofBirth.text,
                          context,
                        );
                      },
                      text: '${intl.save}',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Dimensions.verticalSpacingSmall,
                    Card(
                      color: AppColors.primaryColor,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                child: Center(
                                    child: Text("${intl.pASSWORDUPDATE}"))),
                          ],
                        ),
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: oldPassword,
                        hint: "${intl.password}",
                        title: "${intl.password}",
                        inputType: InputType.text,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: newPassword,
                        hint: "${intl.newpassword}",
                        title: "${intl.newpassword}",
                        inputType: InputType.text,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CustomInput(
                        controller: confirmPassword,
                        hint: "${intl.confirmationpassword}",
                        title: "${intl.confirmationpassword}",
                        inputType: InputType.text,
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    CustomButton(
                      onPressed: () {
                        changePassword(oldPassword.text, newPassword.text,
                            confirmPassword.text, context);
                      },
                      text: '${intl.save}',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Dimensions.verticalSpacingSmall,
                    Card(
                      color: AppColors.primaryColor,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                child: Center(
                                    child: Text("${intl.dELETEACCOUNT}"))),
                          ],
                        ),
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              child: Center(
                                  child: Text("${intl.dELETEACCOUNT1}"))),
                        ],
                      ),
                    ),
                    Dimensions.verticalSpacingSmall,
                    CustomButton(
                      onPressed: () {
                        deleteAccount(context);
                      },
                      text: '${intl.delete}',
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Dimensions.verticalSpacingSmall,
                    Dimensions.verticalSpacingSmall,
                  ],
                ),
              ),
            ),
          ),
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
