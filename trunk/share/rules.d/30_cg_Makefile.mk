# Generate the makefile from parts un rules.d

$(eval $(call dot_d_rule,rules))

Makefile: rules
	cp $< $@

