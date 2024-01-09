#import "template.typ": *
#show: ieee_conference.with(
  title: "IEEE with Typst",
  header: "JOURNAL OF TYPST CLASS FILES, VOL. 18, NO. 9, SEPTEMBER 2020",
  footer: "979-8-3503-2934-6/23/\$31.00 ©2023 IEEE",
  abstract: [
    This document describes the most common article elements and how to use the TYPST to produce files that are suitable for submission to the Institute of Electrical and Electronics Engineers (IEEE).
  ],
  authors: (
    (
      name: "Bob BOB",
      department: [President],
      organization: [Bob Labs],
      location: [Paris, France],
      email: "bob.bob@bob-labs.org"
    ),
    (
      name: "Bob BOB",
      department: [Vice president],
      organization: [Bob Labs],
      location: [Paris, France],
      email: "bob.bob@bob-labs.org"
    ),
    (
      name: "Bob BOB",
      department: [Teck],
      organization: [Bob Labs],
      location: [Paris, France],
      email: "bob.bob@bob-labs.org"
    ),
  ),
  index-terms: ("Class", "IEEE", "TYPST", "paper", "style", "template", "typsetting"),
  bibliography-file: "refs.bib",
)
#set par(first-line-indent: 0pt)


= Introduction
#dropcap("WELCOME to the Typst IEEE template. This template aims to provide the basis to create IEEE papers. Documentation and tutorials are available on the official Typst website: https://typst.app.")

= Why Typst ?
#set list(marker: [])
- Typst is fast #emoji.rocket
- Typst is open sourced #emoji.book.open
- Typst is easy #emoji.checkmark.box

More seriously:
#set list(marker: [-])
- Previews your changes instantly.
- Provides clear, understandable error messages.
- Has a consistent styling system for configuring everything from fonts and margins to the look of headings and lists.
- Uses familiar programming constructs instead of hard-to-understand macros.

= How to use Typst ? 
A web playground is disponible on the official website, but it is also possible to use your favourite text editor thanks to the Typst lsp. Plugins exist for VSCode: https://github.com/Enter-tainer/typst-preview or even Vim: https://github.com/kaarmu/typst.vim. 

= Where to get the Typst Templates
As always, the *Awesome GitHub Pages* are a good start. The Typst awesome page (https://github.com/qjcg/awesome-typst) already refers to articles about tools, integrations, templates, tutorials and much more!   

= Project Structure
A Typst project possess a main script, usually `main.typ`, ressources that can be managed inside folders, templates and a bibliography file. The structure may look as follows: 

`
ressources/
├─ png/
│  ├─ img1.png
main.typ
template.typ
refs.bib
`

#v(1em)
= Using the Template
The template is basically a function with arguments that has to be called at the start of the `main.typ` script. 

== Paper Title
The title of your paper is coded as:
`
title: "IEEE with Typst",
`

#v(1em)
== Author Names and Affiliations
The author section should be coded as follows:

`
authors: (
    (
      name: "Bob BOB",
      department: [President],
      organization: [Bob Labs],
      location: [Paris, France],
      email: "bob.bob@bob-labs.org"
    ),
    (
      name: "Bob BOB",
      department: [Vice president],
      organization: [Bob Labs],
      location: [Paris, France],
      email: "bob.bob@bob-labs.org"
    ),
    ...
)
`

#v(1em)
== Header and Footer 
The header is present on each page whereas the footer is only printed in the first page. 

`
header: "JOURNAL OF TYPST CLASS FILES, VOL. 18, NO. 9, SEPTEMBER 2020",
footer: "979-8-3503-2934-6/23/\$31.00 ©2023 IEEE",
`

#v(1em)
== Index terms and bibliography file
`
index-terms: ("Class", "IEEE", "TYPST", "paper", "style", "template", "typsetting"),
bibliography-file: "refs.bib",
`

#v(1em)
It might even be possible to add *keywords*:

`
keywords: [bananas, apples, oranges],
`

#v(1em)
== Abstracts
The coding is simply:

`
abstract: [
  This document describes the most common article elements and how to use the TYPST to produce files that are suitable for submission to the Institute of Electrical and Electronics Engineers (IEEE).
],
`

#v(1em)
== Initial Drop Cap Letter
The first text paragraph uses a "drop cap" followed by the first word in ALL CAPS. This template uses the module `droplet`. It is imported at the beginning of the `template.typ` script with `#import "@preview/droplet:0.2.0": dropcap` and used as follows in the introduction section of `main.typ`:

`
#dropcap("WELCOME to the Typst IEEE template. This template aims to provide the basis to create IEEE papers. Documentation and tutorials are available on the official Typst website: https://typst.app.")
`

#v(1em)
Height and gaps can be modified in the template file or directly in the main file by slightly adding arguments to the function. 

== Modify everything at will
An important thing to take into account is that the whole code of the template is written in the `template.typ` file, so changing things is as simple as modifying a line in this file. 

= Body

== Sections and Subsections
Section headings are not as complicated as their LaTeX's counterparts. It is simply created with "=":

`
= Section Head
The text of your paragraph . . .

== Subsection
=== Subsubsection
...
`
#v(1em)
== Citations to the Bibliography
Coding for bibliography is included in the standard librairie. The `refs.bib` can be configured as follows:

`
@article{example,
  title={Example},
  author={Example, Example and Example, Example},
  journal={Example Example Example Example},
  volume={1},
  pages={1--2},
  year=2020,
  publisher={Example Example Inc.}
}
`

#v(1em)
Then for a single citation code as follows:

`
see @bob
`
#v(1em)
This will display as: see @bob 

For multiple citations code as follows:

`
@bob1 @bob2 @bob3
`
#v(1em)
This will display as @bob @bob2 @bob3

== Figures
Figures are coded with the standard Typst command as follows:

`
#figure(
  image("ressources/png/fig1.png"),
  caption: [This is the caption for one fig.]
)<fig1>
`

#v(1em)
To cross-reference your figures in the text use the following code example:

`
See figure @fig1 ...
`

#v(1em)
This will produce: 

See figure @fig1 . . .

#figure(
  image("ressources/png/fig1.png"),
  caption: [This is the caption for one fig.]
)<fig1>


