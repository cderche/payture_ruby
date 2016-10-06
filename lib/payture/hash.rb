require 'active_support/all'

class Hash
  def downcase_key
    keys.each do |k|
      v = self[k]
      v = v.is_a?(Hash) ? v.downcase_key : v
      store(k.downcase.to_sym, Array === (v = delete(k)) ? v.map(&:downcase_key) : v)
    end
    self
  end

  def url_encode
    URI.encode(self.map{|k,v| "#{k}=#{v}"}.join(";"))
  end

end
