require 'gmap_coordinates_picker/config'
require 'gmap_coordinates_picker/engine' if defined?(Rails)

module GmapCoordinatesPicker
  autoload :ViewHelper, 'gmap_coordinates_picker/view_helper'
  autoload :FormBuilder, 'gmap_coordinates_picker/form_builder'
  autoload :FormtasticMapBuilder, 'gmap_coordinates_picker/formtastic'
end