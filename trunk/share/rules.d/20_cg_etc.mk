# Configuration files

# We use stamp/etc as a dependency hook for generating all the configuration
# files into the 'etc' subdirectory. A particular target should be attached to
# stamp/etc if and only if it is intented as a configuration file to be
# symlinked to from /etc: stamp/etc writes its dependencies into a file for the
# install target to use.

stamp/etc: stamp/stamp Makefile
	echo $(filter etc/%,$^) >install-list
	touch $@

update: stamp/etc


# The 'install' target creates symlinks in /etc to the generated files in
# the etc subdirectory. Original files are first copied into etc.orig, so they
# are backed up and can be used for patching.
#
# Note how the 'etc.orig/%' and '/etc/%' rules do not depend on the files they
# use: they must not be re-run when they change. Also, the install-list can't
# be used as dependencies to install, since at the time the makefile is parsed
# it would not be up-to-date.

# This file is symlinked to by the "backups" of non-existent files
INEXISTENT=/usr/share/cfgf/INEXISTENT

# make must not remove those
.PRECIOUS: etc.orig/%

etc.orig/%:
	mkdir -p $(dir $@)
	# FIXME: is there actually a case in which this renaming might be used?
	if [ -e $@ ]; then \
		set -e; \
		STAMP=`date '+%Y%m%d%H%M%S'`; \
		echo "$@ already exists, renaming as $@.$(STAMP)"; \
		mv $@ $@.$(STAMP); \
	fi
	if ! [ -e /etc/$* ]; then \
		echo "marking original /etc/$* as inexistant"; \
		ln -s $(INEXISTENT) $@; \
	elif ! readlink /etc/$* | grep -q '^$(shell pwd)/'; then \
		echo "copying original /etc/$* to $(shell pwd)/$@"; \
		cp -a /etc/$* $@; \
	fi

install-stamp/etc/%: stamp/stamp etc.orig/% etc/%
	mkdir -p $(dir $@)
	echo "linking /etc/$* to $(CURDIR)/etc/$*"
	mkdir -p `dirname /etc/$*`
	ln -sf $(CURDIR)/etc/$* /etc/$*
	touch $@

install: stamp/etc
	$(MAKE) $(patsubst %,install-stamp/%,$(shell cat install-list))


