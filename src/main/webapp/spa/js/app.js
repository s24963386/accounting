function openMenu(page)
{
	var index = 0;
	if(page == "page1"){
		index = 1;
	}else if(page == "page2"){
		index = 2;
	}
	$(".menu li").removeClass("cur");
	$(".menu li").eq(index).addClass("cur");
}

$LAB
    .script("/spa/js/jquery.min.js").wait()
    .script("/spa/js/underscore-min.js").wait(function(){
    })
    .script("/spa/js/backbone-min.js").wait(function(){
    	$("#loading").hide();
    	
    	$(document).ready(function() {
    		
  	        var PageView = Backbone.View.extend({
	    	    tagName: 'div',
	    	    id: 'app',
	    	    initialize:function(pageid){
	    	    	this.pageid = pageid;
	    	    },
	    	    render: function() {
	    	      this.$el.html(_.templateFromUrl('/restful/teams/jsp?pagename='+this.pageid));
	    	      return this;
	    	    },
	        });
    		
    		$(document).on('click', 'a[href^="teams/"]', function(e) {
    		    e.preventDefault();
    		    var href =  $(e.currentTarget).attr('href');
    		    if(href == "teams/home"){
    		    	Backbone.history.navigate("", { trigger: true });
    		    }else{
    		    	Backbone.history.navigate(href, { trigger: true });
    		    }
    		});
    		
	    	var AppRouter = Backbone.Router.extend({
	    	    routes: {
	    	      '': 'root',
	    	      'teams(/:pageid)': 'goPage'
	    	    },
	    	    initialize: function() {
	    	    },
	    	    root: function() {
	    	      openMenu("teams/home");
	    	      $("#container").html("Home Page");
	    	    },
	    	    goPage: function(pageid) {
	    	      openMenu(pageid)
	    	      $("#container").html(new PageView(pageid).render().$el.html());
	    	    }
	    	});
	    	
	    	new AppRouter();
	    	Backbone.history.start({ pushState: true, root: '/' });
    	});
    });
