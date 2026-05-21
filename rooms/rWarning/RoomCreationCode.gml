if (global.warningToGive == "KO") {
    instance_create_layer(0, 0, "Instances", oKOWarning);
}
else {
    instance_create_layer(0, 0, "Instances", oTimeoutWarning);
}