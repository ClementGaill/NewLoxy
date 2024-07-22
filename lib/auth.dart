import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testloxy/Widgets/colors.dart';
import 'package:testloxy/main.dart';

class CustomListWheelScrollView<T> extends StatelessWidget {
  final List<T> items;
  final Function(int) onSelectedItemChanged;
  final int delay;
  final Widget Function(BuildContext context, T item) childBuilder;

  const CustomListWheelScrollView({
    required this.items,
    required this.onSelectedItemChanged,
    required this.delay,
    required this.childBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      onSelectedItemChanged: onSelectedItemChanged,
      itemExtent: 50,
      physics: FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          final item = items[index];
          return Center(
            child: childBuilder(context, item),
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class BirthdayAuth extends StatefulWidget {
  const BirthdayAuth({super.key});

  @override
  State<BirthdayAuth> createState() => _BirthdayAuthState();
}
class _BirthdayAuthState extends State<BirthdayAuth> {
  int calculateAge(int birthDay, int birthMonth, int birthYear) {
    final DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);
    final DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  List<int> _day = List.generate(31, (index) => index + 1);
  List<String> _monthsNumber = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];
  List<int> _year = List.generate(DateTime.now().year - 1945, (index) => DateTime.now().year - index);

  void _onSelectedDayChanged(int index) {
    HapticFeedback.selectionClick();
  }

  void _onSelectedMonthChanged(int index) {
    setState(() {
    });
    HapticFeedback.selectionClick();
  }

  void _onSelectedYearChanged(int index) {
    setState(() {
    });
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'Enter your birthday...',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Flexible(
                  child: Text(
                    'We need to make sure you’re 16 !',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Flexible(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomListWheelScrollView<int>(
                              items: _day,
                              delay: 0,
                              onSelectedItemChanged: _onSelectedDayChanged,
                              childBuilder:(context, day) {
                                return Text('$day', style: Theme.of(context).textTheme.bodyLarge,);
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomListWheelScrollView<String>(
                              items: _monthsNumber,
                              delay: 0,
                              onSelectedItemChanged: _onSelectedMonthChanged,
                              childBuilder:(context, month) {
                                return Text(month, style: Theme.of(context).textTheme.bodyLarge,);
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomListWheelScrollView<int>(
                              items: _year,
                              delay: 0,
                              onSelectedItemChanged: _onSelectedYearChanged,
                              childBuilder:(context, year) {
                                return Text('$year', style: Theme.of(context).textTheme.bodyLarge,);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                ElevatedButton(onPressed: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const PhoneRegisterAuth()));}, child: Text('Continue...'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeAuth extends StatefulWidget {
  const HomeAuth({super.key});

  @override
  State<HomeAuth> createState() => _HomeAuthState();
}

class _HomeAuthState extends State<HomeAuth> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,

      body: PageView(
        //  PageController
        controller: _controller,
        onPageChanged: (index) {
          
        },

        //  Page Name and Redirect
        children: [
          Container(color: primaryColor,),
          Container(color: primaryFgColor,),
          Container(color: secondaryColor,),
          Container(color: accentColor,),
        ],
      ),

      bottomSheet: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: backgroundColor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15.0,),
        
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: const ExpandingDotsEffect(
                  spacing: 16,
                  dotColor: greyColor,
                  activeDotColor: primaryColor,
                ),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
        
              const SizedBox(height: 10.0,),
        
              ElevatedButton(onPressed: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const BirthdayAuth()));}, child: const Text('Start...')),
        
              const SizedBox(height: 15.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneRegisterAuth extends StatelessWidget {
  const PhoneRegisterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'Enter your phone number...',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Flexible(
                  child: Text(
                    'We’re not gonna call you, like your ex, just sign you up !',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                SizedBox(height: 10,),
                
                Flexible(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    maxLength: 10,
                    autofocus: false,
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LucideIcons.phone),
                      labelText: 'Your phone number...',
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
                    keyboardType: TextInputType.phone,
                  
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),

                const SizedBox(height: 10,),

                ElevatedButton(onPressed: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const OtpAuth()));}, child: Text('Continue...'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpAuth extends StatelessWidget {
  const OtpAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'Enter your phone number...',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Flexible(
                  child: Text(
                    'We’re not gonna call you, like your ex, just sign you up !',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                SizedBox(height: 10,),
                
                Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    textStyle: Theme.of(context).textTheme.headlineSmall
                  ),
                ),

                const SizedBox(height: 10,),

                ElevatedButton(onPressed: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const ProfilAuth()));}, child: Text('Continue...'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilAuth extends StatelessWidget {
  const ProfilAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 5), 
        child: AppBar(
          flexibleSpace: InkWell(
            onTap: () {print('OK');} ,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15.0)),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
                color: secondaryColor
              ),
            
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(LucideIcons.camera, color: backgroundColor, size: 35,),
                    const SizedBox(width: 10,),
                    Text('Add Banner', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: backgroundColor),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),

              const Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 60,
                  child: Icon(LucideIcons.user2, color: backgroundColor, size: 100,),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Form(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              maxLength: 20,
                              autofocus: false,
                              maxLines: 1,
                              minLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(LucideIcons.userCircle2),
                                labelText: 'Your first name...',
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
                      
                          const SizedBox(width: 10.0,),
                      
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              maxLength: 20,
                              autofocus: false,
                              maxLines: 1,
                              minLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(LucideIcons.userCircle2),
                                labelText: 'Your last name...',
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
                            
                              textCapitalization: TextCapitalization.characters,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        maxLength: 20,
                        autofocus: false,
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.users),
                          labelText: 'Your pseudo...',
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
                        textCapitalization: TextCapitalization.none,
                      ),

                      const SizedBox(height: 10.0,),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        maxLength: 60,
                        autofocus: false,
                        maxLines: 3,
                        minLines: 3,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.pencil),
                          labelText: 'Your biography...',
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

                ElevatedButton(onPressed: () {Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: const MainPage()));}, child: Text('Finish...'))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}