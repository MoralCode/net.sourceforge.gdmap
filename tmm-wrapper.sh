#!/bin/sh

# 1. Define the writable data path
DATA_DIR="${XDG_DATA_HOME}/tinyMediaManager"
mkdir -p "$DATA_DIR"

# 2. Set up the Classpath (matching the YAML)
# We include /app/tmm.jar and all jars in /app/lib and /app/addons
CP="/app/tmm.jar:/app/lib/*:/app/addons/*"

# 3. Launch Java directly
# We use the JRE bundled in the archive (located at /app/jre/bin/java)
cd "$DATA_DIR"
exec /app/jre/bin/java \
  -cp "$CP" \
  -Dtmm.contentfolder="$DATA_DIR" \
  -Djava.awt.headless=false \
  -Dadd-opens=java.base/sun.net.www.protocol.http=ALL-UNNAMED \
  --enable-native-access=ALL-UNNAMED \
  -Xms64m \
  -Xmx512m \
  -Xss512k \
  -XX:+IgnoreUnrecognizedVMOptions \
  -XX:+UseStringDeduplication \
  -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderingEngine \
  -Djava.net.preferIPv4Stack=true \
  -Dfile.encoding=UTF-8 \
  -Dsun.jnu.encoding=UTF-8 \
  -Djna.nosys=true \
  -Dawt.useSystemAAFontSettings=on \
  -Dswing.aatext=true \
  -Dtmm.consoleloglevel=DEBUG \
  org.tinymediamanager.TinyMediaManager "$@"