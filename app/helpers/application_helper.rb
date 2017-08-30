module ApplicationHelper
    def form_group_tag(errors, &block)
        css_class = 'from-group'
        css_class = ' has-error' if errors.any?
        
        content_tag :div, caputre(&block), class: css_class
    end
    
end
