module ApplicationHelper
  def link_to_purchase_book(title)
    link_to title, 'http://www.google.com/' + title
  end

  def new_book_template f, association
    new_object = f.object.class.reflect_on_association(association).klass.new

    singular = association.to_s.singularize
    content_tag(:div, :id => "new_#{singular}_template", :style => "display:none") do
      f.fields_for(association, new_object, :child_index => "new_#{singular}") do |b|
        render(singular + "_fields", :f => b)
      end
    end
  end
end
