module Formattable
  def indent(spaces, code)
    code.split("\n").map { |line| " " * spaces + line }.join("\n")
  end
end
