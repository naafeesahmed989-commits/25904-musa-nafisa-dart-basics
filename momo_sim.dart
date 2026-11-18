
// Student: Nafisa Ahmed Hassan Musa
// Reg no: 25904
const String regNo = '25904';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by NAHM
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by NAHM
  if (phone.length != 10) {
    return 'INVALID';
  }

  String masked = phone.substring(0, 3);

  int i = 3;
  while (i < phone.length - 2) {
    masked += '*';
    i++;
  }

  masked += phone.substring(phone.length - 2);

  return masked;
}
String formatRwf(int amount) {
  // by NAHM

  bool isNegative = amount < 0;
  String digits = amount.abs().toString();

  String result = '';
  int i = 0;

  while (i < digits.length) {
    result += digits[i];

    int remaining = digits.length - i - 1;

    if (remaining > 0 && remaining % 3 == 0) {
      result += ',';
    }

    i++;
  }

  if (isNegative) {
    result = '-$result';
  }

  return '$result RWF';
}

bool isValidPin(String pin) {
  // by NAHM

  if (pin.length != 5) {
    return false;
  }

  if (pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      return false;
    }

    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

int sendMoney(int balance, int amount) {
  // by NAHM

  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by NAHM

  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

void main() {
  // by NAHM
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('48214'));
  
  int balance = 20000 + t * 500;
  

  print('Starting balance: ${formatRwf(balance)}');

  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');



  // formatRwf tests
  print(formatRwf(0));       // Expected: 0 RWF
  print(formatRwf(999));     // Expected: 999 RWF
  print(formatRwf(1000));    // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000));   // Expected: -5,000 RWF

  // isValidPin tests
  print(isValidPin('48214')); // Expected: true
  print(isValidPin('12345')); // Expected: false
  print(isValidPin('77777')); // Expected: false
  print(isValidPin('48a21')); // Expected: false
  print(isValidPin('4821'));  // Expected: false
}