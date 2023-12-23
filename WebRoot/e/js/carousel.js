$(function(){
	
	$.extend($.fn,{
		
		fullCaroursel:function(){
			var $this=$(this);
			
			
			var  rollLength=$(".carousel .car-big-picture img").size();
			$this.totalLength=rollLength;
			//以下数组中的颜色与主图两边颜色同步的背景色(不同用户用脑分辨率不同导致图片无法铺满时,通过背景色的补充,起到铺满的作用)
			var rgb_arr = new Array("rgb(198, 198, 198)","rgb(238, 238, 238)","rgb(224, 232, 219)","rgb(33, 27, 123)","rgb(46, 167, 220)","rgb(0, 0, 0)");	
			
			setInterval(function(){	
				
	        	$this.css("background-color","rgb(198, 198, 198)");//第一张图的背景
				var showimageindex = $this.find(".car-big-picture img:visible").index();
				
				showimageindex=(++showimageindex)%$this.totalLength;
				//先隐藏所有小图边框
				showPicture(showimageindex);
				
			},5000);
			
			//点击左箭头
			$this.find(".car_c_inpt1").click(function(){
				
				var showindex = $this.data("showindex");	//当前选中的图片eq编号
				if(showindex <= 0){
					var showindex = rollLength-1;
				}else{
					var showindex = showindex-1;
				}
				mouseRoll(rgb_arr,title_arr,eqnum);
				
			});
			//点击右箭头
			$this.find(".car_c_inpt2").click(function(){
				var showindex = $this.data("showindex");	//当前选中的图片eq编号
				showindex=++showindex%rollLength;
				showPicture(showindex);
			});
			//鼠标滑过小图
			$this.find(".car_c_smallpic img").mouseover(function(){
				var showindex =$(".car_c_smallpic img").index($(this));
				
				showPicture(showindex);
			});
			//鼠标事件轮播方法
			showPicture=function(showindex){
				
				$this.find(".car-big-picture img").hide();	//先隐藏所有主图
				$this.find(".car_c_smallpic img").css("border","");
				$this.find(".car-big-picture img").eq(showindex).show();	//主图
				$this.css("background-color",rgb_arr[showindex]);	//主图背景
				$this.data("showindex",showindex);	//给div一个name值,代表当前自动轮到到哪张图,鼠标轮播时会用到这个值
				$this.find(".car_c_smallpic img").eq(showindex).css("border","solid 2px Darkorange");	//小图边框
				$this.find(".car_c_title p").hide().eq(showindex).show();//标题
				
			};
			
			
			
			
		}
		
	});
	$(".carousel").fullCaroursel();
	
	
    

	
});