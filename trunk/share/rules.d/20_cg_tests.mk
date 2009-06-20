
%.passed: %.expected
	$(MAKE) $*
	@if cmp -s $< $*; then \
		echo "Test $* passed."; \
		touch $@; \
	else \
		echo "Test $* failed:"; \
		diff -u $< $*; \
		false; \
	fi

# Run all the tests
test:
	$(MAKE) $(shell cg_find -s tests -name \*.expected | sed 's/expected$$/passed/')

