require 'model'

class Feed < Model
  class << self
    def collect_with_word word
      configs.map do |c|
        from_config_with_word(c, word)
      end
    end

    private

    def configs
      @configs ||= YAML.load_file("#{config_root}/feeds.yml")
    end

    def from_config_with_word config, word
      new(config, word)
    end
  end

  attr_reader :name, :url, :title, :site_url, :site_title

  def initialize attrs = {}, word = nil
    attrs = attrs.inject({}){|h, (k, v)| h[k] = v % word; h } if word
    super(attrs)
  end
end
