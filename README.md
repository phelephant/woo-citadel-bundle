A WooCommerce CITADEL Bundle is a simple script, that bundles several
wordpress plugins (and wordpress itself) into a single zip file, ready
for quick installation.

Note, however, that the distributed bundled versions **are likely to be
out of date**, and thus, **are insecure**. Therefore, it's recommended that
you take the hard road, and install everything manually.

Alternatively, you can just use the bundling script yourself. Don't
forget to adjust the version numbers for everything, though.

## Manual Installation

Download and install [WordPress][wordpress] normally.

Download and install [WooCommerce][woocommerce].

Download and install [StoreFront][storefront], the default WooCommerce theme.
Activate it as your main theme.

Download and install [CITADEL Merchant Gateway][cmg] plugin.

[wordpress]: https://wordpress.org/download
[woocommerce]: https://wordpress.org/plugins/woocommerce
[storefront]: https://wordpress.org/themes/storefront
[cmg]: https://wordpress.org/plugins/woo-citadelmerchant

Now, inside the WordPress admin panel, go to
`WooCommerce > Settings > Payments`, find and enable CITADEL Merchant Gateway,
and press "Manage".

Optionally, download and install [WooCommerce Checkout For Digital Goods][wccd]
plugin. If you're running a digital store, and don't need or want shipping /
billing information on the checkout page, this plugin will help.

[wccd]: https://wordpress.org/plugins/woo-checkout-for-digital-goods
