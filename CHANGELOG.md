## Releases
| Version | Notes |
| ------- | ----- |
| [18.0.0](https://github.com/rtfeldman/elm-css/tree/18.0.0) | Add `line-height: normal` ([#578](https://github.com/rtfeldman/elm-css/pull/578)) and `keyedLazy` ([#584](https://github.com/rtfeldman/elm-css/pull/584))
| [17.1.1](https://github.com/rtfeldman/elm-css/tree/17.1.1) | Allow multiple `css` attributes on node ([#566](https://github.com/rtfeldman/elm-css/pull/566))
| [17.1.0](https://github.com/rtfeldman/elm-css/tree/17.1.0) | Support nonces ([#569](https://github.com/rtfeldman/elm-css/pull/569))
| [17.0.5](https://github.com/rtfeldman/elm-css/tree/17.0.5) | Fix SVG styling bug ([#565](https://github.com/rtfeldman/elm-css/pull/565))
| [17.0.4](https://github.com/rtfeldman/elm-css/tree/17.0.4) | Fix `className` bug ([#562](https://github.com/rtfeldman/elm-css/pull/562))
| [17.0.3](https://github.com/rtfeldman/elm-css/tree/17.0.3) | Fix styled SVG element bug ([#543](https://github.com/rtfeldman/elm-css/issues/543))
| [17.0.2](https://github.com/rtfeldman/elm-css/tree/17.0.2) | Fix span style wrapping causing problems in grid container ([#557](https://github.com/rtfeldman/elm-css/issues/557)), improve hashing performance ([#555](https://github.com/rtfeldman/elm-css/pull/555), [#556](https://github.com/rtfeldman/elm-css/pull/556))
| [17.0.1](https://github.com/rtfeldman/elm-css/tree/17.0.1) | Fix interaction with Dark Reader extension ([#542](https://github.com/rtfeldman/elm-css/pull/542))
| [17.0.0](https://github.com/rtfeldman/elm-css/tree/17.0.0) | Make `animation-iteration-count` work with `infinite` ([#541](https://github.com/rtfeldman/elm-css/pull/541))
| [16.1.0](https://github.com/rtfeldman/elm-css/tree/16.1.0) | Expose `CalculatedLength` ([#519](https://github.com/rtfeldman/elm-css/pull/519)), vendor Murmur3 dependency for now ([#528](https://github.com/rtfeldman/elm-css/pull/528))
| [16.0.2](https://github.com/rtfeldman/elm-css/tree/16.0.2) | Fix SVGKeyed ([#520](https://github.com/rtfeldman/elm-css/pull/520))
| [16.0.1](https://github.com/rtfeldman/elm-css/tree/16.0.1) | Fix bug with outputting "sec" instead of "s" for seconds.
| [**16.0.0**](https://github.com/rtfeldman/elm-css/tree/16.0.0) | Add first-class animation keyframes support. (#431) Remove `asPairs`, `Css.Namespace`, and arithmetic operators. Don't report warnings, just emit CSS. Make `Property` opaque and more efficient. Fix `withMedia` nesting bug. (#352) Rename `Css.Foreign` to `Css.Global`. (#360) Remove `Css.Colors`. (#358) Remove experimental border properties. (#438) Remove experimental `dir` pseudo-class. (#442) Change `class`, `id`, and `animationName` to accept a `String`.
| [**14.0.0**](https://github.com/rtfeldman/elm-css/tree/14.0.0) | Remove `Css.asPairsDEPRECATED` in favor of `DEPRECATED.Css.asPairs`. (#352) Fix bug in `borderBottomWidth` functions. (#380) Make `styled` more flexible. (#420) Add `pointerEvents` (#377). Add `Css.Transitions`.
| [**13.1.1**](https://github.com/rtfeldman/elm-css/tree/13.1.1) | Fix `AngleOrDirection` bug (#356)
| [**13.1.0**](https://github.com/rtfeldman/elm-css/tree/13.1.0) | Add program, programWithFlags, and beginnerProgram to Html.Styled. (#381) Add `withAttribute`. (#389)
| [**13.0.1**](https://github.com/rtfeldman/elm-css/tree/13.0.1) | Remove extraneous Debug.log
| [**13.0.0**](https://github.com/rtfeldman/elm-css/tree/13.0.0) | Disallow using multiple `css` attributes in same element, to fix #337. Fix Html.Styled.Lazy (#348). Add Svg.Styled (#339). Improve docs for Css.Foreign (#353).
| [**12.0.1**](https://github.com/rtfeldman/elm-css/tree/12.0.1) | Add deprecation warning to upgrade to 13.0.0 for critical bugfixes
| [**12.0.0**](https://github.com/rtfeldman/elm-css/tree/12.0.0) | Add Html.Styled, move Css.Elements and others into Css.Foreign, move Css.stylesheet into Css.File, rename `text` to `text_`, deprecate Css.Namespace (immediately) and Css.File (eventually)
| [**8.1.0**](https://github.com/rtfeldman/elm-css/tree/8.1.0) | Expose some types, fix mixing bugs
| [**8.0.0**](https://github.com/rtfeldman/elm-css/tree/8.0.0) | Switch from `(#)` and `(.)` to `class` and `id`
| [**7.0.0**](https://github.com/rtfeldman/elm-css/tree/7.0.0) | Upgrade to Elm 0.18
| [**6.1.0**](https://github.com/rtfeldman/elm-css/tree/6.1.0) | Add box styles and table display options.
| [**6.0.0**](https://github.com/rtfeldman/elm-css/tree/6.0.0) | `float` is now `num`. Length units expose type aliases, e.g. `Px`. Many new keywords!
| [**5.0.0**](https://github.com/rtfeldman/elm-css/tree/5.0.0) | Have `compile` accept multiple files, add more keywords.
| [**4.0.2**](https://github.com/rtfeldman/elm-css/tree/4.0.2) | Fix for [#140](https://github.com/rtfeldman/elm-css/issues/140)
| [**4.0.1**](https://github.com/rtfeldman/elm-css/tree/4.0.1) | Fix for [#136](https://github.com/rtfeldman/elm-css/issues/136)
| [**4.0.0**](https://github.com/rtfeldman/elm-css/tree/4.0.0) | Fix multiple pseudo-selectors, add cursor properties.
| [**3.1.2**](https://github.com/rtfeldman/elm-css/tree/3.1.2) | Fix extraneous space in pseudo-element output
| [**3.1.1**](https://github.com/rtfeldman/elm-css/tree/3.1.1) | Fix missing pseudo-element implementation
| [**3.1.0**](https://github.com/rtfeldman/elm-css/tree/3.1.0) | Fix bug where namespace was getting applied to ID selectors, add letterSpacing, h5, h6
| [**3.0.0**](https://github.com/rtfeldman/elm-css/tree/3.0.0) | Upgrade for Elm 0.17
| [**2.2.0**](https://github.com/rtfeldman/elm-css/tree/2.2.0) | Expose more types
| [**1.1.0**](https://github.com/rtfeldman/elm-css/tree/1.1.0) | Add Helpers
| [**1.0.0**](https://github.com/rtfeldman/elm-css/tree/1.0.0) | Initial Release
