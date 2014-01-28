module GmapCoordinatesPicker
  class FormtasticMapBuilder < Formtastic::FormBuilder

    def gmap_coordinate_picker(options = {})
      options.update :object => @object_name
      render_gmap_coordinate_picker(objectify_options(options))
    end
  end
end
