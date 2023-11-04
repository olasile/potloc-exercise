Product = {
    init() {
        var params = {
            channel: 'ApplicationCable::ProductChannel'
        };

        App.cable.subscriptions.create(params, {
            received: function (data) {
                console.log(data);
                this.broadcastMessage(data);
            },

            broadcastMessage: function (data) {
                data.products.forEach(function (product) {
                    let $product = $(`#product-${product.id}`);
                    if($product.length) {
                        $product.find('.product--available').text(product.available);
                    }
                })
            }
        });
    }
}