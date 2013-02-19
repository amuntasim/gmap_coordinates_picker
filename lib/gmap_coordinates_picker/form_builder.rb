module GmapCoordinatesPicker
  module FormBuilder
    def self.included(base)
      base.send(:include, GmapCoordinatesPicker::ViewHelper)
      base.send(:include, GmapCoordinatesPicker::FormBuilder::ClassMethods)
    end

    module ClassMethods
      # Example:
      # <% form_for :shop, :url => shops_path do |form| %>
      #   ...
      #   <%= form.gmap_coordinate_picker :gmap_conf => {:lat_column => 'latitude', :lng_column => 'longitude' }, :default_coordinates => some_default_coordinates  %>
      # <% end %>
      #
      def gmap_coordinate_picker(options = {})
        options.update :object => @object_name
        render_gmap_coordinate_picker(objectify_options(options))
      end


    end
  end
end
