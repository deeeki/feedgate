class Feed
  attr_reader :name, :url, :title, :site_url, :site_title

  def initialize q, config
    @name = config['name']
    @url = sprintf config['url'], q
    @title = sprintf config['title'], q
    @site_url = sprintf config['site_url'], q
    @site_title = sprintf config['site_title'], q
  end
end

class FeedManager
  class << self
    def config
      @config ||= YAML.load_file settings.root + '/config/feeds.yml'
    end

    def find q
      config.map do |c|
        Feed.new q, c
      end
    end
  end
end
