module Spree
  Product.class_eval do
    include ActsAsTaggable
  end
end
