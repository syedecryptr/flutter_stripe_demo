@JS()
library stripe;

import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe_demo/constants.dart';
import 'package:js/js.dart';

void redirectToCheckout(BuildContext context) {
  Stripe(apiKey).redirectToCheckout(CheckoutOptions(
    lineItems: [
      LineItem(
        price: nikesPriceId,
        quantity: 1,
      )
    ],
    mode: 'payment',
    successUrl: 'http://localhost:8080/#/success',
    cancelUrl: 'http://localhost:8080/#/cancel',
  ));
}

@JS()
class Stripe {
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions checkoutOptions);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external String get sessionId;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}