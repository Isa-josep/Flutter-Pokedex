import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name='infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List <int> imagesIds= [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMontado = true; 
  @override
  void initState() {
    
    super.initState();  
    scrollController.addListener(() {
      if(scrollController.position.pixels+500 >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
      
    });
  } 

  @override
  void dispose() {
    scrollController.dispose();
    isMontado = false;
    super.dispose();
  }
  
  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed( const Duration(seconds: 2));
    addImg();
    isLoading = false;

    if(!isMontado) return;
    setState(() {});
    moveScroll();
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if(!isMontado) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    addImg();
    setState(() {});
    
  }

  void  moveScroll(){
    if(scrollController.position.pixels+150<=scrollController.position.maxScrollExtent)return;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent+150,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    ); 
  }

  void addImg(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5,].map((e)=>lastId+e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,    // 18-20+1 se quita el padding del status bar
        child: RefreshIndicator(
          onRefresh: onRefresh ,
          edgeOffset: 20, //distancia del inicio para que se active el refresh
          strokeWidth: 2, //grosor de la linea de carga
          backgroundColor: Colors.white70, //color de fondo de la linea de carga
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (constext, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage("https://picsum.photos/id/${imagesIds[index]}/500/300"),
                
              );
            }
          ),
        ),
      ),
       
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(),
        
        

       // child: const Icon(Icons.arrow_back),
          child: isLoading? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_outlined),
         ):  FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}