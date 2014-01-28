# encoding: utf-8
require 'rails'
require 'gmap_coordinates_picker'

module GmapCoordinatesPicker
  class Engine < ::Rails::Engine
    config.after_initialize do
      ActionView::Base.send(:include, GmapCoordinatesPicker::ViewHelper)
      ActionView::Helpers::FormBuilder.send(:include, GmapCoordinatesPicker::FormBuilder)

      if Object.const_defined?("Formtastic")
        if Formtastic.const_defined?("Helpers")
          Formtastic::Helpers::FormHelper.builder = GmapCoordinatesPicker::FormtasticMapBuilder
        else
          Formtastic::SemanticFormHelper.builder = GmapCoordinatesPicker::FormtasticMapBuilder
        end
      end
    end
  end
end


