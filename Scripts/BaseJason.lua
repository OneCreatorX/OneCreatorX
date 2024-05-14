{
  "games": {
    "CollectForUGC": {
      "placeIds": ["17103905229", "PlaceId2", ...],
      "_scripts": [
        {
          "scriptName": "ScriptName1",
          "text": "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/CollectForUGC.lua\", true))()"
        },
        {
          "scriptName": "ScriptName2",
          "text": "loadstring(game:HttpGet(\"URL_Script2\", true))()"
        },
        ...
      ]
    },
    "GameName2": {
      "placeIds": ["PlaceId3", "PlaceId4", ...],
      "_scripts": [
        {
          "scriptName": "ScriptName3",
          "text": "loadstring(game:HttpGet(\"URL_Script3\", true))()"
        },
        ...
      ]
    },
    ...
  }
}
