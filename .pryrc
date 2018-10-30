## Settings
Pry.config.color = true
Pry.config.editor = "vim"

Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end


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

 # Hirb.enable
end

# refs: https://github.com/deivid-rodriguez/pry-byebug#matching-byebug-behaviour
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'q', 'quit'
end
Pry.commands.alias_command 'sr', 'show-routes'
Pry.commands.alias_command 'srg', 'show-routes -G '
Pry.commands.alias_command 'sm', 'show-model'


# Hit Enter to repeat last command
#Pry::Commands.command /^$/, "repeat last command" do
#  _pry_.run_command Pry.history.to_a.last
#end
