# Stamps files are mainly intended as "dependency hooks", all of them using the
# same implicit rule below. For those cases where this is not sufficient,
# explicit rules must be used.

stamp/%:
	mkdir -p $(shell dirname $@)
	touch $@

