module Girbot
  class StringGenerator
    attr_accessor :items

    def initialize
      @items = ('!'..'~').to_a
    end

    def items= items
      @items = items
    end

    def repeated_permutation min_length=nil, max_length=nil
      items = []
      min_length = 1 if min_length.nil?
      max_length = @items.size if max_length.nil?
      raise 'min is greater than max' if min_length > max_length

      (min_length..max_length).each do |range|
        items.concat repeated_permutation_with_length(range)
      end

      items
    end

    def repeated_permutation_with_length length
      stringify @items.repeated_permutation(length).to_a
    end

    def stringify array
      array.map { |e| e.join('') }.uniq.reject { |c| c.empty? }
    end
  end
end
