
What to do with the downloaded icon.kitchen zip...

update the web manifest.json with app's title and description and replace the icons section with:

      "icons": [
        { "src": "/favicon.ico", "type": "image/x-icon", "sizes": "16x16 32x32" },
        { "src": "/icon-192.png", "type": "image/png", "sizes": "192x192" },
        { "src": "/icon-512.png", "type": "image/png", "sizes": "512x512" },
        { "src": "/icon-192-maskable.png", "type": "image/png", "sizes": "192x192", "purpose": "maskable" },
        { "src": "/icon-512-maskable.png", "type": "image/png", "sizes": "512x512", "purpose": "maskable" }
      ]

update index.html, replacing 

    <link rel="icon" type="image/png" href="favicon.png"/>

with

    <link rel="icon" href="/favicon.ico" sizes="any">
    <link rel="apple-touch-icon" href="icons/Icon-192.png">

rm web/favicon.png
cp assets/iconKitchen-Output/web/apple-touch-icon.png web
cp assets/iconKitchen-Output/web/favicon.ico web
rm -f web/icons/*
cp assets/iconKitchen-Output/web/icon* web/icons

rm ios/Runner/Assets.xcassets/LaunchImage.appiconset/*
cp assets/iconKitchen-Output/ios/* ios/Runner/Assets.xcassets/LaunchImage.appiconset

rm -rf android/app/src/main/res/mipmap*
cp assets/iconKitchen-Output/android/res/* android/app/src/main/res
