Originally, `elm-css` was intended to be a CSS preprocessor - a way to write
Elm and generate `.css` files. Over two years of watching the library grow and
evolve, it's become clear that it makes more sense as a runtime library.

This means a few things.

1. Runtime performance matters now.

This has many implications. A big one is that we no longer instantiate values
"for free" any more.

Previously, the `none` value was a record with 23 fields
in it. All of these fields except for the string `"none"` itself were for the
benefit of the compiler.

This was no big deal when compiling to a `.css` file, since none of those fields
ever made it to the browser. Now that we are compiling to `.js`, and doing this
work in the end user's browser, it's a much bigger deal that we cut back on
runtime represntations.

By strategically changing types around, we can get it so that we have the same
compile-time guarantees as before, but without all the runtime overhead. As of
`elm-css` 12.0.0, `none` is a union type with one constructor, which holds only
a single `String`. This compiles to a JavaScript object with one field, which
a future release of the Elm compiler can optimize into the string `"none"` - in
other words, no runtime overhead at all!

2. Intermediate Representations

Because of the previous point, we can no longer afford to hang onto metadata
like what colors went into a given `Value`, what numbers are in there for
purposes of doing `Length` arithmetic, and so on.

This means that we'll have to do color mixing and length arithmetic outside
`elm-css`'s `Value` type.

3. No Warnings

Warnings for things like invalid Hex strings or RGB values also no longer make
sense. We wouldn't want to do the calculations for the warnings at runtime
for production users.

There are ways to figure these things out via static analysis (except of course
in cases where RGB values are being computed on the fly based on current state),
and it seems plausible that a separate tool could perform this analysis and
report problems.
