import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  String imageUrl;
  String name;

  Person(this.imageUrl, this.name) {}
}

class Post {
  Person person;
  List<String> postImageUrls;
  String postContent;
  String time;
  int likes;
  int shares;
  int comments;
  bool hasLiked;

  Post(
      {this.person,
      this.postContent,
      this.postImageUrls,
      this.likes,
      this.time,
      this.comments,
      this.shares,
      this.hasLiked}) {}
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> people = [
    new Person(
        "https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
        "Niek Bove"),
    new Person(
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        "Peterson"),
    new Person(
        "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        "Sudanka"),
    new Person(
        "https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        "Sheber"),
    new Person(
        "https://images.unsplash.com/photo-1548946526-f69e2424cf45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        "Winston"),
  ];
  List<Post> posts = [
    new Post(
        person: new Person(
            "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80",
            "Zoe Banks"),
        postContent:
            "I want to travel the world with you one day.",
        postImageUrls: [
          "https://images.unsplash.com/photo-1518623489648-a173ef7824f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
          "https://images.unsplash.com/photo-1523810804307-760585ed63cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
          "https://images.unsplash.com/photo-1519101236449-ac8098e16f15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        ],
        time: "6:30pm",
        comments: 13,
        shares: 13,
        likes: 78,
        hasLiked: true),
    new Post(
        person: new Person(
            "https://images.unsplash.com/photo-1477724902304-4d75535625a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80",
            "Rebecca Mitchell"),
        postContent:
            "Yeah, home is cool. But this beach is cooler.",
        postImageUrls: [
          "https://images.unsplash.com/photo-1506472634167-c6776cd44d07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
          "https://images.unsplash.com/photo-1516815005220-e4412f36ae14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2253&q=80",
        ],
        time: "9:42pm",
        likes: 99,
        hasLiked: false,
        shares: 34,
        comments: 53)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              children: <Widget>[
                titleAndSearchIcon(context),
                Container(
                  color: Colors.white,
                  height: 38.0,
                ),
                popular(context),
                Container(
                  color: Colors.white,
                  height: 20.0,
                ),
                personListHorizontal(),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: <Widget>[
                          Container(
                            height: 10.0,
                            color: Colors.transparent,
                          ),
                          socialMediaCard(context, posts[index]),
                        ]);
                      }),
                )
              ],
            ),
          ),
        ));
  }

  Container socialMediaCard(BuildContext context, Post post) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 14.0),
        height: 290.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 90.0,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Container(
                            height: 55.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.0, 5.0),
                                      blurRadius: 10.0,
                                      color: Colors.black54)
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(post.person.imageUrl))),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14.0, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              post.person.name,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Text(
                          post.time,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(post.postContent, textAlign: TextAlign.left,)),
                  Container(
                    height: 130.0,
                    child: ListView.builder(
                        itemCount: post.postImageUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Container(
                              width: 145.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(post.postImageUrls[i])),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <
                  Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up,
                      size: 20.0,
                          color: post.hasLiked
                              ? Colors.green
                              : Colors.black54),
                      onPressed: () {
                        setState(() {
                          post.hasLiked = !post.hasLiked;

                          post.hasLiked ? post.likes ++ : post.likes --;
                        });
                      },
                    ),
                    Text(post.likes.toString(), style: TextStyle(color: Colors.black54)),
                    IconButton(
                      icon: Icon(Icons.share, size: 20.0, color: Colors.black54),
                      onPressed: () {},
                    ),
                    Text(post.shares.toString(), style: TextStyle(color: Colors.black54),),
                    IconButton(
                      icon: Icon(Icons.message, size: 20.0, color: Colors.black54),
                      onPressed: () {},
                    ),
                    Text(post.comments.toString(), style: TextStyle(color: Colors.black54))
                  ],
                ),
                Container(
                  height: 25.0,
                  width: 70.0,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(people[index].imageUrl))));
                      }),
                ),
              ]),
            )
          ],
        ));
  }

  Container popular(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Popular",
              style: Theme.of(context).textTheme.subtitle.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.75))),
          Text(
            "More >",
            style: TextStyle(color: Colors.black.withOpacity(0.3)),
          )
        ],
      ),
    );
  }

  Container titleAndSearchIcon(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("MyTravel",
              style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: Colors.black.withOpacity(0.78))),
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 28.0,
          )
        ],
      ),
    );
  }

  Container personListHorizontal() {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        height: 100.0,
        color: Colors.white,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: people.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 27.0,
                        backgroundImage: NetworkImage(people[index].imageUrl)),
                    SizedBox(height: 10.0),
                    Text(
                      people[index].name,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    )
                  ],
                ),
              );
            }));
  }
}