== Tables
Tables should be coded with the standard Typst coding. The following example shows a simple table.

`
#figure(
  table(
  columns: (auto, auto, auto),
  inset: 3pt,
  align: horizon,
  [Order of filter], [Arbitrary coefficients $e_m$], [coefficients $b_(i,j)$],
  [1],[$b_(i j)=hat(e). hat(beta_(i,j))$],[$b_(0 0)=0$],
  [2],[$beta_(2 2) = (1, -1, -1, 1, 1, 1)$],[],
  [3],[$b_(i j)=hat(e). hat(beta_(i j))$],[$b_(0 0)=0$],
  ),

  caption: [A simple table example],
)<tab1>
` 

#v(1em)
#figure(
  table(
  columns: (auto, auto, auto),
  inset: 3pt,
  align: horizon,
  [Order of filter], [Arbitrary coefficients $e_m$], [coefficients $b_(i,j)$],
  [1],[$b_(i j)=hat(e). hat(beta_(i,j))$],[$b_(0 0)=0$],
  [2],[$beta_(2 2) = (1, -1, -1, 1, 1, 1)$],[],
  [3],[$b_(i j)=hat(e). hat(beta_(i j))$],[$b_(0 0)=0$],
  ),

  caption: [A simple table example],
)<tab1> 

#v(1em)
== Lists
In this section, we will consider three types of lists: simple unnumbered, numbered and bulleted. The basic list is implemented with dashes "-", but it can be changed to anything with the command: `#set list(marker: [->])`.

#v(1em)
*A simple list*

- bananas
- apples
- camels

coded as:

`
- bananas
- apples
- camels
` \

*A simple numbered list*
+ bananas
+ apples
+ camels

coded as: 

`
+ bananas
+ apples
+ camels
` \

*A plain list*

#set list(marker:[])
- bananas
- apples
- camels

coded as:

`
#set list(marker:[])
- bananas
- apples
- camels
` \

= Mathematical Typstography
Simply _beautiful_...

$ sum_(n=12 \ n!=i)^N lim_(u v w&=12 \ n&!=i j k) lr(angle.l a abs(e^(integral g_(\[i)d x))f_(j\]) angle.r) $

is coded as:
`
$ sum_(n=12 \ n!=i)^N lim_(u v w&=12 \ n&!=i j k) lr(angle.l a abs(e^(integral g_(\[i)d x))f_(j\]) angle.r) $
` \

and it supports functions...

Create your function: `#let ket(X) = $lr(| #X angle.r)$`, and then use it!
#let ket(X) = $lr(| #X angle.r)$
#let bra(X) = $lr(angle.l #X |)$

`
$ H ket(0) = 1/sqrt(2) ket(+) + 1/sqrt(2) ket(-) $
` \ 
$ H ket(0) = 1/sqrt(2) ket(+) + 1/sqrt(2) ket(-) $


== Display Equations
There are two ways of using expression, either inline: $forall x in Gamma$ or as a display style:

$ 
Pi = sum_(k=1)^p ket(epsilon_k) bra(epsilon_k) "projects to" E = "vect"(epsilon_1, dots, epsilon_p)
$<super_projection>

is coded as follows:

