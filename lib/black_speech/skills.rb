require "war_troll/skills"
require "war_troll/skills/templates"

module BlackSpeech
  # Convenience method to initialize a new skill context
  def self.declare_skill(&definition)
    Skills::Context.new.instance_eval(&definition)
  end
  
  module Skills
    class Context
      def initialize(opts = {})
        @forced_opts = opts
      end
        
      def skill(name, opts = {}, &definition)
        opts.merge!(@forced_opts)
        generator = WarTroll::Skills::Templates::Generator.new(name, opts[:stat], opts[:category], definition)
        WarTroll::Skills::Templates.register(generator.template)
      end
        
      def category(name, opts = {}, &definition)
        opts.merge!(category: name)
        Context.new(opts).instance_eval(&definition)
      end
    end
  end
end
