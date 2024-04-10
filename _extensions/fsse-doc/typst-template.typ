#import "@preview/chic-hdr:0.4.0": *

#let document(
  title: none,
  subtitle: none,
  sign: none,
  margin: (left: 2.5cm, right: 2.5cm),
  paper: "a4",
  lang: "fr",
  region: "CH",
  font: "Gilroy",
  fontsize: 10pt,
  logo: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1/1"
  )
  set par(justify: true)
  show par: set block(spacing: 1.5em)
  // show math.equation: set text(weight: 100, font: mathfont)
  // show raw: set text(font: codefont)
  show strong: set text(weight: 300)
  show heading: set text(fill: rgb("#00283c"), weight: 600)
  set text(lang: lang,
           weight: "light",
           region: region,
           font: font,
           size: fontsize)
  
  show: chic.with(
    chic-header(
      left-side: locate(
        loc => if [#loc.page()] == [1] {[
        #block(width: 12cm,
          [#set text(fill: rgb("#00283c"), size: 8pt)
           *SWISS EQUESTRIAN*\
           #set text(fill: black)
           Postfach 726, Papiermühlestrasse 40H, CH-3000 Bern 22\
           #link("tel:0041313354343", "+41 (0)31 335 43 43"), #link("mailto:info@swiss-equestrian.ch", "info@swiss-equestrian.ch"), #link("https://www.swiss-equestrian.ch", "swiss-equestrian.ch")
          ])
        #v(2cm)
      ]}),
      right-side: locate(
        loc => if [#loc.page()] == [1] {[
        #place(
          top + right,
          dx: 1cm,
          image(width: 2.5cm, logo)
        )
      ]})
    ),
    chic-offset(on: "header", -3cm),
    chic-height(on: "header", 2cm),
    chic-height(on: "footer", 1.5cm)
  )
  
  v(2cm)
  
  if(title != none) {
    set text(fill: rgb("#00283c"), 24pt)
    set par(leading: .3em)
    align(center, {
      block(width: 12cm, {
        strong(smallcaps(title))
        if(subtitle != none) {
          set text(fontsize + 2pt)
          linebreak()
          v(-1cm)
          strong(smallcaps(subtitle))
        }
      })
    })
  }
  
  doc
}
