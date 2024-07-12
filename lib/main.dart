// ignore_for_file: use_super_parameters, must_be_immutable, avoid_print, library_private_types_in_public_api, camel_case_types, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lucide_icons/lucide_icons.dart';
import 'package:testloxy/Widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loxy',
      theme: ThemeData(
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          // Définir le style des titres en gras
          displayLarge: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: primaryFgColor,
            minimumSize: const Size(double.infinity, 50), // Bouton pleine largeur, hauteur personnalisée
            textStyle: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.bold,
              color: primaryFgColor,
            ),
          ),
        ),

        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loxy...'),

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LucideIcons.bell))
        ],
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,', style: Theme.of(context).textTheme.headlineMedium,),
                      Text('In proximity:,', style: Theme.of(context).textTheme.bodyLarge,),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20,),
        
              Story(),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width / 2.7,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/maps.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Maps', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: backgroundColor),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10.0
                ),
                child: Post(postNumber: 10,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  Story({super.key});

  final List<Map<String, String>> items = [
    {'image': 'https://xsgames.co/randomusers/assets/avatars/male/46.jpg', 'text': 'clementt'},
    {'image': 'https://randomuser.me/api/portraits/women/90.jpg', 'text': 'increase.denise'},
    {'image': 'https://randomuser.me/api/portraits/women/36.jpg', 'text': 'admirablejustin'},
    {'image': 'https://randomuser.me/api/portraits/men/71.jpg', 'text': 'justinthehuston'},
    {'image': 'https://randomuser.me/api/portraits/lego/7.jpg', 'text': 'legggg56666'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  'https://scontent-cdg4-1.cdninstagram.com/v/t51.2885-19/450088346_1885435238620906_7933179071852387477_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-cdg4-1.cdninstagram.com&_nc_cat=110&_nc_ohc=XpedfkeN37YQ7kNvgG2sxS7&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYBTCJ2_BLTd5SzBxiKFUYyElfACEdCEAd52Xj98LLMsng&oe=66972679&_nc_sid=8f1549',
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              LucideIcons.plus,
                              color: backgroundColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 95,
                    child: Text(
                      'Your story',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Container(
                              color: primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.network(
                                    items[index]['image']!,
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 90,
                            child: Text(
                              items[index]['text']!,
                              style: Theme.of(context).textTheme.labelSmall,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  int postNumber;

  Post({required this.postNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postNumber,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0), // Padding autour du Row
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(2.0),
                          bottomRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(2.0)
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            // Placeholder avatar, replace with your actual avatar logic
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'clementt.exe',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
          
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    LucideIcons.heart,
                                    color: greyColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    '100',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(color: greyColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                      
                          IconButton(
                            icon: const Icon(
                              LucideIcons.messageSquare,
                              color: greyColor,
                            ),
                            onPressed: () {},
                            padding: const EdgeInsets.all(3.0),
                            iconSize: 18,
                            constraints: const BoxConstraints(),
                          ),
                      
                          IconButton(
                            icon: const Icon(
                              LucideIcons.share2,
                              color: greyColor,
                            ),
                            onPressed: () {},
                            padding: const EdgeInsets.all(3.0),
                            iconSize: 18,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse metus dui, elementum eu urna eu, tempor dapibus mi. Suspendisse malesuada scelerisque ligula, vitae fringilla mauris laoreet eu. Curabitur mattis sollicitudin tempus. Proin tristique consectetur pretium. Nunc vulputate tincidunt mi.', style: TextStyle(height: 1.5)),
          
                      const SizedBox(height: 10.0,),
          
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
          
                        child: InkWell(
                          onTap: () {
                            context.pushTransparentRoute(
                              ImageZoom(url: 'https://leclaireur.fnac.com/wp-content/uploads/2023/05/photo-solidays-bricedelamarche-1256x826.jpg'),
                            );
                          },
                          child: Hero(
                            tag: 'https://leclaireur.fnac.com/wp-content/uploads/2023/05/photo-solidays-bricedelamarche-1256x826.jpg',
                            child: Image.network(
                              'https://leclaireur.fnac.com/wp-content/uploads/2023/05/photo-solidays-bricedelamarche-1256x826.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


class ImageZoom extends StatelessWidget {
  String url;
  ImageZoom({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      isFullScreen: false,
      disabled: false,
      minRadius: 10,
      maxRadius: 10,
      dragSensitivity: 1.0,
      maxTransformValue: .8,
      direction: DismissiblePageDismissDirection.multi,
      backgroundColor: backgroundColor,
      onDragStart: () {
        print('onDragStart');
      },
      onDragUpdate: (details) {
        print(details);
      },
      dismissThresholds: const {
        DismissiblePageDismissDirection.vertical: .2,
      },
      minScale: .8,
      startingOpacity: 1,
      reverseDuration: const Duration(milliseconds: 250),
      // End of the optional properties
      child: Hero(tag: url, child: ClipRRect(borderRadius: BorderRadius.circular(15.0), child: Image.network(url))),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedItemPosition = 0;

  final screens = [
    const HomePage(),
    const Publish(),
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,

      body: screens[_selectedItemPosition],

      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        padding: const EdgeInsets.all(10.0),
        snakeShape: SnakeShape.circle,
        snakeViewColor: primaryColor,
        selectedItemColor: backgroundColor,
        unselectedItemColor: greyColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(side: const BorderSide(width: 1, color: greyColor), borderRadius: BorderRadius.circular(15.0),),
        currentIndex: _selectedItemPosition,
        elevation: 0.5,
        onTap: (index) {
          setState(() {
            _selectedItemPosition = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.plus), label: 'Publish'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user2), label: 'Profile'),
        ],
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
final double latitude = 48.8588443; // Exemple: latitude de la Tour Eiffel
  final double longitude = 2.2943506; // Exemple: longitude de la Tour Eiffel
  final double radius = 500.0; // Rayon en mètres
  List places = [];

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    final query = """
      [out:json];
      (
        node(around:$radius,$latitude,$longitude)[tourism][name];
        node(around:$radius,$latitude,$longitude)[leisure][name];
        node(around:$radius,$latitude,$longitude)[amenity~"restaurant|cafe|cinema|theatre|park"][name];
        way(around:$radius,$latitude,$longitude)[tourism][name];
        way(around:$radius,$latitude,$longitude)[leisure][name];
        way(around:$radius,$latitude,$longitude)[amenity~"restaurant|cafe|cinema|theatre|park"][name];
        relation(around:$radius,$latitude,$longitude)[tourism][name];
        relation(around:$radius,$latitude,$longitude)[leisure][name];
        relation(around:$radius,$latitude,$longitude)[amenity~"restaurant|cafe|cinema|theatre|park"][name];
      );
      out body;
      >;
      out skel qt;
    """;

    final url = 'https://overpass-api.de/api/interpreter';
    print("Request URL: $url");
    print("Query: $query");
    final response = await http.post(
      Uri.parse(url),
      body: {'data': query},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Response Data: ${response.body}");
      setState(() {
        places = data['elements'].where((place) {
          final name = place['tags']?['name'];
          final amenity = place['tags']?['amenity'];
          final highway = place['tags']?['highway'];
          // Exclure les lieux sans nom, avec nom générique, et arrêts de bus
          return name != null &&
              !name.startsWith('Place:') &&
              highway == null &&
              amenity != 'bus_station' && amenity != 'parking';
        }).toList();
      });
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lieux populaires autour de vous'),
      ),
      body: places.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return ListTile(
                  title: Text(place['tags'] != null && place['tags']['name'] != null
                      ? place['tags']['name']
                      : 'Place ${place['id']}'),
                  subtitle: Text(
                      'Type: ${place['tags']['highway']}, ID: ${place['id']}'),
                );
              },
            ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: secondaryColor,);
  }
}


class Publish extends StatefulWidget {
  const Publish({super.key});

  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  final int maxCharacterCount = 140;
  final TextEditingController _publishController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _publishController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _publishController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _publishController = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: const Text('Publish'),

        actions: const [
          TextButton(onPressed: null, child: Text('Publish a Lox...'))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                children: [
                  TextField(
                    controller: _publishController,
                    textInputAction: TextInputAction.send,
                    maxLength: 140,
                    autofocus: false,
                    maxLines: 6,
                    minLines: 6,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LucideIcons.pencil),
                      labelText: 'How are you... ?',
                      counterText: '',
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: primaryColor.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  
                    textCapitalization: TextCapitalization.sentences,
                  ),

                  const SizedBox(height: 10,),
        
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.withOpacity(0.1), // replace with your secondaryColor
                      minHeight: 4,
                      //value: _publishController.text.length / maxCharacterCount,
                      value: 0.7,
                      valueColor: const AlwaysStoppedAnimation<Color>(secondaryColor), // replace with your primaryColor
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 10,),
        
            Container(
              constraints: const BoxConstraints(
                maxHeight: 70,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemCount: publishItem.PublishList(context).length,
                itemBuilder:(context, index) {
                  publishItem items = publishItem.PublishList(context)[index];
              
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30,
                      child: IconButton(
                        onPressed: items.onPressed, 
                        icon: Icon(items.icon, color: backgroundColor,),
                        tooltip: items.name,
                      ),
                    )
                  );
                },
              ),
            ),

            const SizedBox(height: 10.0,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Preview :', style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(height: 5.0,),
                  Post(postNumber: 1,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class publishItem {
 final id;
  final String name;
  final IconData icon;
  final Function()? onPressed;


  publishItem(this.id, this.name, this.icon, this.onPressed);

  static List<publishItem> PublishList(BuildContext context) {
    return <publishItem> [
      publishItem(0, "Pictures", LucideIcons.camera, () {}),
      publishItem(1, "Music", LucideIcons.music, () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPage(),),);}),
      publishItem(2, "Gif", Icons.gif_outlined, () {}),
      publishItem(3, "Pool", LucideIcons.vote, () {}),
    ];
  }
}

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List<dynamic> searchResults = [];
  List<dynamic> tracks = [];
  bool isLoading = true;
  String nextPageUrl = "";
  bool nextPage = false;
  double _scrollOffset = 0.0;
  ScrollController _scrollController = ScrollController();
  FocusNode _searchFocusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    trendingMusic();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  Future<void> trendingMusic() async {
    try {
      setState(() {
        isLoading = true;
      });

      const playlistEndpoint = 'https://api.deezer.com/playlist/1109890291';

      final response = await http.get(
        Uri.parse(playlistEndpoint),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> playlistData = json.decode(response.body);
        setState(() {
          tracks = playlistData['tracks']['data'];
          isLoading = false;
        });
        print(tracks);
      } else {
        print('Error fetching playlist tracks: ${response.reasonPhrase}');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double fadeInOpacity = _scrollOffset / 400.0;
    if (fadeInOpacity > 1.0) fadeInOpacity = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
        actions: [
          AnimatedOpacity(
            opacity: fadeInOpacity,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: IconButton(
              icon: const Icon(LucideIcons.search),
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                FocusScope.of(context).requestFocus(_searchFocusNode);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                textInputAction: TextInputAction.search,
                maxLength: 140,
                autofocus: false,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(LucideIcons.search),
                  labelText: 'Powered by Deezer...',
                  counterText: '',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 10.0,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tracks.length,
                itemBuilder: (context, index) {
                  var imageUrl = tracks[index]['album']['cover_medium'];
                  var trackName = tracks[index]['title'];
                  var artistNames = tracks[index]['artist']['name'];

                  return ListTile(
                    leading: imageUrl.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(imageUrl, width: 50, height: 50))
                        : const SizedBox(width: 50, height: 50),
                    title: Text(
                      trackName,
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Text(
                      artistNames,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey),
                    ),
                    onTap: () {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}