module Docs
  class D
    class EntriesFilter < Docs::EntriesFilter
      # Pages that are named differently on the index than in their header
      FIXED_NAMES = {
        "grammar" => "Grammar", # D Grammar
        "struct" => "Structs and Unions", # Structs, Unions
        "errors" => "Error Handling", # Errors
        "iasm" => "D x86 Inline Assembler", # Inline Assembler
        "ddoc" => "Embedded Documentation", # Documentation Generator
        "portability" => "Portability Guide", # Portability
        "memory-safe-d" => "Memory Safety" # Memory-Safe-D-Spec
      }

      def get_name
        FIXED_NAMES[slug] or at_css('h1').inner_text
      end

      def get_type
        name
      end

      def additional_entries
        css('h2', 'h3', 'h4').reject do |node|
          node['id'] == nil
        end .map do |node|
          [node.inner_text, node['id'], type]
        end
      end
    end
  end
end
