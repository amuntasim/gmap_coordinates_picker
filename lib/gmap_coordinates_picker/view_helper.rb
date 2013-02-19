module GmapCoordinatesPicker #:nodoc
  module ViewHelper #:nodoc
    def render_gmap_coordinate_picker(options={})
      lat_column = options[:gmap_conf][:lat_column]
      lng_column = options[:gmap_conf][:lng_column]
      default_coordinates = options[:default_coordinates] || [0, 0]
      lat_column_value = options[:object].present? ? options[:object].send(lat_column) : default_coordinates[0]
      lng_column_value = options[:object].present? ? options[:object].send(lng_column) : default_coordinates[1]
      prefix = options[:object].present? ? options[:object].class.name.downcase : "gmap_coordinate_picker"
      lat_dom_id = "#{prefix}_#{lat_column}"
      lng_dom_id = "#{prefix}_#{lng_column}"

          locals = {
          :api_key => options[:api_key],
          :lat_column => options[:gmap_conf][:lat_column],
          :lng_column => options[:gmap_conf][:lng_column],
          :lat_column_value => lat_column_value,
          :lng_column_value => lng_column_value,
          :zoom_level => options[:gmap_conf][:zoom_level] || 10,
          :map_container => "#{prefix}_#{lat_column}_#{lng_column}_container",
          :map_container_class => options[:map_container_class],
          :map_width => options[:map_width] || "600px",
          :map_height => options[:map_height] ||"400px",
          :default_coordinates => default_coordinates,
          :lat_dom_id => lat_dom_id,
          :lng_dom_id => lng_dom_id,
          :lat_field => lat_lng_field(lat_column, lat_column_value,lat_dom_id, options),
          :lng_field => lat_lng_field(lng_column, lng_column_value,lng_dom_id, options)
      }


      render :partial => 'gmap_coordinate_picker/gmap_coordinate_picker', :locals => locals
    end

    private
    def lat_lng_field(column, value,dom_id, options={})
      if options[:object]
        hidden_field(column, {:value => value, :id =>dom_id})
      else
        hidden_field_tag(column, nil, {:id =>dom_id})
      end
    end


  end
end
