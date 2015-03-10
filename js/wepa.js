var SITE = {
    init: function() {
        SITE.initToc();
    },
    initToc: function() {
        $(".tehtava").each(function(index, value) {
            var exCount = (index + 1);
            var exName = "Tehtävä " + exCount + ": " + $(value).find("h1 a").text();

            // add assignments to toc 
            $("#tehtavat-toc").append("<li><a data-toggle='collapse' href='" + $(value).find("h1 a").attr("href") + "'>" + exName + "</a></li>");

            // add links to assignment names
            $(value).attr("id", $(value).find("h1 a").attr("href").substring(1) + "-ex");

            // relabel assignments
            $(value).find("header h1 a").text(exName);

            // tag subassignments
            $(value).find("div h1").each(function(subIndex, value) {
                $(value).text(exCount + "." + (subIndex + 1) + ": " + $(value).text());
            });
        });

        // link toc to assignments
        $("#tehtavat-toc a").each(function(index, value) {
            $(value).click(function() {
                $('html, body').animate({
                    scrollTop: $($.attr(this, 'href') + "-ex").offset().top
                }, 400);

                $($.attr(this, 'href')).click();
            });
        });

        var idx = 1;
        $("section h1").each(function(index, value) {
            if ($(value).parents('.tehtava').length) {
                return; // ignore assignments
            }

            if ($(value).parents('.no-toc').length) {
                return; //ignore sections with .no-toc
            }

            if ($(value).parent('section').length) {


                var chapterCount = idx;

                var chapterText = chapterCount + ". " + $(value).text();
                
                console.log(chapterText);

                $(value).attr("id", "chapter" + chapterCount);
                $(value).text(chapterText);

                // add chapters to toc 
                $("#material-toc").append("<li><a href='#chapter" + chapterCount + "'>" + chapterText + "</a></li>");
                idx++;

                // iterate through siblings
                var sibling = $(value).next();
                var count = 1;
                while (sibling) {
                    // do not relabel assignments
                    if (!$(sibling).prop("tagName") || $(sibling).prop("tagName").toLowerCase() === "h1") {
                        break;
                    }

                    if ($(sibling).prop("tagName").toLowerCase() === "h2") {
                        var subChapterText = (chapterCount + "." + count + ". " + $(sibling).text());
                        $(sibling).text(subChapterText);
                        var id = "chapter" + chapterCount + "-" + count;
                        $(sibling).attr("id", id);
                        
                        $("#material-toc").append("<li><a href='#" + id + "'>&nbsp;&nbsp;&nbsp;" + subChapterText + "</a></li>");
                        
                        count++;
                    }


                    sibling = $(sibling).next();
                    
                    if(sibling.length <= 0) {
                        break;
                    }
                }
            }

        });

    }
};

$(function() {
    SITE.init();
    sh_highlightDocument('js/libs/syntaxhighlight/lang/', '.min.js');
});

