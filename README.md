# hoot
### Owl Call Recognition

![Hoot App](/hoot/hoot_app.PNG)

# Introduction

Owls are habitat sensitive species and essential ecosystem service providers. To determine the presence of owls in a particular area requires knowledge of the region & owl calls. It is not easy to spot owls visually due to their nocturnal habitat and cryptic coloration. However, their call based identification is more straightforward as owl calls are species-specific.

Hoot is an owl call recognition app to aid the study of owls. The application employs a deep learning model to classify the incoming audio into respective owl species. It can be effortlessly used by farmers, laymen, wildlife enthusiasts, and ecologists alike who are eager to learn about owl species in their areas. It will be useful in aiding biodiversity informatics while creating citizen awareness towards biodiversity.

### App Techstack

- Flutter
- TFLite

### Dataset

- Acquired from Xeno-canto
- Each species has 100, 1 sec long audio clips of owl calls.
- All audio is wav format 16000Hz mono audio

#### Owl species Hoot can recognize

Hoot is mainly trained for those owls found in the Indian subcontinent. It currently includes the following 10 species:
- Asian barred owlet
- Brown hawk owl
- Brown wood owl
- Eurasian eagle owl
- Indian scops owl
- Jungle owlet
- Mottled wood owl
- Oriental scops owl
- Spotted owlet
- Western barn owl
