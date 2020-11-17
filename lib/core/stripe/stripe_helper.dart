import 'package:stripe_payment/stripe_payment.dart';

class StripeHelper {
  static const STRIPE_PUBLIC_KEY = 'pk_test_51HoQwQDtNGIrtED3uHzVS0BvUzJQxu9bupbvFUh8lzLCu3zLbosPN5IuywHqgF8QKha2jrNAwU0WD6gmv20sas6M00Fi74EEOA';

  static void init() {
    StripePayment.setOptions(StripeOptions(publishableKey: STRIPE_PUBLIC_KEY, merchantId: "Test", androidPayMode: 'test'));
  }
}
