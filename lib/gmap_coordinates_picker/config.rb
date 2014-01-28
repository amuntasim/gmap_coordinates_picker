require 'active_support/configurable'

module GmapCoordinatesPicker

  def self.configure(&block)
    yield @config ||= GmapCoordinatesPicker::Configuration.new
  end

  # Global settings for GmapCoordinatesPicker
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :lat_column
    config_accessor :lng_column
    config_accessor :default_coordinates
    config_accessor :map_handler
    config_accessor :zoom_level
    config_accessor :map_container_class
    config_accessor :map_width
    config_accessor :map_height
  end

  configure do |config|
    config.lat_column = :latitude
    config.lng_column = :longitude
    config.default_coordinates = [23.727666666, 90.410550] #Dhaka (my home town) center point :)
    config.map_handler = 'gMapObj'
    config.zoom_level = 10
    config.map_container_class = 'gmap_coordinate_picker_container'
    config.map_width = '600px'
    config.map_height = '400px'
  end
end
