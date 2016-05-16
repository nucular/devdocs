module Docs
  class D
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        type
      end

      def get_type
        at_css('h1').inner_text
      end

      def additional_entries
        css('.header').map do |node|
          [node.inner_text, node['id']]
        end
      end
    end
  end
end