`
$ 
Pi = sum_(k=1)^p ket(epsilon_k) bra(epsilon_k) "projects to" E = "vect"(epsilon_1, dots, epsilon_p)
$<super_projection>
`

#v(1em)
The difference lies in the spaces. If *both* "\$" are followed with at least one space, it will be displayed, otherwise it will stay inline. 

To reference this equation in the text use `@super_projection`

Please see (@super_projection)

is coded as follows:
 
`
Please see (@super_projection)
` \

== Equation Numbering
*Consecutive Numbering:* Equations within an article are numbered consecutively from the beginning of the
article to the end, i.e., (1), (2), (3), (4), (5), etc. 

#v(1em)
*Custom numbering:* This is possible with the `numbering` function. 

== Multi-line equations and alignment

$ a &= c+d $
$ b &= e+f $

is coded as:

`
$ a &= c+d $
$ b &= e+f $
` \

== Example of a custom numbering
#set math.equation(numbering: "(7a)")
#counter(math.equation).update(0)
$ f&=g $
$ f' &=g' $
$ cal(L)f &= cal(L)g $

is coded as:

`
#set math.equation(numbering: "(7a)")
#counter(math.equation).update(0)
$ f&=g $
$ f' &=g' $
$ cal(L)f &= cal(L)g $
` \

== Matrices
Matrices are created with the `mat` function. It can be used with multiple arguments, such as follows:

#set math.equation(numbering: "(1)")
#counter(math.equation).update(5)

#v(1em)
*A simple matrix*
$
mat(
  0, 1 ;
  1, 0 
)
$
is coded as:

`
mat(
  0, 1 ;
  1, 0 
)
` \

*A matrix with square brackets*
$
mat(
  delim: "[", 
  0 , -1 ;
  1 ,  0
)
$
is coded as:
`
mat(
  delim: "[", 
  0 , -1 ;
  1 ,  0
)
`
#v(1em)
*A matrix with curly braces*
$
mat(
  delim: "{", 
  1, 0 ;
  0, -1 
)
$
is coded as:
`
mat(
  delim: "{", 
  1, 0 ;
  0, -1 
)
` \

*A matrix with single verticals*
$
mat(
  delim: "|", 
  a, b ;
  c, d 
)
$
is coded as:
`
mat(
  delim: "|", 
  a, b ;
  c, d 
)
` \

*A matrix with double verticals*
$
mat(
  delim: "||", 
  i, 0 ;
  0, -i 
)
$
is coded as:
`
mat(
  delim: "||", 
  i, 0 ;
  0, -i 
)
` \

*A matrix with custom alignment*

The last column is aligned differently:
$
mat(
  a + b + c, u v, x - y, 27;
  a + b, u + v, z, 134&
)
$
is coded as:

`
mat(
  a + b + c, u v, x - y, 27;
  a + b, u + v, z, 134&
)
` \

*A matrix with vertical and horizontal rules*
$
mat(
  augment: #(
    hline: 1, 
    vline: (1, 2),
  ),
  a + b + c, u v, x - y, 27 ;
  a + b, u + v, z, 134
)
$
is coded as:

`
mat(
  augment: #(
    hline: 1, 
    vline: (1, 2),
  ),
  a + b + c, u v, x - y, 27 ;
  a + b, u + v, z, 134
)
` \

== Cases Structures
Cases are created using the `case` function. It is as simple as the creating a matrix:
#set math.equation(numbering: none)
$
z_m (t) = cases(
  1\, space "if" beta_m (t),
  0\, space "otherwise." 
)
$
is coded as follows:
`
z_m (t) = cases(
  1\, space "if" beta_m (t),
  0\, space "otherwise." 
)
`
#v(1em)
Make sure to escape characters such as "," when calling functions as "," are used to separate arguments. It may be possible to add "`space`" to ajust the spacing. 

#v(1em)
== Attachs
Attachs are made easy with the widly used "^" and "\_", but Typst add a simple command to reproduce the limits behaviour:

$
d^(K M)_R = limits(arg min)_(d^(K M)_l){d^(K M)_1, dots, d^(K M)_6}
$

is coded as follows:

`
d^(K M)_R = limits(arg min)_(d^(K M)_l){d^(K M)_1, dots, d^(K M)_6}
` \

==  Text Acronyms inside equations
Simple text can be added everywhere inside equations with double quotes:

$
 "MSE" = 1/n sum_(i=1)^n (Y_i - hat(Y_i))^2
$

is given by:

`
"MSE" = 1/n sum_(i=1)^n (Y_i - hat(Y_i))^2
`
#v(1em)
= A Final Checklist

+ Typst is cool.
+ Typst is fast.
+ Typst is Rust.
+ Make sure to reads the clear, comprehensible and nearly complete documentation at https://typst.app/docs/.
+ Enjoy typing!


