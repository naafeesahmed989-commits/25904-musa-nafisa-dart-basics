
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

void main() {
  // by NAHM
  print('Reg no: $regNo | D = $d | T = $t');

  int i = 1;
  int totalFees = 0;
  String phone = maskPhone('0788123456');

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print('Receipt $i | $amount RWF | fee $fee RWF | to $phone');

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');
}
