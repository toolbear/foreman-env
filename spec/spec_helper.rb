require "rspec"
require "fakefs/safe"
require "fakefs/spec_helpers"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true
  config.order = 'rand'
  config.include FakeFS::SpecHelpers, :fakefs
end
