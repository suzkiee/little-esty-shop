require 'simplecov'
SimpleCov.start

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  # config.before(:each)
  #   mock_response = '{
  #     login: "BrianZanti",
  #     id: 8962411,
  #     node_id: "MDQ6VXNlcjg5NjI0MTE=",
  #     avatar_url: "https://avatars.githubusercontent.com/u/8962411?v=4",
  #     gravatar_id: "",
  #     url: "https://api.github.com/users/BrianZanti",
  #     html_url: "https://github.com/BrianZanti",
  #     followers_url: "https://api.github.com/users/BrianZanti/followers",
  #     following_url: "https://api.github.com/users/BrianZanti/following{/other_user}",
  #     gists_url: "https://api.github.com/users/BrianZanti/gists{/gist_id}",
  #     starred_url: "https://api.github.com/users/BrianZanti/starred{/owner}{/repo}",
  #     subscriptions_url: "https://api.github.com/users/BrianZanti/subscriptions",
  #     organizations_url: "https://api.github.com/users/BrianZanti/orgs",
  #     repos_url: "https://api.github.com/users/BrianZanti/repos",
  #     events_url: "https://api.github.com/users/BrianZanti/events{/privacy}",
  #     received_events_url: "https://api.github.com/users/BrianZanti/received_events",
  #     type: "User",
  #     site_admin: false,
  #     name: "Brian Zanti",
  #     company: nil,
  #     blog: "",
  #     location: nil,
  #     email: nil,
  #     hireable: nil,
  #     bio: nil,
  #     twitter_username: nil,
  #     public_repos: 70,
  #     public_gists: 31,
  #     followers: 31,
  #     following: 30,
  #     created_at: "2014-09-29T18:05:53Z",
  #     updated_at: "2021-06-01T15:07:20Z"
  #   }'
  #   # allow(GithubService).to receive(:user_info).and_return(mock_response)
  #   class_double(Faraday::Response).to receive(:body).and_return(mock_response)
  # end


  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
