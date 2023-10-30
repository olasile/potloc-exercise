# README

This is the implementation of the Potloc technical exercise.

- `app/views/inventories/index.html.erb` contains the interface that can be used to monitor the inventory level changes.
- `app/assets/javascripts/inventory_monitor.js` contains the logic for the javascript class that responds to the websocket messages.
- I added the alert system which contains two threshold values for what is considered too high and too low. These values are configurable by passing them in a dictionary as the second parameter in the `InventoryMonitor.init()` method. 
  - For example: `InventoryMonitor.init(output_element, { high_threshold: 90, low_threshold: 10})` will consider inventory counts >= 90 to be too high, and <=10 to be too low, and will display an alert accordingly. The values default to 80 and 5.

