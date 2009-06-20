m4_define(`foo', `bar')m4_dnl

# cg_if
cg_if(`2 + 2 == 4',
       	`indeed', `hey, this is a parallel universe !')
cg_if(`0x2B | !0x2B == 42',
       	`sure', `it might be the question but is not the answer')

# cg_resyscmd
cg_resyscmd(`echo "foo bar baz" | tr " " "\n"', `^ba(.)')

# cg_quote
cg_quote(0, `foo')
cg_quote(1, `foo')
cg_quote(2, `foo')
cg_quote(3, `foo')
cg_quote(4, `foo')
cg_quote(0, `foo', `foo')
cg_quote(1, `foo', `foo')
cg_quote(2, `foo', `foo')
cg_quote(3, `foo', `foo')
cg_quote(4, `foo', `foo')

