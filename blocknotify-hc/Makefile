OUT_GO=blocknotify-hc
OUTPUT=blocknotify-hc
ROOT=`pwd`

all:
	rm -f $(OUT_GO)
	rm -rf vendor
	glide install
	ln -s ../vendor vendor/src
	rm -f vendor/src/github.com/HcashOrg/hrpcclient/wallet.go
	GOPATH="$(GOPATH):$(ROOT)/vendor" go build

install: all
	strip -s $(OUT_GO)
	killall -9 $(OUTPUT) || echo ok
	mv $(OUT_GO) ../bin/$(OUTPUT)
	sh -c "../bin/$(OUTPUT) &"

clean:
	rm -f $(OUT_GO)
	rm -rf vendor

