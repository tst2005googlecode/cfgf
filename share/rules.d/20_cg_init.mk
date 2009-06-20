# Configuration changes notification to daemons

stamp/init.d/%:
	invoke-rc.d $* force-reload
	mkdir -p $(dir $@) && touch $@

reload: stamp/init

