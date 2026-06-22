import 'package:flutter/material.dart';
import 'package:flutter_adaptive_accessibility/flutter_adaptive_accessibility.dart';

void main() {
  runApp(
    AdaptiveApp(
      config: const AdaptiveConfig(maxTextScaleFactor: 1.2),
      child: const DemoApp(),
    ),
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Adaptive Accessibility',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AppBar(title: const Text('Flutter Adaptive Accessibility')),
      body: AdaptivePage(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _title('Device Information'),

            AdaptiveBuilder(
              builder: (context, info) {
                return AdaptiveCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Width: ${info.width}'),
                      Text('Height: ${info.height}'),
                      Text('Mobile: ${info.isMobile}'),
                      Text('Tablet: ${info.isTablet}'),
                      Text('Desktop: ${info.isDesktop}'),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            _title('Adaptive Text'),

            const AdaptiveCard(
              child: AdaptiveText(
                'This text automatically adapts to accessibility settings and prevents overflow.',
              ),
            ),

            const SizedBox(height: 24),

            _title('Profile Layout Demo'),

            AdaptiveCard(
              child: AdaptiveRow(
                breakpoint: 700,
                children: [
                  const CircleAvatar(radius: 40, child: Icon(Icons.person)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Prashant Kirpan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Flutter Developer'),
                    ],
                  ),

                  FilledButton(onPressed: () {}, child: const Text('Contact')),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Column'),

            AdaptiveCard(
              child: AdaptiveColumn(
                children: [_box('Profile'), _box('Orders'), _box('Settings')],
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Wrap'),

            AdaptiveCard(
              child: AdaptiveWrap(
                children: List.generate(
                  20,
                  (index) => Chip(label: Text('Tag ${index + 1}')),
                ),
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Grid'),

            AdaptiveGrid(
              mobileColumns: 1,
              tabletColumns: 2,
              desktopColumns: 4,
              children: List.generate(
                8,
                (index) => AdaptiveCard(
                  child: Center(child: Text('Card ${index + 1}')),
                ),
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Form'),

            AdaptiveForm(
              children: const [
                TextField(decoration: InputDecoration(labelText: 'Name')),
                TextField(decoration: InputDecoration(labelText: 'Email')),
                TextField(decoration: InputDecoration(labelText: 'Phone')),
                TextField(decoration: InputDecoration(labelText: 'Address')),
              ],
            ),

            const SizedBox(height: 24),
            _title('Adaptive Visibility'),

            AdaptiveVisibility(
              desktop: false,
              child: const AdaptiveCard(
                child: Text('Visible on Mobile & Tablet'),
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Value'),

            Builder(
              builder: (context) {
                final value = AdaptiveValue<double>(
                  mobile: 8,
                  tablet: 16,
                  desktop: 24,
                ).resolve(context);

                return AdaptiveCard(child: Text('Resolved Value: $value'));
              },
            ),

            const SizedBox(height: 24),

            _title('Accessibility Mode'),

            AccessibilityMode(
              builder: (context, enabled) {
                return AdaptiveCard(
                  child: Text(
                    enabled
                        ? 'Accessibility Enabled'
                        : 'Accessibility Disabled',
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            _title('Text Scale Detector'),

            TextScaleDetector(
              builder: (context, scale) {
                return AdaptiveCard(child: Text('Current Scale: $scale'));
              },
            ),

            const SizedBox(height: 24),

            _title('Overflow Detector'),

            OverflowDetector(
              builder: (context, overflow) {
                return AdaptiveCard(
                  child: Text(overflow ? 'Compact Layout' : 'Wide Layout'),
                );
              },
            ),

            const SizedBox(height: 24),

            _title('Orientation Builder'),

            AdaptiveOrientationBuilder(
              builder: (context, orientation) {
                return Container(
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: orientation == Orientation.portrait
                        ? Colors.green
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    orientation == Orientation.portrait
                        ? 'Portrait'
                        : 'Landscape',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            _title('Adaptive Layout Switcher'),

            AdaptiveLayoutSwitcher(
              breakpoint: 700,
              children: [
                const CircleAvatar(radius: 35, child: Icon(Icons.person)),
                const Text('Prashant Kirpan'),
                FilledButton(onPressed: () {}, child: const Text('Contact')),
              ],
            ),

            const SizedBox(height: 24),

            _title('Adaptive Navigation'),

            SizedBox(
              height: 350,
              child: AdaptiveNavigation(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                body: Center(child: Text('Selected Tab: $selectedIndex')),
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _title('Adaptive Dialog'),

            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AdaptiveDialog(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            child: Icon(Icons.person),
                          ),
                          const SizedBox(height: 16),
                          const Text('Prashant Kirpan'),
                          const Text('Flutter Developer'),
                          const SizedBox(height: 24),
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                AdaptiveBottomSheet.show(
                  context,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Profile'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget _box(String title) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title),
    );
  }
}

//==================******=======================//
//for without adaptive package example
//==================******======================//

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const DemoApp());
// }

// class DemoApp extends StatelessWidget {
//   const DemoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Without Adaptive Package',
//       theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
//       home: const DemoHomePage(),
//     );
//   }
// }

// class DemoHomePage extends StatefulWidget {
//   const DemoHomePage({super.key});

//   @override
//   State<DemoHomePage> createState() => _DemoHomePageState();
// }

// class _DemoHomePageState extends State<DemoHomePage> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Without Adaptive Package')),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _title('Profile Layout Demo'),

//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   const CircleAvatar(radius: 40, child: Icon(Icons.person)),

//                   const SizedBox(width: 16),

//                   const Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Prashant Kirpan',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text('Flutter Developer'),
//                       ],
//                     ),
//                   ),

//                   FilledButton(onPressed: null, child: const Text('Contact')),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 24),

//           _title('Fixed Grid'),

//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 8,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//             ),
//             itemBuilder: (_, index) {
//               return Card(child: Center(child: Text('Card ${index + 1}')));
//             },
//           ),

//           const SizedBox(height: 24),

//           _title('Regular Form'),

//           const TextField(decoration: InputDecoration(labelText: 'Name')),

//           const SizedBox(height: 16),

//           const TextField(decoration: InputDecoration(labelText: 'Email')),

//           const SizedBox(height: 16),

//           const TextField(decoration: InputDecoration(labelText: 'Phone')),

//           const SizedBox(height: 16),

//           const TextField(decoration: InputDecoration(labelText: 'Address')),

//           const SizedBox(height: 24),

//           _title('Navigation'),

//           SizedBox(
//             height: 350,
//             child: Scaffold(
//               body: Center(child: Text('Selected Tab: $selectedIndex')),
//               bottomNavigationBar: NavigationBar(
//                 selectedIndex: selectedIndex,
//                 onDestinationSelected: (index) {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 destinations: const [
//                   NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//                   NavigationDestination(
//                     icon: Icon(Icons.person),
//                     label: 'Profile',
//                   ),
//                   NavigationDestination(
//                     icon: Icon(Icons.settings),
//                     label: 'Settings',
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 24),

//           _title('Standard Dialog'),

//           ElevatedButton.icon(
//             icon: const Icon(Icons.open_in_new),
//             label: const Text('Show Dialog'),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: const Text('Profile'),
//                   content: const Text('Flutter Developer'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Close'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),

//           const SizedBox(height: 12),

//           ElevatedButton.icon(
//             icon: const Icon(Icons.keyboard_arrow_up),
//             label: const Text('Show Bottom Sheet'),
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (_) => Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         'Quick Actions',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       const SizedBox(height: 24),

//                       ListTile(
//                         leading: const Icon(Icons.person),
//                         title: const Text('Profile'),
//                         onTap: () {},
//                       ),

//                       ListTile(
//                         leading: const Icon(Icons.settings),
//                         title: const Text('Settings'),
//                         onTap: () {},
//                       ),

//                       ListTile(
//                         leading: const Icon(Icons.logout),
//                         title: const Text('Logout'),
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _title(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 24, bottom: 12),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
