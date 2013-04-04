require 'yaml'

class Model
  @@config_root = File.expand_path('../../config', __FILE__)
  class << self
    def config_root
      @@config_root
    end

    def config_root= path
      @@config_root = path
    end
  end

  def initialize attrs = {}
    attrs.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
