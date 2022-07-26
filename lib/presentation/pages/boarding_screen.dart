import 'package:carty_e_coomerce_app/business/cubits/boarding_cubit/boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/boarding_cubit/boarding_cubit.dart';
import '../../data/models/boarding_model.dart';
import '../widgets/default_text_button.dart';

class BoardingScreen extends StatelessWidget {
   BoardingScreen({Key? key}) : super(key: key);
  final boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardingCubit, BoardingState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  DefaultTextButton(
                    onTap: ()=> BoardingCubit.get(context).onBoardingSaved(context: context),
                    color: Colors.amberAccent,
                    title: 'SKIP',
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: boardController,
                        itemBuilder: (context, index) =>
                            buildBoardingItem(BoardingCubit.get(context).boards[index]),
                        itemCount: BoardingCubit.get(context).boards.length,
                        onPageChanged: (index) {
                          if (index == BoardingCubit.get(context).boards.length - 1) {
                            BoardingCubit.get(context).boardsLast(true);
                          } else {
                            BoardingCubit.get(context).boardsLast(false);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        FloatingActionButton(
                          onPressed: () {
                            if (BoardingCubit.get(context).isLast) {
                              BoardingCubit.get(context).onBoardingSaved(context: context);
                            } else {
                              boardController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: const Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        listener: (context, state) {});
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          Text(
            '${model.title}',
            style: const TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ],
      );
}
