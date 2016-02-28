class XmlDocument
  
  def initialize(indent = false)
    @indent = indent
    @indent_times = 0
  end
  
  def method_missing(method_name, *args, &blk)
    method_name = method_name.to_s
    taggify(method_name, args, &blk)
  end
  
  def taggify(method_name, args, &blk)
    code = ""
    if block_given?
      code << "#{indentation}<#{method_name}#{attributes(args)}>#{line_breaks}"
      @indent_times += 1
      code << blk.call
      @indent_times -= 1
      code << "#{indentation}</#{method_name}>#{line_breaks}"
    else
      code << "#{indentation}<#{method_name}#{attributes(args)}/>#{line_breaks}"
    end
    code
  end
  
  def attributes(args)
    args[0].nil? ? "" : args[0].map {|name, value| " #{name}=\'#{value}\'"}.join(" ")
  end
  
  def indentation
    @indent ? "  " * @indent_times : ""
  end

  def line_breaks
    @indent ? "\n" : ""
  end
  
end
