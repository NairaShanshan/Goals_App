import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/cubit/cubit.dart';
import 'package:goals_app/cubit/states.dart';
import 'package:goals_app/widgets/goal_widget.dart';

class GoalList extends StatelessWidget {
  const GoalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoalCubit, GoalStates>(
        builder: (context, state) {
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => GoalWidget(
                  goalName: GoalCubit.get(context).goalsList[index]['name'],
                  id: GoalCubit.get(context).goalsList[index]['id'],
                  context: context),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: GoalCubit.get(context).goalsList.length);
        },
        listener: (context, state) {});
  }
}
