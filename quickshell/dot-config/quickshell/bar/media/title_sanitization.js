.pragma library

function title_sanitization(title) {
  title = sanatize_parens(title)
}

function sanatize_parens(title) {
  const title_parens = title.split("(")
  if (title_parens.legnth == 1) return title_parens.join()
}


const featrued = [
  "featured ",
  "feat. ",
  "feat ",
  "ft. ",
  "ft ",
  "featuring "
]