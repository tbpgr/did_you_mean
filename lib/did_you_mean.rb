require "interception"
require "did_you_mean/version"
require "did_you_mean/word_collection"
require "did_you_mean/core_ext/name_error"

module DidYouMean
  Interception.listen(->(exception, binding) {
    if exception.is_a?(NameError)
      exception.instance_variable_set(:@frame_binding, binding)
    end
  })

  def mri?
    defined?(RUBY_ENGINE) && RUBY_ENGINE == "ruby"
  end
  module_function :mri?

  require "did_you_mean/method_missing" if mri?
  require "did_you_mean/strategies"
end
