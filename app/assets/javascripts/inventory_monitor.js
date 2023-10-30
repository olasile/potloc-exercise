InventoryMonitor = {
    output_element: null,
    opts: {
        websocketUrl: 'ws://Shiles-MacBook-Pro.local:8080/',
        low_threshold: 5,
        high_threshold: 80
    },
    logMessage(message) {
        InventoryMonitor.output_element.innerHTML += `<p>${message}</p>`;
        window.scrollTo(0, document.body.scrollHeight);
    },
    inventoryAtLowThreshold(inventory) {
        return inventory <= InventoryMonitor.opts.low_threshold;
    },
    inventoryAtHighThreshold(inventory) {
        return inventory >= InventoryMonitor.opts.high_threshold;
    },
    inventoryHealthy(inventory) {
        return inventory > InventoryMonitor.opts.low_threshold && inventory < InventoryMonitor.opts.high_threshold;
    },
    processEvent(event_data) {
        let message = `${event_data.store} store sold a pair of ${event_data.model}. ${event_data.store} now has ${event_data.inventory} pairs of ${event_data.model} left.`;
        InventoryMonitor.logMessage(message);

        if(!InventoryMonitor.inventoryHealthy(event_data.inventory)) {
            InventoryMonitor.displayAlert(event_data);
        }
    },
    displayAlert(event_data) {
        let inventory = event_data.inventory;
        let alert = document.createElement('span')
        alert.style.backgroundColor = '#B00100';
        alert.style.color = '#ffffff';
        alert.textContent = `${event_data.store}'s ${event_data.model} model has an inventory count of ${inventory}`

        if(InventoryMonitor.inventoryAtLowThreshold(inventory)) {
            alert.textContent += ' [TOO LOW]'
        } else if(InventoryMonitor.inventoryAtHighThreshold(inventory)) {
            alert.textContent += ' [TOO HIGH]'
        }

        InventoryMonitor.logMessage(alert.outerHTML);
    },
    establishWebsocketConnection() {
        let ws = new WebSocket(InventoryMonitor.opts.websocketUrl);

        ws.onopen = function() {
            InventoryMonitor.logMessage('Websocket connection established.');
        }

        ws.onerror = function(){
            InventoryMonitor.logMessage('Error with websocket connection.');
        }

        ws.onmessage = function(event) {
            InventoryMonitor.processEvent(JSON.parse(event.data));
        };

        ws.onclose = function() {
            InventoryMonitor.logMessage('Websocket connection closed.');
        }
    },
    init(output_element, opts = {}) {
        InventoryMonitor.output_element = output_element;
        Object.assign(InventoryMonitor.opts, opts);

        InventoryMonitor.establishWebsocketConnection();

        InventoryMonitor.logMessage('==============================================================================================================')
        InventoryMonitor.logMessage("Config Settings");
        InventoryMonitor.logMessage(`High Threshold: ${InventoryMonitor.opts.high_threshold} | Low Threshold: ${InventoryMonitor.opts.low_threshold}`)
        InventoryMonitor.logMessage('==============================================================================================================')
    }
};