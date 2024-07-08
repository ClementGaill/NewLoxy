// ignore_for_file: use_super_parameters, must_be_immutable
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Flutter Demo',
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
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  
                    child: Stack(
                      children: [
                        Image.asset('assets/maps.png', width: double.infinity, fit: BoxFit.cover, colorBlendMode: BlendMode.darken,)
                      ],
                    ),
                  ),
                ),
              ),
        
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10.0
                ),
                child: Post(),
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
      height: 100,
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
                                  'https://scontent-cdg4-3.cdninstagram.com/v/t51.2885-19/381396316_693002242851640_4164785196712109275_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-cdg4-3.cdninstagram.com&_nc_cat=104&_nc_ohc=bjFwSqF3KbgQ7kNvgEx_zpE&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYCrGleWaHG2Tyu69ZZumr3fWyRuFmYOvWZRwB2unazmcA&oe=66908B92&_nc_sid=8f1549',
                                  height: 50,
                                  width: 50,
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
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 95,
                    child: Text(
                      'Your story',
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Container(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  items[index]['image']!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
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
      dismissThresholds: {
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
    const MapPage(),
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
        shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: greyColor), borderRadius: BorderRadius.circular(15.0),),
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

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: textColor,);
  }
}
class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: secondaryColor,);
  }
}