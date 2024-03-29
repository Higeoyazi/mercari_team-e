class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def field_for(method, options = {})
    super + error(method)
  end

  def text_field(method, options = {})
    super + error(method)
  end

  def email_field(method, options = {})
    super + error(method)
  end

  def password_field(method, options = {})
    super + error(method)
  end

  def number_field(method, options = {})
    super + error(method)
  end

  def text_area(method, options = {})
    super + error(method)
  end

  def select(method, choices= nil, options = {}, html_options = {}, &block)
    super + error(method)
  end

  def file_field(method, options = {})
    super + error(method)
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    super + error(method)
  end

  private

  def error(method)
    error_html(error_message(method))
  end

  #全部出したい時には最後をallにすれば良い
  def error_message(method)
    (@object.errors[method].size > 0) ? I18n.t("activerecord.attributes.#{@object.model_name.singular}.#{method}") + @object.errors[method].first: ""
  end

  #エラーメッセがなければ空を返す
  def error_html(msg)
    return "" unless msg.present?

    @template.content_tag(:div, class: "has-error") do
      @template.concat(@template.content_tag(:span, class: "help-block") do
        msg
      end)
    end
  end

end