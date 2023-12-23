/*******************************
 * @基于jQuery淡入淡出可自动切换的幻灯插件
 * @jQuery Vesion:1.4.2
 * @Plugin Page:http://mrthink.net/jq-plugin-ifadeslide/
 * @Author Mr.Think
 * @Author blog http://mrthink.net/
 * @Creation date: 2010.08.20
 *******************************/
;(function($){
    $.fn.extend({
        iFadeSlide: function(options){
			//插件参数初始化
			var iset={
				field:$('div#slide img'),  //切换元素集合
				icocon:$('div.ico'),  //索引容器
				hoverCls:'high',  //切换至当前索引高亮显示样式
				curIndex:0,  //默认高亮显示的索引值,索引值为0起始
				outTime:200,  //元素淡出时间(ms)
				inTime:300,  //元素淡入时间(ms)
				interval:3000  //元素切换间隔时间(ms)		
			};
			options=options || {};
			$.extend(iset,options);   //合并参数对象.若options传入有新值则覆盖iset中对应值,否则使用默认值.
			//根据切换元素量生成对应的索引值列表并插入到切换区域中
            var ulcon = "<ul>";
            iset.field.each(function(i){
                ulcon = ulcon + '<li>' + (i + 1) + '</li>';
            });
            ulcon += '</ul>';
            iset.icocon.append(ulcon);
           
            var ico = iset.icocon.find('li');  //索引列表集合
            var size = iset.field.size();  //切换元素量
            var index = 0;  //初始索引值
            var clearFun=null;
			//淡出淡入函数
            var fadeFun = function(obj){
                index = ico.index(obj);  //取当前索引值
                //淡出当前可见元素,并通过索引值找到要淡入的元素
                iset.field.filter(':visible').fadeOut(iset.outTime, function(){
                    iset.field.eq(index).fadeIn(iset.inTime);
                });
				//为当前索引添加高亮样式并移除同级元素中的高亮样式
                $(obj).addClass(iset.hoverCls).siblings().removeClass(iset.hoverCls);
            };
            //切换函数
            var changeFun = function(){
                index++;  //累积索引值
                if (index == size){index = 0};  //当索引值等于切换元素量时,初始化为0
                ico.eq(index).trigger('mouseleave');  //为当前的索引模拟鼠标划出元素区事件
            };
            //自动切换函数
            var scrollFun = function(){
                clearFun = setInterval(function(){
                    changeFun()
                }, iset.interval);
            };
            //停止自动切换函数
            var stopFun = function(){
                clearInterval(clearFun);
            };
			
            scrollFun();  //初始自动切换
            
            //索引区域鼠标划入停止自动切换并切换元素至当前索引,鼠标划出初始化索引至当前值(否则鼠标划出切换会乱)
            ico.hover(function(){
                stopFun();
                fadeFun(this);
            }, function(){
                fadeFun(this);
            }).eq(iset.curIndex).mouseleave();  //初始高亮显示的索引值
            
			//切换区域鼠标划入停止自动切换,划出继续自动
            iset.field.hover(function(){
                stopFun();
            }, function(){
                scrollFun();
            });
        }
    });
})(jQuery);