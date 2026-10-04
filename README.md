# Basic Lisp Techniques

A short book introducing Common Lisp to working programmers, by David
Cooper, with a foreword by Franz Inc.  Franz has distributed it as a
free PDF since 2003
([the 2003 edition](https://franz.com/resources/educational_resources/cooper.book.pdf)),
and it has served many programmers as a quick start in the language.

The original LaTeX source was lost.  The files in this repository were
reconstructed from the book in December 2025.  `main.tex` carries a
2011 date.

## What is in it

1. Introduction: the past, present and future of Common Lisp, and its
   model of computation
2. Operating a CL development environment: installing one, running CL
   in a shell, in Emacs and in an IDE, the init file, scripting,
   debugging
3. The CL language: syntax, lists, control of execution, functions as
   objects, streams and strings, hash tables, arrays, structures and
   classes, packages, common stumbling blocks
4. Interfaces: the operating system, foreign functions, sockets,
   databases, web serving, embedded languages
5. The Squeakymail example: a small web-based mail application, built
   step by step

Appendices: a note on the GDL/GWL version of the tutorial, a
bibliography, and Emacs customization (key bindings, `.emacs`,
MELPA, SLIME, themes); then an afterword.

## Building the PDF

You need `pdflatex` and `makeindex` from a TeX Live installation with
the standard LaTeX packages (on Debian or Ubuntu,
`texlive-latex-recommended`).  Then:

    make            # main.pdf, with the index (three LaTeX passes)
    make pdf        # one quick pass, no index
    make clean      # remove the LaTeX by-products, keep the PDF
    make help       # the other targets

`add-index-tags.sh` (`make tag-for-index`) adds `\index{}` entries to
the chapter sources by script, rewriting them in place.  It is under
review; please do not run it as part of a contribution.

## Contributing

Corrections, updates and improvements are welcome as pull requests;
see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Copyright © 2003, 2011 Franz Inc. and David Cooper.

The text of this book is licensed under the Creative Commons
Attribution-ShareAlike 4.0 International License
([CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)); the
full legal code is in [LICENSE](LICENSE).
