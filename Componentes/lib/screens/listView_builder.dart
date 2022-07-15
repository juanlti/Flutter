import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  final informacionDeListView = ScrollController();
  bool isLoading = false;

  final List<int> informacion = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    informacionDeListView.addListener(() {
      if ((informacionDeListView.position.pixels + 500 / 2 >=
          informacionDeListView.position.maxScrollExtent)) {
        fetchData();
      }
    });
  }

  void rechardeDate() {
    final variableAux = informacion.last;
    informacion.addAll([1, 2, 3].map((e) => variableAux + e));

    setState(() {});
  }

  //funcion asincrona
  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 5));
    rechardeDate();
    if ((informacionDeListView.position.pixels + 500 / 2 >=
        informacionDeListView.position.maxScrollExtent)) {
      informacionDeListView.animateTo(
          informacionDeListView.position.pixels + 400,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn);
    }

    isLoading = false;
    setState(() {});
  }

  Future<void> cleanAndAdd() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastInformation = informacion.last;
    informacion.clear();
    informacion.add(lastInformation + 1);
    print('ultimo valor $informacion');
    // rechardeDate();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('cantidad ${informacion.length} y  $isLoading'),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: cleanAndAdd,
            child: ListView.builder(
              controller: informacionDeListView,
              itemCount: informacion.length,
              itemBuilder: (context, index) {
                //https://picsum.photos/id/237/200/300
                return FadeInImage(
                  imageSemanticLabel: 'valor ==> $index',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 300,
                  placeholder: const AssetImage('assets/image/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300?image=${informacion[index]}'),
                );
              },
            ),
          ),
          if (isLoading)
            Positioned(
              bottom: 40,
              left: size.width / 2 - 30,
              child: const LoadingIcon(),
            ),
        ],
      ),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.5),
      ),
      height: 60,
      width: 60,
      child: const CircularProgressIndicator(
        color: Colors.black,
        backgroundColor: Colors.red,
      ),
    );
  }
}
