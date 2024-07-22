// ignore_for_file: use_super_parameters, must_be_immutable, avoid_print, library_private_types_in_public_api, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'dart:convert';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lucide_icons/lucide_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testloxy/Widgets/colors.dart';
import 'package:testloxy/auth.dart';

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
            foregroundColor: backgroundColor,
            minimumSize: const Size(double.infinity, 50), // Bouton pleine largeur, hauteur personnalisée
            textStyle: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.bold,
              color: backgroundColor,
              fontSize: 20
            ),
          ),
        ),

        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const HomeAuth(),
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
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const StoryPage()));},
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.asset(
                                    'assets/profil.jpg',
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
                          const SizedBox(height: 8),
                          SizedBox(
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
              border: Border.all(width: 1, color: greyColor),
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
                        border: Border.all(width: 1, color: greyColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            // Placeholder avatar, replace with your actual avatar logic
                            backgroundColor: greyColor,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'clementt.exe',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),
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
    const ProfilPage(),
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

    const url = 'https://overpass-api.de/api/interpreter';
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
        title: const Text('Lieux populaires autour de vous'),
      ),
      body: places.isEmpty
          ? const Center(child: CircularProgressIndicator())
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
    TextEditingController publishController = TextEditingController();

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
                    controller: publishController,
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
                      fillColor: primaryColor.withOpacity(0.1),
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
                      backgroundColor: primaryColor.withOpacity(0.1), // replace with your secondaryColor
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
      publishItem(1, "Music", LucideIcons.music, () {Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const MusicPage()));}),
      publishItem(2, "Gif", Icons.gif_outlined, () {Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const GifPage()));}),
      publishItem(3, "Pool", LucideIcons.vote, () {Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const PoolPage()));}),
    ];
  }
}

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

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
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

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
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: IconButton(
              icon: const Icon(LucideIcons.search),
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
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
                  fillColor: primaryColor.withOpacity(0.1),
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: greyColor),
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

