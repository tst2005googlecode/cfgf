# Generate the makefile from parts un rules.d

# Normally, 40_cg_dotd_rules.mk.gen will automatically instantiate the
# directory rule which is used to build the "rules" file from "rules.d".
# However, when bootstrapping, we only assemble the *.mk fragments which
# do not need any processing. Therefore, for the bootstrap Makefile we
# need to instantiate the rule manually.
ifndef CG_DOTD_RULES_BOOTSTRAPPED
$(eval $(call dot_d_rule,rules))
endif

Makefile: rules
	cp $< $@

