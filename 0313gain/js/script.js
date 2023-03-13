$('.menu').hover(function () {
        // over
        $('.sub-menu').stop().slideDown("slow");
        
    }, function () {
        // out
        $('.sub-menu').stop().slideUp("fast");
    }
);

var slide = $('.slide > img');
var sno = 0;
var eno = slide.length - 1;
var timer = setInterval("autoslide()", 2000);

function autoslide(){
    $(slide[sno]).stop().animate({
        left : "100%"
    },500, function(){
        $(this).css({left:"-100%"});
    });

    sno++;
    if(sno > eno){
        sno = 0
    };

    $(slide[sno]).stop().animate({
        left : "0"
    },500);
}