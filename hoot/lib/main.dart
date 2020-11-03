import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:Hoot/owlcards.dart';
import 'package:Hoot/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<Map<dynamic, dynamic>> result;
  final isRecording = ValueNotifier<bool>(false);

  String owl;
  String owlName;
  String owlBio;

  List<String> labelList = [
    '_silence_',
    '_unknown_',
    'asianbarredowlet',
    'brownhawkowl',
    'brownwoodowl',
    'eurasianeagleowl',
    'indianscopsowl',
    'jungleowlet',
    'mottledwoodowl',
    'orientalscopsowl',
    'spottedowlet',
    'westernbarnowl',
  ];

  @override
  void initState() {
    super.initState();
    loadModel(
        model: 'assets/models/model.tflite',
        label: 'assets/models/labels.txt',
        numThreads: 1,
        isAsset: true);
  }

  Future loadModel(
      {String model, String label, int numThreads, bool isAsset}) async {
    return await TfliteAudio.loadModel(model, label, numThreads, isAsset);
  }

  Future<Map<dynamic, dynamic>> startAudioRecognition(
      {int sampleRate, int recordingLength, int bufferSize}) async {
    return await TfliteAudio.startAudioRecognition(
        sampleRate, recordingLength, bufferSize);
  }

  Future<Map<dynamic, dynamic>> getResult() async {
    Map<dynamic, dynamic> _result;
    await startAudioRecognition(
            sampleRate: 16000, recordingLength: 16000, bufferSize: 2)
        .then((value) {
      _result = value;
      log(value.toString());
    });
    return _result;
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: const Duration(milliseconds: 1600),
    ));
  }

  owlNameMapping(labels) {
    switch (labels.toString()) {
      case '_silence_':
        String owl = 'noowl';
        String owlName = 'Oops! No Owl found';
        String owlBio = 'No owl found';
        return [owl, owlName, owlBio];
        break;
      case '_unknown_':
        String owl = 'noowl';
        String owlName = 'Oops! No Owl found';
        String owlBio = 'No owl found';

        return [owl, owlName, owlBio];
        break;
      case 'asianbarredowlet':
        String owl = 'asianbarredowlet';
        String owlName = 'Asian Barred Owlet';
        String owlBio =
            'A medium-sized, rotund owl often found during the day on exposed perches such as telephone wires. Brown overall with brown-barred underparts. Similar to Collared Owlet, but Asian Barred lacks false eye spots on the back of the head, has darker brown barring on the sides, and is larger. Calls (a long series of mellow toots) mostly at night, but can often be located during the day by the presence of mobbing songbirds. Found in a wide range of wooded habitats, including large parks and gardens.';
        return [owl, owlName, owlBio];
        break;
      case 'brownhawkowl':
        String owl = 'brownhawkowl';
        String owlName = 'Brown Hawk Owl';
        String owlBio =
            'Brown hawk-like owl with large, unsettling yellow eyes. Note solid brown back, patchily brown-spotted white breast, and pale triangle above the bill. Adaptable, found in a wide range of forested habitats from primary rainforest to orchards and gardens. Most active at night and dusk; often hunts from an exposed perch. Gives a series of rising hoots: “woo-wuh! woo-wuh! woo-wuh!”';
        return [owl, owlName, owlBio];
        break;
      case 'brownwoodowl':
        String owl = 'brownwoodowl';
        String owlName = 'Brown Wood Owl';
        String owlBio =
            'Large, solemn-looking brown owl with deep black eyes. Varies in plumage throughout its extensive range but always has a dark-bordered pale face, fine barring on wings and underparts, and sooty areas around the eyes. Inhabits lowland and montane broadleaf forests and adjacent edges. Gives a short burst of loud, reverberating hoots.';
        return [owl, owlName, owlBio];
        break;
      case 'eurasianeagleowl':
        String owl = 'eurasianeagleowl';
        String owlName = 'Eurasian Eagle Owl';
        String owlBio =
            'Uncommon to rare and local in varied habitats, from forests to rocky canyons, usually in rather wild areas. Active mainly at night, but can be seen hunting at dusk, when may perch on prominent lookouts. Can be found roosting during day in shady canopy or caves. Very large and powerful owl with obvious ear tufts, deep orange eyes, and finely streaked pale buffy underparts.';
        return [owl, owlName, owlBio];
        break;
      case 'indianscopsowl':
        String owl = 'indianscopsowl';
        String owlName = 'Indian Scops Owl';
        String owlBio =
            'Medium-sized scops-owl with prominent ear tufts and dark eyes. Coloration variable, ranging from gray to brown, but dark eyes, thin black border around the facial disc, and lightly streaked underparts remain constant. Gives bouncy amphibian-like barks at changing intervals. Inhabits forests, forest edges, parks, and gardens from lowlands up into foothill and montane regions.';
        return [owl, owlName, owlBio];
        break;
      case 'jungleowlet':
        String owl = 'jungleowlet';
        String owlName = 'Jungle Owlet';
        String owlBio =
            'Squat little owl with dense barring all over the body. Lacks the false eyes on the back of the head possessed by many other owlets. Gives bursts of loud hollow trills, comparable to barbets, as well as a mellow “kaaaooo-kaaaaooo-kah-ow!” A forest species, found in densely wooded areas in lowlands and foothills. Most active at dawn and dusk.';
        return [owl, owlName, owlBio];
        break;
      case 'mottledwoodowl':
        String owl = 'mottledwoodowl';
        String owlName = 'Mottled Wood Owl';
        String owlBio =
            'Medium-sized patchy-looking owl with dark eyes. Densely-marked orange-and-gray coloration is unique. Typically gives single hoots, but also gives an odd, mellow tremolo vocalization in the breeding season. A lowland species, favoring groves and clusters of trees in open plains and on the edges of cultivated areas.';
        return [owl, owlName, owlBio];
        break;
      case 'orientalscopsowl':
        String owl = 'orientalscopsowl';
        String owlName = 'Oriental Scops Owl';
        String owlBio =
            'Smallish scops-owl with bright yellow eyes. Comes in grayish-brown and bright rufous morphs. Generally weakly marked, without any prominent features: note weak black border to the facial disc, thinly streaked underparts, and short ear tufts (often held flat). Song is a 3- to 4-note series of hollow-sounding notes, with the last two in rapid succession. Inhabits forests, gardens, and parks from lowlands up into foothills; often close to human habitation in parts of its range.';
        return [owl, owlName, owlBio];
        break;
      case 'spottedowlet':
        String owl = 'spottedowlet';
        String owlName = 'Spotted Owlet';
        String owlBio =
            'A small uncrested owl with a round head and a short tail. It is grayish-brown overall with white spots above while its underparts are white with brown bars. Note the distinctive white eyebrows and neck-band. Often active at dawn and dusk when it utters a loud “chirurr-chirurr-chirurr” laugh in addition to a variety of high-pitched squeals and whistles. Inhabits all kinds of open habitats but avoids dense forest and wetter regions.';
        return [owl, owlName, owlBio];
        break;
      case 'westernbarnowl':
        String owl = 'westernbarnowl';
        String owlName = 'Western Barn Owl';
        String owlBio =
            'Pale owl; white below and orangey with gray spotting above. Heart-shaped white facial disc. Hunts primarily rodents in open areas by night. Roosts in old buildings and nest boxes by day. Widespread across every continent except Antarctica. Appears very white in headlights at night. Its call is a bone chilling, rising shriek.';

        return [owl, owlName, owlBio];
        break;
      default:
        String owl = 'noowl';
        String owlName = 'No Owl';
        String owlBio = 'No owl found';
        return [owl, owlName, owlBio];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Hoot'),
        backgroundColor: Colors.lightGreen,
      ),
      body: FutureBuilder<Map<dynamic, dynamic>>(
          future: result,
          builder: (BuildContext context,
              AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Tap the mic to start recognizing owl calls',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 30,
                              color: Colors.black)),
                    )
                  ],
                ));
                break;
              case ConnectionState.waiting:
                return Stack(children: <Widget>[
                  const Align(
                      alignment: Alignment.center,
                      child: const Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: const Text('Listening...',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              )))),
                ]);
                break;
              default:
                return Stack(children: <Widget>[
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: labelList.map(
                      (labels) {
                        if (labels == snapshot.data['recognitionResult']) {
                          print(labels);
                          return Container(
                            height: 70.0,
                            padding: const EdgeInsets.all(0.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.lightGreen)),
                              color: Colors.lightGreen,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OwlCard(
                                            owl: owlNameMapping(labels)[0],
                                            owlName: owlNameMapping(labels)[1],
                                            owlBio: owlNameMapping(labels)[2],
                                          )),
                                );
                              },
                              child: Text(owlNameMapping(labels)[1],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  )),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                          );
                        }
                      },
                    ).toList(),
                  )),
                ]);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          child: ValueListenableBuilder(
              valueListenable: isRecording,
              builder: (context, value, widget) {
                if (value == false) {
                  return FloatingActionButton(
                    onPressed: () {
                      isRecording.value = true;
                      setState(() {
                        result = getResult()
                            .whenComplete(() => isRecording.value = false);
                      });
                    },
                    backgroundColor: Colors.lightGreen,
                    child: const Icon(Icons.mic),
                  );
                } else {
                  return FloatingActionButton(
                    onPressed: () {
                      log('button pressed too many times');
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.adjust),
                  );
                }
              })),
      backgroundColor: Colors.white,
    ));
  }
}
