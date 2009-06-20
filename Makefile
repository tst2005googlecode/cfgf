# Targets:
#
#   test	run tests in tmp/
#   install	installs on the local system (or in $(DESTDIR))
#   clean	remove all the files created by 'test'
#
# You can also run targets inside tmp/ such as 'tmp/etc/nsswitch.conf',
# this makefile will invoke the cfgf command in the appropriate way.

default: test


# The installation can be tuned by adjusting the declarations below.
# You have to tune cfgf.conf as well if you make any change here.

DESTDIR =
LOCAL = /local

destdir_share = $(DESTDIR)/usr$(LOCAL)/share/cfgf
destdir_sbin = $(DESTDIR)/usr$(LOCAL)/sbin
destdir_etc = $(DESTDIR)/etc/cfgf
destdir_var = $(DESTDIR)/var$(LOCAL)/lib/cfgf

# This is overridden on the make command line when building as a Debian package.
cfgf_conf = cfgf.conf

tmp:
	mkdir -p $@

tmp/%: tmp non-stamp
	CFGF_CONFIG=cfgf.conf.tmp ./cfgf $*

test: tmp/test

install:
	install -d $(destdir_share) $(destdir_sbin) $(destdir_etc) $(destdir_var)
	cp -r share/* $(destdir_share)/
	install -m755 cfgf $(destdir_sbin)/
	install -m644 $(cfgf_conf) $(destdir_etc)/cfgf.conf

clean:
	$(RM) -r tmp

non-stamp:

