require_relative 'null_finder_test'
require_relative 'similar_name_finder_test'

if DidYouMean.mri?
  require_relative 'similar_method_finder_test'
  require_relative 'no_method_error_extension_test'
end

if defined?(ActiveRecord)
  require_relative 'similar_attribute_finder_test'
end

require_relative 'similar_class_finder_test'
