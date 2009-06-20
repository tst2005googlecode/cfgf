
sub m4ify_list {
	my @l;

	foreach $elt (@_) {
		$elt = m4ify_list(@$elt) if @$elt;
		push @l, $elt;
	}

	return join(", ", map("`$_'", @l));
}

1;
