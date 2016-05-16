module Docs
  class Phobos < UrlScraper
    self.name = 'Phobos'
    self.type = 'phobos'
    self.base_url = 'http://dlang.org/phobos/'
    self.root_path = 'index.html'

    options[:container] = '#content'

    html_filters.push 'phobos/clean_html', 'phobos/entries'

    options[:attribution] = <<-HTML
      Boost Software License Version 1.0<br>
      Copyright &copy; 1999-2016 by Digital Mars &reg;, All Rights Reserved
    HTML
  end
end
