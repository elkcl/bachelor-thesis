// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!

#let footnotesize(it) = {
  set text(size: 10pt)
  it
}

#let large(it) = {
  set text(size: 14.4pt)
  it
}
#let Large(it) = {
  set text(size: 17.28pt)
  it
}
#let LARGE(it) = {
  set text(size: 20.74pt)
  it
}

#let nbsp = sym.space.nobreak

#let project(
  title: "",
  title_int: "",
  abstract: [],
  abstract_int: [],
  author: "",
  author_int: "",
  date: none,
  logo: none,
  group: none,
  university: [],
  faculty: [],
  chair: [],
  docname: [],
  advisor_text: [],
  advisor_degree: [],
  advisor: [],
  consultant_text: [],
  consultant_degree: [],
  consultant: [],
  city: [],
  body,
) = {
  // Set the document's basic properties.
  set document(author: author, title: title)
  set page(
    numbering: (..nums) => {
      if nums.pos().at(0) != 1 {
        numbering("1", nums.pos().at(0))
      }
    },
    number-align: center,
    margin: (left: 3cm, top: 2cm, right: 1.5cm, bottom: 2cm),
  )
  set text(font: "New Computer Modern", lang: "ru", region: "ru", size: 12pt)
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")


  // show raw: set text(font: "New Computer Modern Mono")

  show heading: set block(above: 1.4em, below: 1em)

  align(center)[
    #image("msu.png", height: 40mm)
    //#set par(spacing: 0.55em)
    #large(university) \
    #faculty \
    #footnotesize(chair)
  ]
  v(1fr)
  align(horizon + center)[
    // #set par(spacing: 1.2em)
    // #set par(leading: 1em)

    #Large[
      #author
    ]

    // #large[
    //   Group #group
    // ]


    #Large[
      *#title*
    ]

    #large[
      #smallcaps(docname)
    ]
  ]
  v(1fr)
  place(right)[
    *#advisor_text:* \
    #advisor_degree #advisor\
    _#(consultant_text):_\
    #consultant_degree #consultant
  ]
  v(1fr)

  align(center)[
    #large[
      #city, #date.display("[year]")
    ]
  ]
  pagebreak()
  v(0.375in)
  align(top)[
    #align(center)[
      *Аннотация*

      #large(title)

      _#(author)_
    ]
    #set par(justify: true)
    #abstract
  ]
  align(bottom)[
    #align(center)[
      *Abstract*

      #large(title_int)

      _#(author_int)_
    ]
    #set par(justify: true)
    #set text(lang: "en")
    #abstract_int
  ]
  pagebreak()
  // Table of contents.
  show outline.entry.where(
    level: 1,
  ): it => {
    v(20pt, weak: true)
    strong(it)
  }
  outline(depth: 5, indent: auto)
  pagebreak()


  // Main body.
  set text(size: 12pt)
  set par(
    justify: true,
    leading: 1em,
    first-line-indent: (amount: 1.8em, all: true),
  )
  set par(spacing: 1em)
  // show heading: it =>  {
  //   it
  //   par()[#text(size:0.5em)[#h(0.0em)]]
  // }
  // set footnote(numbering: "*")
  // set page(header: counter(footnote).update(0))
  // set enum(indent: 1em)

  body

  pagebreak()
  bibliography("sources.yml", title: "Список литературы", style: "gost-r-705-2008-numeric")
}
