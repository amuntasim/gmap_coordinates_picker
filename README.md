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
<%= form.gmap_coordinate_picker :lat_column => 'latitude', :lng_column => 'longitude' , :zoom_level => 10, :default_coordinates => [lat,lng]  %>
```

Or, user is as form helper:

```ruby
<%= render_gmap_coordinate_picker :lat_column => 'latitude', :lng_column => 'longitude' , :zoom_level => 10, :default_coordinates => [lat,lng]  %>
```
To display static map:

```ruby
<%= render_gmap_coordinate_picker :static => 'true', :zoom_level => 10 , :default_coordinates => [lat,lng]  %>
```


Configuration
=============

beside the option depicted on the example above it can be configured with the following:

- `map_container_class` - custom class for the map container
- `map_width` - default "600px
- `map_height` - default "400px"
- `api_key` - Google Map api key (optional)
- 'static'  - to display only static map, by default it set to false and the map will be editable
- 'map_handler' - javascript map object to operate custom event on rendered map by default gMapObj is assigned as map object. You can implement any google map API methods like setCenter, zoom with that object

General configuration options
=============================

You can configure the following default values by overriding these values using:
GmapCoordinatesPicker.configure method.

  lat_column #= :latitude                                                                       
  lng_column #= :longitude                                                                      
  default_coordinates #= [23.727666666, 90.410550] #Dhaka (my home town) center point :)        
  map_handler #= 'gMapObj'                                                                      
  zoom_level #= 10                                                                              
  map_container_class #= 'gmap_coordinate_picker_container'                                     
  map_width #= '600px'                                                                          
  map_height #= '400px'                                                                         

There's a handy generator that generates the default configuration file into config/initializers directory.
Run the following generator command, then edit the generated file.

```ruby
rails g gmap_coordinates_picker:config
```

VERSION
=======

-0.0.3
    - `static map` feature added
    -  `javascript map handler` support added

-0.0.2
    render_gmap_coordinate_picker for for helper

LICENSE
=======
is licensed under the MIT license.

Copyright (C) 2013 by Muntasim Ahmed


Inspired from **rails_admin_map_field** (https://github.com/trademobile/rails_admin_map_field)


