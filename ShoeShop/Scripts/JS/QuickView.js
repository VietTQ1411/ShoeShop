var view = {
    init: function () {
        view.resEvents();
    },
    resEvents: function () {
        $('.quickview').off('click').on('click', function () {
            $.ajax({
                url: '/Home/QuickView',
                data: {
                    id: $(this).data('id')
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res != null) {
                        $("#model_view_detail").attr('href', '/san-pham/' + res.id);
                        $("#model_images").attr('src', 'images/' + res.Image);
                        $('#model_name').html(res.name);
                        if (res.sale != null) {
                            $('#model_new_price').html('$' + (res.price - res.price * res.sale / 100));
                            $('#model_old_price').html('$' + res.price);
                        } else {
                            $('#model_old_price').html('');
                            $('#model_new_price').html('$' + res.price);
                        }

                        $('#model_description').html(res.description);
                        $("#model_add_to_cart").attr('href', 'them-gio-hang?ID=' + res.id + '&quantity=1');
                    } else {
                        console.log("null")
                    }
                }
            });
        });
    }
}
view.init();