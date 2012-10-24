$ ->
  window.slug = (string, replacement = '-') ->
      result = ""
      for char in string
          char = char.replace(/[^\w\s$\*\_\+~\.\(\)\'\"\!\-:@]/g, '') # allowed
          result += char
      result = result.replace(/^\s+|\s+$/g, '') # trim leading/trailing spaces
      result = result.replace(/[-\s]+/g, replacement) # convert spaces
      result.replace("#{replacement}$", '') # remove trailing separator

