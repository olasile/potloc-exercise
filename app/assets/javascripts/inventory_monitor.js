InventoryMonitor = {
    init() {
        var params = {
            channel: 'ApplicationCable::InventoryMonitorChannel'
        };

        App.cable.subscriptions.create(params, {
            received: function (data) {
                console.log(data);
                this.broadcastMessage(data);
            },

            broadcastMessage: function (data) {
                data.order_products.forEach(function (order_product) {
                    $('.inventory-monitor--console').append(`<div>${order_product.product.store.name}</div> sold ${order_product.quantity} of ${order_product.product.name}. Available: ${order_product.product.available}`);
                })

                window.scrollTo(0, document.body.scrollHeight);
            }
        });
    }
}
