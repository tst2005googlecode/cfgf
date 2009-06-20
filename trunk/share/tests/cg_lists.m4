m4_define(`trap', `TRAPPED!')m4_dnl
m4_define(`list1', ``one',`two',`three'')m4_dnl
m4_define(`list2', ``first', second,`trap', `', `fifth'')m4_dnl

# cg_list
cg_list(list1)
cg_list(list2)

# cg_len
cg_len(list1)
cg_len(list2)
cg_len(list1, list2,,,)
cg_len(`foo', list2, `bar', list1, `baz')
cg_len
cg_len()
cg_len(,,)

# cg_tail
cg_tail(0, list1)
cg_tail(2, list1)
cg_tail(2, list2)
cg_tail(10, list2)

# cg_head
cg_head(0, list1)
cg_head(1, list1)
cg_head(2, list1)
cg_head(3, list1)
cg_head(4, list1)
cg_head(4, cg_tail(2, list2), list1)

# cg_index
cg_index(2, list2)
cg_index(5, list1)
cg_index(4, list2)

# cg_lookup
cg_lookup(`one', list1)
cg_lookup(`two', list1)
cg_lookup(`three', list1)
cg_lookup(`four', list1)
cg_lookup(`trap', list2)
cg_lookup(`', list2)
cg_lookup(`', list1)
cg_lookup(`fifth', list2)

# cg_reverse
cg_reverse(list1)
cg_reverse(list2)

# cg_foreach
cg_foreach(`foo', 1, `m4_ifelse(
foo, `three', `rules',
foo, `', `bi',
foo, `one', ` ',
foo, `fifth', `an',
foo, `trap', `de')', cg_list(list2),list1)

# cg_map
cg_map(`foo', 1, `foo', list1)
cg_map(`bar', 1, `the bar', list2)

# cg_grep
cg_grep(`E', 1, `m4_len(E)', `3', list1)
cg_grep(`E', 1, `m4_regexp(E, `^$\|trap')', `-1', list2)

# cg_split
cg_split(` ', `we trap`'ped this string')

# cg_join
cg_join(` ', `and', `this', `list', `is', `trap`'ped', `as', `well')

# cg_field
cg_field(`one', cg_quote(2, list1), cg_quote(2, list2))
cg_field(`first', cg_quote(2, list1), cg_quote(2, list2))

