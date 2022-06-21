
/*
Column teklList() {
    var booksRef = _firestore.collection('books');
    //var witcherRef = _firestore.collection('books').doc('Witcher');
    var witcherRef = booksRef.doc('Witcher');
    return Column(
      children: [
        Card(
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(Icons.add),
            title: Text('${witcherRef.id}'),
            subtitle: Text('İçeriği'),
            trailing: Icon(Icons.book_rounded),
          ),
        ),
        Divider(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              var response = await booksRef.get();
              var list = response.docs;
              print(list.first.data());
            },
            child: Text('Get Data')),
        StreamBuilder<QuerySnapshot>(
            stream: booksRef.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                // hata yı burda düzelttim
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(
                          '${snapshot.data!.docs[index].data()}',
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle: Text('Boş'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await snapshot.data!.docs[index].reference.delete();
                          },
                        )),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }),

        /*StreamBuilder<DocumentSnapshot>(
          stream: witcherRef.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> asyncsnapshot) {
            return Text('${asyncsnapshot.data?.data()}');
          },
        )
        */
      ],
    );

    */