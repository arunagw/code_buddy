require 'coderay'
require 'json'
require 'json/add/rails'

require 'rack'
require 'code_buddy/app'
require 'code_buddy/stack'
require 'code_buddy/stack_frame'
require 'code_buddy/middleware'
require 'code_buddy/version'

module CodeBuddy
end

begin
  if Rails.env.development? || Rails.env.test?
    case Rails::VERSION::MAJOR
    when 2:
      require 'code_buddy/rails2/monkey_patch_action_controller'
    when 3:
      require 'code_buddy/rails3/railtie.rb'
    end
  end
rescue NameError
  nil
end