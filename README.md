read -s TELE_TOKEN
echo $TELE_TOKEN
export TELE_TOKEN

go build -ldflags "-X="github.com/vit-um/kbot/cmd.appVersion=v1.0.2
./kbot go