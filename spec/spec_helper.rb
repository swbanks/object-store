$LOAD_PATH.unshift(File.expand_path("./app")) unless $LOAD_PATH.include?(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("./app/services")) unless $LOAD_PATH.include?(File.expand_path("./app/services"))

require "chore_scheduler_service"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
