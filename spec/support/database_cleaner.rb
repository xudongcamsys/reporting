RSpec.configure do |config|

  DatabaseCleaner.strategy = :truncation, {:only => %w[assets]}
  config.before(:suite) do
    begin
      DatabaseCleaner.start
    ensure
      DatabaseCleaner.clean
    end
  end
end