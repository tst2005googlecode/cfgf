# Generate the makefile from parts un rules.d

# XXX: this is necessary for bootstrapping, although 40_cg_dotd_rules.mk.gen
# will eventually handle it. We should use a conditional to avoid evaluating
# this code once the bootstrap Makefile has been generated, and slience the
# corresponding warning.
$(eval $(call dot_d_rule,rules))

Makefile: rules
	cp $< $@

