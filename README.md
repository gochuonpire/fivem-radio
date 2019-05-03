# FiveM Radio

This resource allows you to integrate your own radios in place of the original radios.
It's ~~fully~~ written in JavaScript and uses resource metadata for its configuration.

## Features

* Radio wheel
* Audio file
* Audio stream
* No dependency
* Easy configuration
* Player-configurable volume
* Song titles and artists pulled from Azuracast api

## Showcase

Video showing Los Santos Rock Radio replaced by a WebRadio with working title/artist:
[![Showcase](http://images.streamable.com/east/image/27mf6.jpg)](https://streamable.com/27mf6 "Showcase")

## Known bugs and limitations

* No MPEG, MP3 or AAC support as CEF only supports open formats

## Configuration

For each custom radio, add this line in `_resource.lua`:
```lua
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://azuraURL", volume = 0.1, name = "RADIONAME", api = "azuraapiurl/api/nowplaying/1" }
```

You can find the list of radio names in [`data.js`](radio/data.js) and a full example in [`__resource.lua`](radio/__resource.lua).

## Azuracast API Configuration

Obviously for song artists and titles to be pulled from an Azuracast API, you need to be using Azuracast as your web radio server. This was originally setup to use custom fields, as most of my song titles weren't in English and wouldn't render properly in GTA. Custom fields can be edited at /admin/custom_fields. Add gtav_artist and gtav_title to use the standard server.lua. The server.lua could be changed pretty easily to use standard artist/title fields if you don't want to go through every song on Azura and add the new data. 

I'm not sure if song names are available online, but the only one I could find was "ARM1_RADIO_STARTS", aka Action Bronson – Bad News ft. Danny Brown. As such, only one title/artist can be stored at once, so this works best with a single custom radio station. It will work with multiple, but the title/artist wont be updated on the wheel until you are listening to the station.

## Tips

Stream a modified `hud.ytd` (`gtav_radio_stations_texture_512`) file to replace radio logos.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
