# elm-stylesheets

Isn't it a pain when you want to rename a CSS class or ID, but can't be sure that the rename wouldn't break things?  
Or when it turns out the reason something wasn't displaying as expected was that you had a typo in the class name?

Wouldn't it be sweet if those problems went away?

This is a proof of concept for a CSS preprocessor written in Elm, which outputs `.css` stylesheets while letting you:

1. Share code between your render logic and your CSS stylesheets, so you can easily keep names synchronized
2. Use union types instead of strings for class names and IDs, so typos will result in compile errors instead of bugs
3. Assemble your stylesheets by writing normal Elm code, so you have access to your full suite of programming logic tools instead of the limited set that typical preprocessors ship with.

Here's a sketch of the current proof of concept. It's far from complete, but if you try to do something that would result in invalid CSS, it will probably give you a compiler error instead of silently generating broken CSS.

![screen shot 2015-09-20 at 11 59 14 am](https://cloud.githubusercontent.com/assets/1094080/10029275/9e561f72-6136-11e5-8fa9-7f2d47f604aa.png)
