module Docs
  class Phobos
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        at_css('h1').inner_text
      end

      def get_type
        name
      end

      def additional_entries
        css('.d_decl').map do |node|
          symbol = node['id']
          [name + symbol, symbol, type] if symbol
        end
      end
    end
  end
end
