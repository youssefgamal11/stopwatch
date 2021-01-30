import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) {
        return Model();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF1F2439),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: H * 0.08),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("stop watch",
                  style: GoogleFonts.openSans(
                      color: Colors.grey.shade300, fontSize: 45)),
            ),
            SizedBox(height: H * 0.2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Model>(
                  builder: (context, model, child) {
                    return Text(
                      model.timerdisplay,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    );
                  },
                ),
                SizedBox(
                  height: H * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<Model>(builder: (context, model, child) {
                      return SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Color(0xFF62DDD8),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                model.startisactive ? model.startsw() : null;
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.play),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(width: W*0.04),
                    Consumer<Model>(
                      builder: (context, model, child) {
                        return SizedBox.fromSize(
                          size: Size(56, 56),
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF62DDD8),
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  model.endisactive ? null : model.endsw();
                                }, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.stop),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: W*0.04),

                    Consumer<Model>(
                      builder: (context, model, child) {
                        return SizedBox.fromSize(
                          size: Size(56, 56),
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF62DDD8),
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  model.resetisactive ? null : model.resetsw();
                                }, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.redo),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
