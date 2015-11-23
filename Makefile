SHELL = /bin/sh

all : gfw.action

gfwlist.txt :
	/usr/bin/curl https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt | base64 -D > $@

gfw.action : gfwlist.txt
	./autoproxy2privoxy $< > $@

.PHONY : clean
clean :
	-rm gfwlist.txt gfw.action
