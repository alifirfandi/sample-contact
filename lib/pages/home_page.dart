import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import 'edit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _header() {
    return const Text(
      'My Contact',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _searchBox(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('This Feature Under Developing'),
          ),
        );
      },
      autocorrect: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color(0xFF3B4240),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
    );
  }

  Widget _textRecent() {
    return const Text(
      'Recent',
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget _listRecent() {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/2$index.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<UserProvider>(builder: (context, userProvider, _) {
          return Text(
            'Friends (${userProvider.users.length})',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          );
        }),
      ],
    );
  }

  Widget _listContact() {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      if (userProvider.users.isEmpty) {
        return const Text(
          "No Contacts",
          style: TextStyle(color: Colors.white),
        );
      } else {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: userProvider.users.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.withOpacity(0.4),
              thickness: 0.5,
            );
          },
          itemBuilder: (BuildContext context, int index) => InkWell(
            splashColor: Colors.grey.withOpacity(0.1),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      EditPage(user: userProvider.users[index], index: index),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(userProvider.users[index].image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProvider.users[index].name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userProvider.users[index].location,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2421),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _header(),
            const SizedBox(height: 30),
            _searchBox(context),
            const SizedBox(height: 30),
            _textRecent(),
            const SizedBox(height: 10),
            _listRecent(),
            _textContact(),
            _listContact(),
          ],
        ),
      ),
      floatingActionButton: Consumer<UserProvider>(
        builder: (context, userProvider, _) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EditPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
