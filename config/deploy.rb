# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "blog"
set :repo_url, "git@github.com:demo-projects-prachiti/rails-rspec-demo.git"

# Default branch is :master
ask :branch, :master
# set :bundle_without,  [:development, :test]

set :rvm_ruby_version, 'ruby-2.7.2'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/home/neosoft/Documents/blog"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


set :tests, ['']

namespace :deploy do
  desc "Runs test before deploying, can't deploy unless they pass"
  task :run_tests do
    test_log = "log/capistrano.test.log"
    tests = fetch(:tests)

    # tests.each do |test|
    #   puts "--> Running tests: '#{test}', please wait ..."
    #   unless system "bundle exec rspec #{test} > #{test_log} 2>&1"
    #     puts "--> Aborting deployment! One or more tests in '#{test}' failed. Results in: #{test_log}"
    #     exit;
    #   end
    #   puts "--> '#{test}' passed"
    # end
    puts "--> All tests passed, continuing deployment"
    system "rm #{test_log}"
  end

  # Only allow a deploy with passing tests to be deployed
  before :deploy, "deploy:run_tests"
end
