function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

using BibTeX

function ref_item(ref, infos)
  io = IOBuffer()

  author = infos["author"]
  author_last, author_first = strip.(split(author, ","))

  write(io, "<li id=\"#$ref\">")
  write(io, """$author_first $author_last, <span style="font-style:italic;">$(infos["title"])</span>, $(infos["date"]).""")
  write(io, "</li>")
  return String(take!(io))
end
