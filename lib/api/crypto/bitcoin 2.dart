import 'dart:convert';

import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:http/http.dart';

class BitcoinWallet {
  static HDWallet bitcoinWallet;
  static String seed;
  static String balance;
}

Future<HDWallet> generateWallet() async {
  String mnemonic = bip39.generateMnemonic();
  var seed = bip39.mnemonicToSeed(mnemonic);
  var bitcoinWallet = new HDWallet.fromSeed(seed);

  BitcoinWallet.bitcoinWallet = bitcoinWallet;
  BitcoinWallet.seed = mnemonic;
  BitcoinWallet.balance = await getBalance(bitcoinWallet.base58);

  return BitcoinWallet.bitcoinWallet;
}

// Address needs to be in base58 or hash160.
Future<String> getBalance(String bitcoinAddress) async {
  String _url = "https://blockchain.info/rawaddr/" + bitcoinAddress;
  var response = await get(_url);
  print(
      "Response from API (getBalance, ${response.statusCode}) ${jsonDecode(response.body)}");
  return jsonDecode(response.body)['final_balance'];
}
