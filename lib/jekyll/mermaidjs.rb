require "jekyll/mermaidjs/version"

module Jekyll
  module Mermaidjs
    class Error < StandardError; end
    # Your code goes here...
    class MermaidChart < Liquid::Tag
            
            def initialize(tag_name, markup, tokens)
                super
                @text = text.strip
            end

            def render(context)
                @config = context.registers[:site].config['mermaid']
                "<script src=\"#{@config['src']}\"></script>"\
                "<script>mermaid.initialize({startOnLoad:true});</script>"\
                "<pre><div class=\"mermaid\" markdown=\"0\">#{super}</div></pre>"
        end
  end
end

Liquid::Template.register_tag('mermaid', Jekyll::Mermaidjs:MermaidChart)