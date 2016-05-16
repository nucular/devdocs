module Docs
  class D
    class CleanHtmlFilter < Filter
      def call
        # Move header tags up
        css('h2', 'h3', 'h4').each do |node|
          a = node.at_css('a')
          if a then
            node['id'] = a['id']
            node.content = a.inner_text
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

        # Remove 'Report Bug' and 'Improve this page'
        at_css('#tools').remove
        # Remove Copyright notice (will be added later on)
        at_css('#copyright').remove

        doc
      end
    end
  end
end
