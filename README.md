notes
=====

notes

## LaTeX font setup on macOS

The multilingual LaTeX package defaults to Noto fonts:

- `Noto Serif`, `Noto Sans`, and `Noto Sans Mono`
- `Noto Serif CJK SC/TC/HK/JP/KR`
- `Noto Sans CJK SC/TC/HK/JP/KR`
- `Noto Sans Mono CJK SC/TC/HK/JP/KR`

Install the expected fonts on macOS with:

```sh
make macos-fonts
```

The CJK Homebrew casks install the Noto Super OTC files:

- `font-noto-sans-cjk` installs `NotoSansCJK.ttc`
- `font-noto-serif-cjk` installs `NotoSerifCJK.ttc`

These collections provide all five CJK language variants and all seven weights.
The Sans collection also includes the Regular and Bold half-width mono variants,
so separate regional `font-noto-sans-mono-cjk-*` casks are not needed for this
project.

Then open a new terminal and build:

```sh
make lang
```

If the Noto fonts are missing, `multilang-fonts.sty` falls back to Latin Modern
for Western text. On some macOS/Homebrew TeX setups, `brew install --cask
font-latin-modern` installs files whose internal family names are `LMRoman10`
and `LMSans10`, not `Latin Modern Roman` and `Latin Modern Sans`. In that case
XeLaTeX can still report:

```text
Package fontspec Error: The font "Latin Modern Roman" cannot be found
```

That error is best avoided by installing the Noto fonts above, so the fallback is
not used.

To check whether a font name is visible to XeLaTeX, use `\typeout` rather than
only checking the process exit code:

```sh
xelatex -interaction=nonstopmode -halt-on-error '\documentclass{article}\usepackage{fontspec}\begin{document}\IfFontExistsTF{Noto Serif}{\typeout{FOUND}}{\typeout{MISSING}}\end{document}'
```

The document can compile successfully even when `\IfFontExistsTF` takes the
missing-font branch, so look for `FOUND` or `MISSING` in the output.
