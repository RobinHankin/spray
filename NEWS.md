# spray 1.0-16

- add a sticker
- consistently use coeffs(); return a `disord` object
- constant() now generic
- cross products implemented as `spraycross()`


# spray 1.0-17

- sprayvars option now also governs atrix-form printing
- drop() function added, following the clifford package


# spray 1.0-18

- bug in coeffs(x) <- v fixed
- <spray> == <numeric> implemented, also !=
- new generic as.id()

# spray 1.0-19

- bugfix so `getOption("max.print")` is respected
- coeffs(S) returns drop()-ped values