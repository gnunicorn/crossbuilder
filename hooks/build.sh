cd src/cordova-rust-plugin/native/rust;
# iOS
cargo lipo --release;
cp target/universal/release/lib* ../ios/;
# soon android:
#cargo build --target aarch64-linux-android --release;
#cargo build --target armv7-linux-androideabi --release;
#cargo build --target i686-linux-android --release;
#sh update_libs.sh;
cd ../../../..;
npm run build:cordova;
