$(".menu").hover(function () {
        // over
        $(".subMenu").stop().slideDown("slow");
        
    }, function () {
        // out
        $(".subMenu").stop().slideUp("fast");
    }
);