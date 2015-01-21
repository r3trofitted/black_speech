require "black_speech/version"
require "black_speech/skills"

module BlackSpeech
  # Convenience method to initialize a new skill context
  def self.speak(&definition)
    Context.new.instance_eval(&definition)
  end
  
  class Context
    include BlackSpeech::Skills
    
    def initialize(opts = {})
      @forced_opts = opts
    end
  end
end

