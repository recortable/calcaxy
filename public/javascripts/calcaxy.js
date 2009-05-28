/* WORKS */
(function($) {
    $(function() {
        $.fn.center = function(loaded) {
            var obj = this;
            if(!loaded) {
                //obj.css('top', $(window).height()/2-this.height()/2);
                obj.css('left', $(window).width()/2-this.width()/2);
                $(window).resize(function()
                {
                    obj.centerScreen(!loaded);
                });
            } else {
                obj.stop();
                obj.animate({
                    top: $(window).height()/2-
                    this.height()/2,
                    left: $
                    (window).width()/2-this.width()/2
                }, 200, 'linear');
            }
        };

        $.fn.image = function(src, f) {
            return this.each(function() {
                var i = new Image();
                i.src = src;
                i.onload = f;
                this.appendChild(i);
            });
        };
    });


    $.show_image = function(file) {
        var pos = $(window).scrollTop();
        $('#container').fadeOut(function () {
            //$(window).animate({ scrollTop: 0 }, "slow");
            $(window).scrollTop(0);
            $('#file_preview').fadeIn().center();
        });
        $('#file_preview').empty().image(file, function() {
            console.log($(this).width() + ", " + $(this).height());
            $(this).click(function () {
                $('#container').show();
                $('#file_preview').fadeOut();
                //$("body").animate({ scrollTop: pos }, "slow");
                $(window).scrollTop(pos);
            });
        });
    }
})(jQuery);

/* BOOC */
(function($){
    
    })(jQuery);