local stringify = pandoc.utils.stringify

local function normalize(text)
  return text:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

function Table(tbl)
  return pandoc.walk_block(tbl, {
    Header = function(header)
      if #header.content == 0 then
        return pandoc.Plain({})
      end

      return pandoc.Plain({ pandoc.Strong(header.content) })
    end,
    BlockQuote = function(quote)
      return quote.content
    end
  })
end

function Str(el)
  if el.text == "🙢🙠" then
    return pandoc.RawInline("latex", "\\(\\diamond\\diamond\\)")
  end

  if el.text == "⋄" then
    return pandoc.RawInline("latex", "\\(\\diamond\\)")
  end

  return el
end

function Pandoc(doc)
  local blocks = {}
  local skipping_original_toc = false

  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" then
      local title = normalize(stringify(block.content))

      if title == "MỤC LỤC" then
        skipping_original_toc = true
      elseif skipping_original_toc and title:match("^DANH MỤC CÁC BẢNG") then
        skipping_original_toc = false
      end

      if title == "" then
        goto continue
      end
    end

    if not skipping_original_toc then
      table.insert(blocks, block)
    end

    ::continue::
  end

  doc.blocks = blocks
  return doc
end
