Gmap Cordinates Picker
=====================

works to provide an easy to use Google Maps interface for displaying and setting geographic co-ordinates .

Where a latitude and longitude is set on the model, it is indicated by a marker shown on a Google map centered at the marker. The administrator can change the value of these fields by clicking on the desired new location on the map.

Usage
=====

add the following to your `Gemfile`:

```ruby
gem " gmap_coordinates_picker"
```

Then, add in your form:

```ruby
<%= form.gmap_coordinate_picker :gmap_conf => {:lat_column => 'latitude', :lng_column => 'longitude', :zoom_level => 10 }, :default_coordinates => [lat,lng]  %>
```

Or, user is as form helper:

```ruby
<%= render_gmap_coordinate_picker :gmap_conf => {:lat_column => 'latitude', :lng_column => 'longitude', :zoom_level => 10 }, :default_coordinates => [lat,lng]  %>
```


Configuration
=============

beside the option depicted on the example above it can be configured with the following:

- `map_container_class` - custom class for the map container
- `map_width` - default "600px
- `map_height` - default "400px"
- `api_key` - Google Map api key (optional)




LICENSE
=======
is licensed under the MIT license.

Copyright (C) 2013 by Muntasim Ahmed


Inspired from **rails_admin_map_field** (https://github.com/trademobile/rails_admin_map_field)


