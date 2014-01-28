module GmapCoordinatesPicker #:nodoc
  module ViewHelper #:nodoc
    def render_gmap_coordinate_picker(options={})

      unless options[:static].to_s == 'true'
        options[:gmap_conf] ||= {}
        if options[:gmap_conf].present?
          ActiveSupport::Deprecation.warn "passing :gmap_conf => {:lat_column => 'latitude', :lng_column => 'longitude'} as options is deprecated and may be removed from future releases, use :lat_column, :lng_column directly in the option instead  or see the document.", caller
        end
        lat_column = options[:lat_column] || options[:gmap_conf][:lat_column] ||  GmapCoordinatesPicker.config.lat_column
        lng_column = options[:lng_column] || options[:gmap_conf][:lng_column] || GmapCoordinatesPicker.config.lng_column
        default_coordinates = options[:default_coordinates] || GmapCoordinatesPicker.config.default_coordinates
        lat_column_value = options[:object].present? ? options[:object].send(lat_column) : default_coordinates[0]
        lng_column_value = options[:object].present? ? options[:object].send(lng_column) : default_coordinates[1]
        prefix = options[:object].present? ? options[:object].class.name.downcase : "gmap_coordinate_picker"
        lat_dom_id = "#{prefix}_#{lat_column}"
        lng_dom_id = "#{prefix}_#{lng_column}"
      end

      default_locals = {
          :api_key => options[:api_key],
          :map_handler => options[:map_handler] || GmapCoordinatesPicker.config.map_handler,
          :zoom_level => options[:zoom_level] || GmapCoordinatesPicker.config.zoom_level,
          :map_container => "gmap_coordinate_picker_container_#{Time.now.to_i}",
          :map_container_class => options[:map_container_class] || GmapCoordinatesPicker.config.map_container_class,
          :map_width => options[:map_width] || GmapCoordinatesPicker.config.map_width,
          :map_height => options[:map_height] || GmapCoordinatesPicker.config.map_height,
          :default_coordinates => options[:default_coordinates] || GmapCoordinatesPicker.config.default_coordinates,
      }

      editable_map_locals = {

          :lat_column => lat_column,
          :lng_column => lng_column,
          :lat_column_value => lat_column_value,
          :lng_column_value => lng_column_value,
          :map_container => "#{prefix}_#{lat_column}_#{lng_column}_container#{Time.now.to_i}",
          :lat_dom_id => lat_dom_id,
          :lng_dom_id => lng_dom_id,
          :lat_field => lat_lng_field(lat_column, lat_column_value, lat_dom_id, options),
          :lng_field => lat_lng_field(lng_column, lng_column_value, lng_dom_id, options)
      }

      unless options[:static].to_s == 'true'
         @template ||= self
         @template.render :partial => '/gmap_coordinate_picker/gmap_coordinate_picker', :locals => default_locals.merge(editable_map_locals)
      else
        render :partial => '/gmap_coordinate_picker/render_map', :locals => default_locals
      end
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