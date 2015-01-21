require "war_troll/skills"
require "war_troll/skills/templates"

module BlackSpeech
  module Skills
    def skill(name, opts = {}, &definition)
      opts.merge!(@forced_opts)
      generator = WarTroll::Skills::Templates::Generator.new(name, opts[:stat], opts[:category], definition)
      WarTroll::Skills::Templates.register(generator.template)
    end
      
    def category(name, opts = {}, &definition)
      opts.merge!(category: name)
      self.class.new(opts).instance_eval(&definition)
    end
  end
end
