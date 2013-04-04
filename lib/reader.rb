require 'model'
require 'cgi'

class Reader < Model
  class << self
    def collect
      configs.map do |c|
        from_config(c)
      end
    end

    private

    def configs
      @configs ||= YAML.load_file("#{config_root}/readers.yml")
    end

    def from_config config
      new(config)
    end
  end

  attr_reader :name, :url, :title, :image

  def add_url url
    url = CGI.escape(url) unless @encode.zero?
    @add_url % url
  end
end
