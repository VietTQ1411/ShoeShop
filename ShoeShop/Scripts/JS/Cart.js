var cart = {
    init : function () {
        cart.resEvents();
    },
    resEvents: function () {
        $('.delete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: '/Cart/Delete',
                data: {
                    id: $(this).data('id')
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/cart";
                    }
                }
            });
        });
        $('.fa-minus').off('click').on('click', function (e) {
            console.log($(this).data('id'));
            e.preventDefault();
            $.ajax({
                url: '/Cart/Change',
                data: {
                    id: $(this).data('id'),
                    status: false
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/cart";
                    }
                }
            });
        });
        $('.fa-plus').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: '/Cart/Change',
                data: {
                    id: $(this).data('id'),
                    status : true
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/cart";
                    }
                }
            });
        });
        $('#btn_coupon').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: '/Cart/CheckCoupon',
                data: {
                    code: $("#coupon_code").val()
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        $("#discount").html('$' + ($("#subtotal").val() * res.value / 100).toFixed(2)+ " ( " + res.value + "% )");
                        $("#total").html('$' + ($("#subtotal").val() - $("#subtotal").val() * res.value / 100).toFixed(2));
                    }
                }
            });
        });
        
    }
}
cart.init();