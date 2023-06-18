import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investkuy/data/data_state.dart';
import 'package:investkuy/ui/cubit/detail_umkm_cubit.dart';
import 'package:investkuy/ui/cubit/pendanaan_cubit.dart';

class InvestorConfirmWithdrawScreen extends StatelessWidget {
  const InvestorConfirmWithdrawScreen({super.key, required this.pendanaanId, required this.id});

  final int pendanaanId;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi'),
        backgroundColor: const Color(0xff19A7CE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PendanaanCubit, DataState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Apakah Anda ingin melakukan withdraw?",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<PendanaanCubit>()
                              .withdrawPendanaan(pendanaanId);
                          if (state is SuccessState) {
                            SnackBar snackBar = const SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text(
                                "Anda berhasil melakukan withdraw!",
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(const Duration(seconds: 1), () {
                              BlocProvider.of<DetailUmkmCubit>(context)
                                  .getDetailUmkm(id.toString());
                              context.read<PendanaanCubit>().resetState();
                              Navigator.pop(context);
                            });
                          } else if (state is ErrorState) {
                            SnackBar snackBar = SnackBar(
                              duration: const Duration(seconds: 5),
                              content: Text(state.message),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 35),
                          backgroundColor: const Color(0xff19A7CE),
                        ),
                        child: const Text('Ya'),
                      ),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 35),
                          side: const BorderSide(
                            color: Color(0xff19A7CE),
                          ),
                        ),
                        child: const Text('Tidak'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}