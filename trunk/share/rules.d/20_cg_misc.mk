# Miscelaneous build rules

# This rule can be used to force a target to be rebuilt even when its
# dependencies are up-to-date, usually in conjunction with a .new intermediate.
# This is necessary when external data are used to build the target.

ALWAYS_DO:

# Sometimes we need to do a query to check if anything changed. And when
# nothing changed, we'd like to avoid a complete rebuild of the rules which
# depend on it as a result of an updated timestamp.
#
# When a file is first created with a ".new" suffix, this rule overwrites the
# final one only if it is different, or discards the .new file if it is
# identical to its predecessor.

.PRECIOUS: %.new
%: %.new
	cmp -s $@ $< || cp -a $< $@

# Some configuration files just need no runtime customization; a .static
# extension is added to their names and they use the following rule. We could
# let the autolinking stuff handle this, but there's some benefit in having a
# full, coherent /var/lib/cfgf/etc, rather than using the links in /etc to
# point here and there.

%: %.static
	ln -sf $< $@

# This rule generate a file by running a script and capturing its output.
# The script is always run and a .new file is created to avoid updating
# depending targets when it's not necessary.

gen_stem = $(shell echo $< | sed 's/\.gen$$//')
%.new: %.gen ALWAYS_DO
	$< >$@

runsh:
	/bin/sh
