# Building targets with M4
#
# Files whose name suffixed in .m4 are passed through M4, with definitions from
# the m4 subdirectories loaded. In order to speed up the process, a frozen
# state file is created from their contents and used when running m4 targets.

M4 = m4 -P
M4FLAGS = 
m4state = m4f
m4command = $(M4) -R $(m4state)

# the files in m4h.d are concatenated into m4h
$(eval $(call dot_d_rule,m4h))

# create the M4 frozen state file
$(m4state): m4h
	$(M4) -F $@.n $(M4FLAGS) $<
	mv $@.n $@

# and use it to preload M4 for generating files
%.new: %.m4 $(m4state)
	$(m4command) $(M4FLAGS) $< >$@.n
	mv $@.n $@

# This invokes m4 in a cfgf context for the user to test stuff.
runm4: $(m4state)
	$(m4command) -

