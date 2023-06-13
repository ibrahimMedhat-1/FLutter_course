import 'package:flutter/material.dart';
import 'package:udemy_futter_course/models/user_model.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<UserModel> user = [
      UserModel(id: 1, name: 'Ibrahim', num: '01064172976'),
      UserModel(id: 2, name: 'Yomna', num: '01151796142'),
      UserModel(id: 3, name: 'Hager', num: '01004118010'),
      UserModel(id: 1, name: 'Ibrahim', num: '01064172976'),
      UserModel(id: 2, name: 'Yomna', num: '01151796142'),
      UserModel(id: 3, name: 'Hager', num: '01004118010'),
      UserModel(id: 1, name: 'Ibrahim', num: '01064172976'),
      UserModel(id: 2, name: 'Yomna', num: '01151796142'),
      UserModel(id: 3, name: 'Hager', num: '01004118010'),
      UserModel(id: 1, name: 'Ibrahim', num: '01064172976'),
      UserModel(id: 2, name: 'Yomna', num: '01151796142'),
      UserModel(id: 3, name: 'Hager', num: '01004118010'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fcai22-2.fna.fbcdn.net/v/t1.6435-1/117908035_1367161713486049_4362801163359341301_n.jpg?stp=dst-jpg_p320x320&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=SBGzELpOzr0AX8QwYax&_nc_ht=scontent.fcai22-2.fna&oh=00_AT8x5Jj3hRhOtGSmlQ8R_I30Slehzlx_YhxC8rzeV2Nw1w&oe=635383D3'),
          ),
        ),
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //space
              const SizedBox(
                height: 20,
              ),
              //status
              SizedBox(
                width: double.infinity,
                height: 95,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => statusItem(),
                  itemCount: 10,
                ),
              ),
              //space
              const SizedBox(
                height: 20,
              ),
              //main chat
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => chatItem(user[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: user.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusItem() => SizedBox(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai22-2.fna.fbcdn.net/v/t1.6435-1/117908035_1367161713486049_4362801163359341301_n.jpg?stp=dst-jpg_p320x320&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=SBGzELpOzr0AX8QwYax&_nc_ht=scontent.fcai22-2.fna&oh=00_AT8x5Jj3hRhOtGSmlQ8R_I30Slehzlx_YhxC8rzeV2Nw1w&oe=635383D3'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 2, 1),
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
            const Text(
              'Ibrahim Medhat Ibrahim Youssef',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget chatItem(UserModel user) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          '${user.id}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //space
          const SizedBox(
            width: 10,
          ),
          // name / message
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                SizedBox(
                  width: 200,
                  child: Text(
                    user.name,
                    maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                //space
                const SizedBox(
                  height: 5,
                ),
                //  message/time
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 200,
                      child: Text(
                        'hello this is the message kjdkjsdfkjdjkgfjdsfjdjfsdgfjdgsjffjhds',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('02:00 pm'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
