# Deprecated functionality will be here until removed in a major release

# Optimisation test functions

"""
    circle(x)

!!! warning "Deprecated from EvoLP 1.3"
    This test function will be **deprecated** in a future major release.

The **circle** function is a multiobjective test function, given by

```math
f(x) = \\begin{bmatrix}
        1 - r\\cos(\\theta) \\\\
        1 - r\\sin(\\theta)
        \\end{bmatrix}
```

where ``\\theta=x_1`` and ``r`` is obtained by

```math
r = \\frac{1}{2} + \\frac{1}{2} \\left(\\frac{2x_2}{1+x_2^2}\\right)
```
"""
@inline @fastmath function circle(x)
    Base.deepwarn(
        "The `circle` function will be removed from EvoLP in a future release." *
        "It may be added back when multiobjective support is added."
    )
    θ = first(x)
    r = 0.5 + 0.5 * (2 * x[2] / (1 + x[2]^2))
    y1 = 1 - r * cos(θ)
    y2 = 1 - r * sin(θ)

    return [y1, y2]
end

"""
    flower(x; a=1, b=1, c=4)

!!! warning "Deprecated from EvoLP 1.3"
    This function will be **deprecated** in a future major release.

The **flower** function is a two-dimensional test function with flower-like contour lines
coming out from the origin. Typically, optional parameters are set at ``a=1``, ``b=1`` and
``c=4``. The function is minimised near the origin, although it does not have a global
minimum due to `atan` bein undefined at ``[0, 0]``.

```math
f(x) = a\\lVert\\mathbb{x}\\rVert + b \\sin(c\\arctan(x_2, x_1))
```
"""
@inline function flower(x; a=1, b=1, c=4)
    Base.deepwarn("The `flower` function will be removed from EvoLP in a future release.")
    return @fastmath a * norm(x) + b * sin(c * atan(x[2], x[1]))
end
