module Docs
  class Phobos
    class CleanHtmlFilter < Filter
      def call
        # Move header tags up
        css('h2', 'h3', 'h4').each do |node|
          child = node.at_css('a') or node.at_css('span')
          if child then
            node['id'] = child['id']
            node.content = child.inner_text
          end
        end

        # Clean up code blocks
        css('pre.d_code').each do |node|
          node['class'] = 'language-d'
          node.inner_html = node.content.gsub(/\r\n/, '&#13;');
        end
        css('pre.bnf', 'pre.console').each do |node|
          node['class'] = 'language-other'
          node.inner_html = node.inner_html.gsub(/\r\n/, '&#13;');
        end

        # Clean up inline code
        css('span.d_inlinecode').each do |node|
          node['class'] = 'language-d'
          node.name = 'code'
        end

        # Add anchors to all declarations directly
        # The empty <a> tags will be removed by the CleanHtmlFilter anyway
        css('.d_decl').each do |node|
          anchor = node.at_css('a')
          symbol = anchor['name']
          node['id'] = symbol
          psymbol = node.at_css('ddoc_psymbol')
          psymbol['id'] = symbol[1..-1] if psymbol
        end

        # Remove 'Report Bug' and 'Improve this page'
        at_css('#tools').remove
        # Remove Copyright notice (will be added later on)
        at_css('#copyright').remove

        doc
      end
    end
  end
end
