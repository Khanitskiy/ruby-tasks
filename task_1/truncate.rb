module Truncate

  def truncate(*args, length: 120)
    args.each do |thing|
      define_method "#{thing}" do
        variable = self.instance_variable_get("@#{thing}")
        variable.length > length ? variable[0, length].delete("\n") << '...' : variable
      end
    end
  end
end
