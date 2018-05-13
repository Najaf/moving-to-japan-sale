require 'sinatra'
require 'yaml'
require 'ostruct'

def items
  @items ||= YAML.load(File.read('items.yaml')).map do |item|
    OpenStruct.new(item)
  end
end

def item_with_id(id)
  items.select { |item| item.id == id }
end

get '/' do
  haml :index
end
