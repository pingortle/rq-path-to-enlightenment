class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  def code_input(method, options = {})
    tag.code_input(name: "#{object_name}[#{method}]", value: object.send(method), **options)
  end
end
