#!/bin/bash
set +o histexpand
pkg in nodejs jq termux-api termux-services

npm install -g sehmbimanvir/truecaller-cli

cp termux-truecaller $PREFIX/bin
mkdir -p $PREFIX/var/service/truecaller/log
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/truecaller/log/run

echo -e "#!/bin/bash \ntermux-truecaller" > $PREFIX/var/service/truecaller/run
chmod +x $PREFIX/var/service/truecaller/run

sv up truecaller
sv-enable truecaller

