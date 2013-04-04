require 'bundler/setup'
Bundler.require(:default) if defined?(Bundler)

$:.unshift(File.expand_path('../lib', __FILE__))
require 'feed'
require 'reader'

get '/' do
  @q = ''
  slim :index
end

get '/search' do
  q = params[:q]
  redirect '/' if q.to_s.empty?
  redirect '/keyword/' + q
end

get '/keyword/*' do |q|
  @q = Temple::Utils::escape_html q
  @readers = ReaderManager.load
  @feeds = FeedManager.find(q)
  slim :keyword
end
