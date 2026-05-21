//shopOpen = true;

selected = 0;

items = ds_list_create();

ds_list_add(items, ["Heal","Recovers 10 HP"]);
//ds_list_add(items, ["Radar", "Points out enemy locations, dies after one day"])
ds_list_add(items, ["HP Upgrade", "Increases max health and fully heals"]);
ds_list_add(items, ["Air Upgrade","Increases amount of air when underwater"]);
ds_list_add(items, ["Attack Upgrade", "Increases damage and range of attack"]);
ds_list_add(items, ["Board Upgrade", "Increases speed of board, as well as giving it better handling"]);

itemCount = ds_list_size(items);
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;
previewWidth = (guiWidth - (menuWidth + menuMargin));


