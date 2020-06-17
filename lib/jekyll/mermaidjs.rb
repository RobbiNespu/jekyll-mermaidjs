require "jekyll/mermaidjs/version"

module Jekyll
  module Mermaidjs
    class Error < StandardError; end
    # Your code goes here...
    class MermaidChart < Liquid::Block
            
            def initialize(tag_name, markup, tokens)
                super
            end

            def render(context)
                @config = context.registers[:site].config['mermaid']
                "<script src=\"#{@config['src']}\"></script>"\
                "<script>mermaid.initialize({startOnLoad:true});</script>"\
                "<div class=\"mermaid\">#{super}</div>"
        end
  end
end

Liquid::Template.register_tag('mermaid', Jekyll::Mermaidjs:MermaidChart)