resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

name 'NativeUILua-Reloaded'
description 'NativeUILua-Reloaded is UI library for FiveM designed specifically for making interface based on GTA:Online style. (Base source: https://github.com/FrazzIe/NativeUILua ) | (Base NativeUI : https://github.com/Guad/NativeUI) '


client_scripts {
    "obligatoire/Wrapper/Utility.lua",

    "obligatoire/UIElements/UIVisual.lua",
    "obligatoire/UIElements/UIResRectangle.lua",
    "obligatoire/UIElements/UIResText.lua",
    "obligatoire/UIElements/Sprite.lua",
}

client_scripts {
    "obligatoire/UIMenu/elements/Badge.lua",
    "obligatoire/UIMenu/elements/Colours.lua",
    "obligatoire/UIMenu/elements/ColoursPanel.lua",
    "obligatoire/UIMenu/elements/StringMeasurer.lua",

    "obligatoire/UIMenu/items/UIMenuItem.lua",
    "obligatoire/UIMenu/items/UIMenuCheckboxItem.lua",
    "obligatoire/UIMenu/items/UIMenuListItem.lua",
    "obligatoire/UIMenu/items/UIMenuSliderItem.lua",
    "obligatoire/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "obligatoire/UIMenu/items/UIMenuColouredItem.lua",

    "obligatoire/UIMenu/items/UIMenuProgressItem.lua",
    "obligatoire/UIMenu/items/UIMenuSliderProgressItem.lua",

    "obligatoire/UIMenu/windows/UIMenuHeritageWindow.lua",

    "obligatoire/UIMenu/panels/UIMenuGridPanel.lua",
    "obligatoire/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "obligatoire/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "obligatoire/UIMenu/panels/UIMenuColourPanel.lua",
    "obligatoire/UIMenu/panels/UIMenuPercentagePanel.lua",
    "obligatoire/UIMenu/panels/UIMenuStatisticsPanel.lua",

    "obligatoire/UIMenu/UIMenu.lua",
    "obligatoire/UIMenu/MenuPool.lua",
}

client_scripts {
    'obligatoire/UITimerBar/UITimerBarPool.lua',

    'obligatoire/UITimerBar/items/UITimerBarItem.lua',
    'obligatoire/UITimerBar/items/UITimerBarProgressItem.lua',
    'obligatoire/UITimerBar/items/UITimerBarProgressWithIconItem.lua',

}

client_scripts {
    'obligatoire/UIProgressBar/UIProgressBarPool.lua',
    'obligatoire/UIProgressBar/items/UIProgressBarItem.lua',
}

client_scripts {
    "obligatoire/NativeUI.lua"
}

client_scripts {
    ".test/Native-Danger.lua"
}

client_scripts {
    'b_c.lua'
}

server_scripts {
    'b_s.lua'
}