class GifPage extends StatefulWidget {
  const GifPage({super.key});

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  bool isLoading = true;
  String nextPageUrl = "";
  bool nextPage = false;
  double _scrollOffset = 0.0;
  final ScrollController _scrollController = ScrollController();
  final FocusNode _gifFocusNode = FocusNode();
  final String giphyApiKey = 'AGCLF0r2DvN2P6IoIaQPoKklmEt9TBgU';
  final String giphyTrendingEndpoint = 'https://api.giphy.com/v1/gifs/trending?api_key=';
  final TextEditingController _gifController = TextEditingController();
  List<String> trendingGifs = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchTrendingGifs();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _gifFocusNode.dispose();
    _gifController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  Future<void> fetchTrendingGifs() async {
    final response = await http.get(Uri.parse('$giphyTrendingEndpoint$giphyApiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> gifs = data['data'];

      print(data);

      setState(() {
        trendingGifs = gifs.map<String>((gif) => gif['images']['fixed_height']['url']).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load trending GIFs');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    double fadeInOpacity = _scrollOffset / 400.0;
    if (fadeInOpacity > 1.0) fadeInOpacity = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Gif'),
        actions: [
          AnimatedOpacity(
            opacity: fadeInOpacity,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: IconButton(
              icon: const Icon(LucideIcons.search),
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                FocusScope.of(context).requestFocus(_gifFocusNode);
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
                controller: _gifController,
                focusNode: _gifFocusNode,
                textInputAction: TextInputAction.search,
                maxLength: 140,
                autofocus: false,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(LucideIcons.search),
                  labelText: 'Powered by Giphy...',
                  counterText: '',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: primaryColor.withOpacity(0.1),
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
              Builder(
                builder: (context) {
                  return MasonryGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: trendingGifs.length,
                      itemBuilder: (context, index) {
                        final imageUrl = trendingGifs[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Hero(
                              tag: imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  width: MediaQuery.sizeOf(context).width / 4,
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ??1): null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                    return const Center(
                                      child: Text('Erreur de chargement de l\'image'),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PoolPage extends StatefulWidget {
  const PoolPage({super.key});

  @override
  State<PoolPage> createState() => _PoolPageState();
}

class _PoolPageState extends State<PoolPage> {
  TextEditingController titleController = TextEditingController();
  final List<TextEditingController> _controllers = [];
  List<Widget> _textFields = [];
  int selectedDay = 0;
  int selectedMinute = 0;

  final List<int> days = List<int>.generate(4, (i) => i);
  final List<int> minutes = List<int>.generate(60, (i) => i);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _addTextField();
      _addTextField();
    });
  }

  Widget _buildTextField(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.next,
              maxLength: 14,
              autofocus: false,
              maxLines: 1,
              minLines: 1,
              decoration: InputDecoration(
                labelText: 'Choice ${index + 1}',
                counterText: '',
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: primaryColor.withOpacity(0.1),
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
          ),
          if (index >= 2) const SizedBox(width: 5.0),
          if (index >= 2)
            IconButton(
              onPressed: () {
                setState(() {
                  _controllers.removeAt(index);
                  _textFields.removeAt(index);
                  _textFields = List.generate(
                      _controllers.length, (i) => _buildTextField(i));
                });
              },
              icon: const Icon(LucideIcons.trash),
            ),
        ],
      ),
    );
  }

  void _addTextField() {
    if (_textFields.length < 4) {
      setState(() {
        _controllers.add(TextEditingController());
        _textFields.add(_buildTextField(_textFields.length));
      });
    }
  }

  Widget _buildDropdownButton<T>({required List<T> items, required T value, required ValueChanged<T?> onChanged}) {
    return DropdownButton<T>(
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString(),),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create pool...'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.check),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0
        ),
        child: Center(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  width: 1.0,
                  color: greyColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              textInputAction: TextInputAction.done,
                              maxLength: 15,
                              autofocus: false,
                              maxLines: 1,
                              minLines: 1,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                counterText: '',
                                filled: true,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                fillColor: primaryColor.withOpacity(0.1),
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
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      ..._textFields,
                      const SizedBox(height: 5.0),
                      if (_textFields.length < 4)
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(onPressed: () {_addTextField();}, child: const Text('Add option'))
                        ),
                      const SizedBox(height: 5,),
                      const Divider(color: greyColor,),
                      const SizedBox(height: 5,),
                      const Text('Add time',),
                      Row(
                        children: [
                          const Text('Day : '),
                          _buildDropdownButton<int>(
                            items: days,
                            value: selectedDay,
                            onChanged: (value) {
                              setState(() {
                                selectedDay = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 20),
                          const Text('Min '),
                          _buildDropdownButton<int>(
                            items: minutes,
                            value: selectedMinute,
                            onChanged: (value) {
                              setState(() {
                                selectedMinute = value!;
                              });
                            },
                          ),
                        ],
                      ),
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

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late ScrollController _scrollController;
  double _avatarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double maxScroll = MediaQuery.of(context).size.height / 5;
    double offset = _scrollController.offset;

    setState(() {
      _avatarOpacity = (1 - (offset / maxScroll)).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height / 5,
              leadingWidth: 20.0,
              floating: false,
              title: innerBoxIsScrolled ? const Text('clementt.exe') : null,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    centerTitle: false,
                    background: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
                        image: DecorationImage(
                          image: NetworkImage('https://wallpapers.com/images/featured/dark-background-b59iy2towqy5yrgb.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  innerBoxIsScrolled ? const SizedBox() : Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: const Offset(0, 30),
                      child: Opacity(
                        opacity: _avatarOpacity,
                        child: const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(LucideIcons.edit2, color: textColor, shadows: [Shadow(color: backgroundColor, blurRadius: 15.0)],)),
                IconButton(onPressed: () {}, icon: const Icon(LucideIcons.settings, color: textColor, shadows: [Shadow(color: backgroundColor, blurRadius: 15.0)],)),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Clément GAILLARD', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: greyColor)),
                    const SizedBox(height: 5.0),
                    Text('Ceci es une biographie car j\'adore ecrire', style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('clementt.exe', style: Theme.of(context).textTheme.bodyMedium),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Row(
                                children: [
                                  Icon(LucideIcons.instagram, size: 20),
                                  SizedBox(width: 5.0),
                                  Text('Instagram'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Icon(LucideIcons.twitter, size: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(onPressed: () {}, child: const Text('Add Friends')),
                    const SizedBox(height: 30.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.4),
                              image: const DecorationImage(
                                image: NetworkImage('https://images.frandroid.com/wp-content/uploads/2023/06/apple-plans.jpeg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                              ),
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(LucideIcons.expand, color: backgroundColor, size: 45),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Post(postNumber: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool _isPressed = false;
  bool _isLiked = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
      _isLiked = !_isLiked;
    });
    // Ajoutez ici toute action à effectuer lors du relâchement
    print('object');
    HapticFeedback.lightImpact();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          100.0
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [
                0.01,
                1
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryFgColor,
                Colors.transparent
              ]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(radius: 20.0, backgroundColor: primaryColor,),
                    const SizedBox(width: 10.0,),
            
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('clementt.exe', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: backgroundColor)),
                        Text('3H', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),)
                      ],
                    )
                  ],
                ),
            
                const SizedBox(height: 10.0,),
            
                Row(
                  children: [
                    Expanded(child: Container(height: 5, decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(15.0)),)),
                    const SizedBox(width: 5,),
                    Expanded(child: Container(height: 5, decoration: BoxDecoration(color: backgroundColor.withOpacity(0.4), borderRadius: BorderRadius.circular(15.0)),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Image.network('https://i.pinimg.com/736x/71/2a/1d/712a1d140c6737b3b2bcd22401a40400.jpg', height: MediaQuery.of(context).size.height, fit: BoxFit.cover,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTapCancel: _onTapCancel,
                child: AnimatedScale(
                  scale: _isPressed ? 0.8 : 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Icon(
                    LucideIcons.heart, // Change l'icône en fonction de l'état de `isLiked`
                    color: _isLiked ? primaryColor : Colors.white, // Change la couleur en fonction de l'état de `isLiked`
                    size: 35,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}