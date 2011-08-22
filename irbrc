ARGV << "--readline"

require 'pp'
require 'rubygems'

def try_require(lib, &block)
  begin
    require lib
    yield if block_given?
  rescue LoadError
    warn "#{lib} gem not available"
  end
end

try_require 'wirble' do
  Wirble.init
  Wirble.colorize
end

try_require 'hirb' do
  Hirb::View.enable
end

try_require 'ap'

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>>
  IRB.conf[:PROMPT][:CUSTOM] = {
   :PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_S => nil,
   :PROMPT_C => "?> ",
   :RETURN => "=> %s\n"
   }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end


