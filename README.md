Convert lambda expressions to CCC combinators and then to circuits.

See instructions in test/Tests.hs.

Dependencies:

*   The [circat](https://github.com/conal/circat) library for circuit specification, display, and conversion to netlists.

To try out:

*   `cabal install` circat and lambda-ccc (in that order)
*   In lambda-ccc/test, follow the directions in the module comment (near the top) in Simple.hs.

If all works, you'll see something like the following output:

    hermit Simple.hs -v0 -opt=LambdaCCC.Reify +Simple Auto.hss resume && ghc -O2 --make SimpleMain.hs && ./SimpleMain
    [starting HERMIT v0.4.0.0 on Simple.hs]
    % ghc Simple.hs -fforce-recomp -O2 -dcore-lint -fsimple-list-literals -fexpose-all-unfoldings -fplugin=LambdaCCC.Reify -fplugin-opt=LambdaCCC.Reify:-v0 -fplugin-opt=LambdaCCC.Reify:Simple: -fplugin-opt=LambdaCCC.Reify:Simple:Auto.hss -fplugin-opt=LambdaCCC.Reify:Simple:resume -v0
    Linking SimpleMain ...
    \ (a,b) -> let h = \ f -> f a b in (h (&&),h xor)
    (apply . (exr &&& curry ((&&) . exr)) &&& apply . (exr &&& curry (xor . exr))) . (id &&& curry (apply . (apply . (exr &&& exl . exr . exl) &&& exr . exr . exl))) . (it &&& id)

The output lines (after "Linking SimpleMain ...") are

*   A lambda expression corresponding to the body of a reified Haskell definition from Simple.hs, and
*   A CCC expression constructed by converting that lambda expression.

Additionally, you'll get a PDF with a picture of the program/circuit in out/test.pdf (also displayed in a PDF viewer) and Verilog code in out/test.v.
