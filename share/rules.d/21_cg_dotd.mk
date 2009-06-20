# Unfortunately, GNU make doesn't provide an efficient way to implement the %.d
# rule automatically. We work around the problem by providing a (make) macro to
# create them manually.

define dot_d_rule
$(1): $(1).d $$(shell cg_find $(1).d -maxdepth 1 -mindepth 1 -exec cg_target {} \;)
	cat /dev/null $$(filter-out $(1).d _source,$$^) > $$@.n
	mv $$@.n $$@
endef

