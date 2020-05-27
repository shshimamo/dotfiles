## Settings
Pry.config.color = true
Pry.config.editor = "vim"

#Pry.config.prompt = proc do |obj, level, _|
#  prompt = ""
#  prompt << "#{Rails.version}@" if defined?(Rails)
#  prompt << "#{RUBY_VERSION}"
#  "#{prompt} (#{obj})> "
#end


## Alias
Pry.config.commands.alias_command "lM", "ls -M"
# Ever get lost in pryland? try w!
Pry.config.commands.alias_command 'w', 'whereami'
# Clear Screen
Pry.config.commands.alias_command '.clr', '.clear'


## Below others cooperation

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-awesome_print
if defined? AwesomePrint
  begin
    require 'awesome_print'
    Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
    # Pry.config.print = proc { |output, value| output.puts value.ai } #ページングなし
  rescue LoadError => err
    puts "no awesome_print :("
    puts err
  end
end

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-hirb
if defined? Hirb
 Hirb::View.instance_eval do
   def enable_output_method
     @output_method = true
     @old_print = Pry.config.print
     Pry.config.print = proc do |output, value|
       Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
     end
   end

   def disable_output_method
     Pry.config.print = @old_print
     @output_method = nil
   end
 end
end

# refs: https://github.com/deivid-rodriguez/pry-byebug#matching-byebug-behaviour
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'q', 'quit'
end


if defined?(PryStackExplorer)
  Pry.commands.alias_command 'stack', 'show-stack'
end

if defined?(PryRails)
  #Pry.config.prompt = Pry::Prompt[:rails][:value] if Pry::Prompt[:rails]

  #Pry.commands.alias_command 'find',    'find-route'
  Pry.commands.alias_command 'sroutes',  'show-routes'
  Pry.commands.alias_command 'sgroutes', 'show-routes -G '
  Pry.commands.alias_command 'smodel',   'show-model'
  Pry.commands.alias_command 'smodels',  'show-models'
  Pry.commands.alias_command 'sgmodels', 'show-models -G '
  #Pry.commands.alias_command 'path',   'recognize-path'
  Pry.commands.alias_command 'smiddlewares',   'show-middleware'
end

if defined?(Rails)
  include Rails.application.routes.url_helpers
  Rails.application.eager_load!

  def ars
    ApplicationRecord.subclasses.map(&:name)
  end

  def rrr
    reload!
  end

  # if Rails.application.class.to_s == "Application Name"
  #   @xxx = ModelName.first
  # end
end

def aliases
  puts <<~ALIASES
    # [find-route]:
    #   find-route MyController#show
    #   find-route MyController
    #   find-route Admin              #=> Admin namespace
    #   find-route Com                #=> regex matches /Comm/, e.g CommentsController
    'find',        'find-route'
    # [show-middleware]:
    'middlewares', 'show-middleware'
    # [show-model(s)]:  show-model <model name>
    'model',       'show-model'
    'models',      'show-models'
    'gmodels',     'show-models -G '
    # [show-routes]:
    'routes',      'show-routes'
    'groutes',     'show-routes -G '
    # [show-stack]:
    'stack',       'show-stack'
    # [recognize-path]:
    #   recognize-path example.com
    #   recognize-path example.com -m post  #=> メソッド指定
    'path',        'recognize-path'
    # All ApplicationRecord.subclasses names
    'ars',         'ApplicationRecord.subclasses.map(&:name)'
  ALIASES
end

# Hit Enter to repeat last command
#Pry::Commands.command /^$/, "repeat last command" do
#  _pry_.run_command Pry.history.to_a.last
#end
