(function($){
    $(function(){
        $('.remove_book').live('click', function(){
            var $this = $(this);
            $this.siblings('input[type=hidden]').val(1);
            $this.closest('.book_field').animate({background: 'red'}, 50).delay(50).slideUp();
            return false;
        });
        $('.add_book').live('click', function(){
            var content = $("#new_book_template").html();
            var new_id = new Date().getTime();
            var regexp = new RegExp("new_book", "g");
            var new_fields = $(content.replace(regexp, new_id)).hide();
            new_fields.appendTo($('#books')).slideDown();
            return false;
        });
    });
})(jQuery);