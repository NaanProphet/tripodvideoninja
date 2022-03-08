# A plugin for removing headers from post contents so that
# a better post excerpt can be extracted. This plugin expects
# HTML.
#
# Features:
# - strips "h" header content <h1>, <h2>, <h3>, etc.
# - strips superscripts created for footnotes <sup> tags
# - short circuits after the first paragraph of content is parsed
module Jekyll
  module ScrapeExcerptFilter
    def scrape_excerpt(text)
      output = ''
      text.each_line do |line|
        if line.start_with?('<h')
        elsif line.start_with?('<p>') && output.length > 1
          # shortcircuit
          return output
        else
          # remove superscript footnote tags
          output += line.gsub(/<sup.+?<\/sup>/, "")
        end
      end
      return output
    end
  end
end

Liquid::Template.register_filter(Jekyll::ScrapeExcerptFilter)