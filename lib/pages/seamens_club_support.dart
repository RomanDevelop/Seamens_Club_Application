import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/blocs/videos_bloc.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SeamenSClubSupport extends StatefulWidget {
  SeamenSClubSupport({Key? key}) : super(key: key);

  @override
  _SeamenSClubSupportState createState() => _SeamenSClubSupportState();
}

class _SeamenSClubSupportState extends State<SeamenSClubSupport>
    with AutomaticKeepAliveClientMixin {
  ScrollController? controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _orderBy = 'timestamp';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      controller = new ScrollController()..addListener(_scrollListener);
      context.read<VideosBloc>().getData(mounted, _orderBy);
    });
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final db = context.read<VideosBloc>();

    if (!db.isLoading) {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        context.read<VideosBloc>().setLoading(true);
        context.read<VideosBloc>().getData(mounted, _orderBy);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('SeamenS Club Support').tr(),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Feather.rotate_cw,
              size: 22,
            ),
            onPressed: () async {
              context.read<VideosBloc>().onRefresh(mounted, _orderBy);
            },
          )
        ],
      ),
      body: Center(child: Text('GPT chat')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
