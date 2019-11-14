#!/bin/bash

function download_file()
{
    URL=$1
    if [ `which wget` == "" ]; then
    # USE CURL
    curl -O "$URL"
    else
    wget "$URL"
    fi
    return $?
}

VER_WP=5.2.3
VER_WOO=3.7.0
VER_SF=2.5.3

VER_WOO_CITADEL=1.3
VER_WOO_CHECKOUT=2.8

## Download

download_file https://wordpress.org/wordpress-${VER_WP}.zip
download_file https://downloads.wordpress.org/plugin/woocommerce.${VER_WOO}.zip
download_file https://downloads.wordpress.org/theme/storefront.${VER_SF}.zip
# citadel merchant
download_file https://downloads.wordpress.org/plugin/woo-citadelmerchant.${VER_WOO_CITADEL}.zip
# woo billing fields remover
download_file https://downloads.wordpress.org/plugin/woo-checkout-for-digital-goods.${VER_WOO_CHECKOUT}.zip

## Unzip

unzip wordpress-${VER_WP}.zip
unzip woocommerce.${VER_WOO}.zip
unzip storefront.${VER_SF}.zip
unzip woo-citadelmerchant.${VER_WOO_CITADEL}.zip
unzip woo-checkout-for-digital-goods.${VER_WOO_CHECKOUT}.zip
rm *.zip # cleanup

## Bundle

mv woocommerce wordpress/wp-content/plugins/.
mv storefront wordpress/wp-content/themes/.
mv woo-checkout-for-digital-goods wordpress/wp-content/plugins/.
mv woo-citadelmerchant wordpress/wp-content/plugins/.
## Patch woo-checkout
patch -d wordpress/wp-content/plugins/woo-checkout-for-digital-goods -p1 < patches/goods.patch
## Add custom stylesheet
cp patches/style.css wordpress/wp-content/themes/storefront/style.css

## Zip

zip -r cm-bundle_wp${VER_WP}_wc${VER_WOO}_sf${VER_SF}.zip wordpress
rm -rf wordpress # cleanup
