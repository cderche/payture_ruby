class Payture::Parser

  # klass = nil
  # def init(className)
  #   klass = Object.const_get className
  # end

  def parse(data)
    data.each do |k,v|
      puts "#{k}: #{v}"
    end
  end

end
