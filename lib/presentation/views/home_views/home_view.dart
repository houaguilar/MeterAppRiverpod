import 'package:app_with_riverpod/domain/domain.dart';
import 'package:app_with_riverpod/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isListMode = ref.watch(listModeProvider);

    getDevice() {
      return MediaQuery.of(context).size.width <= 800 ? "Mobile" : "Web";
    }

    return Scaffold(
      body: getDevice() == "Mobile" ? Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            SizedBox(height: 20,),

            Expanded(child: _HomeScreenView()),
          ],
        ),
      )
      : Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20,),

            Expanded(
              child: Container(
                alignment: AlignmentDirectional.center,
                child: const Row(
                  children: [
                    Expanded(child: SizedBox()),
                    SizedBox(
                        width: 800,
                        height: double.infinity,
                        child: _HomeScreenView(),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(listModeProvider.notifier).toggleListMode();
        },
        child: isListMode ? const Icon(Icons.list) : const Icon(Icons.grid_view),
      ),
    );
  }
}

class _HomeScreenView extends ConsumerWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = HomeModel.generateTasks();
    final isListMode = ref.watch(listModeProvider);

    return isListMode
        ? ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.asset(data[index].imageAsset),
            title: Text(data[index].title),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.pushNamed(data[index].location);
            },
            tileColor: data[index].bgColor,
          ),
        );
      },
      itemCount: data.length,
    )
        : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              //add shadow
              color: data[index].bgColor,
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data[index].imageAsset),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(data[index].title),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      context.pushNamed(data[index].location);
                    },
                  )
                ],
              ),
            ),
          );
        },
        itemCount: data.length);
  }
}