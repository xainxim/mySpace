$(".menu").hover(function () {
        // over
        $(".sub-menu").stop().slideDown("slow");
        
    }, function () {
        // out
        $(".sub-menu").stop().slideUp("fast");
    }
);

var slide = $(".slide > img");
var eno = slide.length - 1;
var sno = 0;
var timer = setInterval("autoslide()",3000);

function autoslide(){
    $(slide[sno]).stop().animate({
        left:"100%"
    },1000,function(){
        $(this).css({left:"-100%"});
    });

    sno++;
    if(sno>eno){
        sno=0;
    }

    $(slide[sno]).stop().animate({
        left:"0"
    },1000)
}

function openPop(){
    $("#pop").show();
}
function closePop(){
    $("#pop").hide();
}