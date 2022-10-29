LibS2kFactionalItems
====================

A library to convert ItemId to ItemId of player's faction.

Synopsis:
---------
    local S2KFI = LibStub("LibS2kFactionalItems-1.0")

    -- convert to alliance
    itemId = S2KFI::GetFactionalItemId(itemId, 'alliance') or itemId

    -- convert to horde
    itemId = S2KFI::GetFactionalItemId(itemId, 'horde') or itemId

    -- convert to player's faction
    itemId = S2KFI::GetFactionalItemId(itemId) or itemId

Links
-----

* The latest alpha build is available on [http://www.wowace.com/addons/lib-s2k-factional-items/files](http://www.wowace.com/addons/lib-s2k-factional-items/files)
* The source code is available on [https://github.com/Silencer2K/wow-lib-s2k-factional-items](https://github.com/Silencer2K/wow-lib-s2k-factional-items)
* My other add-ons are available on [http://www.curse.com/users/silencer2k/projects](http://www.curse.com/users/silencer2k/projects)
