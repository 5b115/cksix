
(function ($) {

    $.fn.cubeGallery = function (options) {

         options = $.extend({
            width: 250,
            height: 250,
            linksClass: "button",
            imgClass: "figure",
            caruselClass: "carusel",
            slayderClass: 'container',
            axisRotate : "rotateY" //change horizontal or vertical rotate(X or Y )
        },options);

        return this.each(function() {
        var element = $(this).find('img');

        var quantity = element.length;
        var angleRotation = 360 / quantity;
        console.log(angleRotation);
        var radian = angleRotation / 2 * Math.PI / 180;
        var translate = (options.width / 2) / Math.tan(radian);
        console.log(translate);

        $(document).ready(function () {

            element.each(function (index) {
                element.css({
                    position: 'absolute',
                    width: options.width + 'px',
                    height: options.height + 'px',
                    border: '1px solid #000'});
                console.log(element);
                var d = index * angleRotation;
                var transforms = options.axisRotate + '(' + d + 'deg) translateZ(' + translate + 'px)';
                console.log(options.axisRotate);
                $(this).css({'transform': transforms});
            });
        });

            $('.' + options.linksClass).click(function (event) {
            event.preventDefault();

                var i = $(this).index();
                console.log(i);
                $(this).each(function () {
                    var d = i * angleRotation;
                    var rotate = options.axisRotate + '(' + -d + 'deg)';
                    console.log(rotate);
                   $('.' + options.caruselClass).css({'transform': rotate});
                });
            });
        });
    };
})(jQuery);

$('body').cubeGallery({ });console.log("\u002f\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u000d\u000a\u0020\u002a\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u0009\u0009\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0020\u0020\u0020\u0020\u0020\u0020\u4ee3\u7801\u5e93\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0077\u0077\u0077\u002e\u0064\u006d\u0061\u006b\u0075\u002e\u0063\u006f\u006d\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0009\u0009\u0020\u0020\u52aa\u529b\u521b\u5efa\u5b8c\u5584\u3001\u6301\u7eed\u66f4\u65b0\u63d2\u4ef6\u4ee5\u53ca\u6a21\u677f\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002f");


