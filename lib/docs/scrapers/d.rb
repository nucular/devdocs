module Docs
  class D < UrlScraper
    self.name = 'D'
    self.type = 'd'
    self.base_url = 'http://dlang.org/spec/'
    self.root_path = 'spec.html'

    options[:container] = '#content'

    html_filters.push 'd/clean_html', 'd/entries'

    options[:attribution] = <<-HTML
      Copyright &copy; 1999-2016 by Digital Mars &reg;, All Rights Reserved
    HTML
  end
end
