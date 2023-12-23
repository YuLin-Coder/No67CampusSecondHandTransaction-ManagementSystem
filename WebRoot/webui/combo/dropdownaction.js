

(function ($) {
  
    
    //dropdownLister事件监听
    $.DropdownListener = function (){
        

    };
    //封装Dropdown Public 方法
    $.extend($.DropdownListener, {
        parseJSONData: function (scope, dataJSON) {
            

            var parent = scope.closest(".bootstrap-dropdown");

            parent.find("ul[class='dropdown-menu']>li").remove();
            var ul = parent.find("ul[class='dropdown-menu']");
            var selectedText, selectedValue;
            for (var index = 0; index < dataJSON.dataset.length; index++) {
                ul.append($.format("<li><a href='#' data-value='{0}'>{1}</a></li>", dataJSON.dataset[index].selectValue, dataJSON.dataset[index].selectText));
                debugger;
                if (dataJSON.dataset[index].selected && selectedText == null && selectedValue == null) {
                    selectedText = dataJSON.dataset[index].selectText;
                    selectedValue = dataJSON.dataset[index].selectValue;
                }
            }
            //加载事件监听
            parent.dropdownListener();
            if(selectedValue!=null)
                $.DropdownListener.showSelected(scope, selectedText, selectedValue);
            else
                $.DropdownListener.showSelected(scope, dataJSON.dataset[0].selectText, dataJSON.dataset[0].selectValue);
        },
        //显示选择项
        showSelected:function(scope,text,value){
            var caret = scope.children(".caret");
            var textcontrolname = scope.attr("name") + "-text";
            var valuecontrolname = scope.attr("name") + "-value";
            $("[name='" + textcontrolname + "']").val(text);
            $("[name='" + valuecontrolname + "']").val(value);
            scope.html(text + caret.prop("outerHTML"));
        },
        
        prototype: {
            //初始化dropndown选择事件
            initSelectedListener: function () {
               
                $(this).each(function () {
                    var $thisScope = $(this);
                   
                    //alert($thisScope.closest(".bootstrap-dropdown").find("[class*='dropdown-menu']").html());
                    $thisScope.closest(".bootstrap-dropdown").find("ul[class*='dropdown-menu']>li>a").click(function () {
                      
                    	
                    	var selected = $(this);
                        var triger = $(this).closest(".bootstrap-dropdown").find("[data-toggle=\"dropdown\"]");
                        
                        $.DropdownListener.showSelected(triger, selected.text(), selected.data("value"));
                        //出发选择后事件
                        $thisScope.trigger("afterSelected");
                    });//end  click
                });//each
            },
            setSelected:function(scope,args){
            	 
            	 var text=args[1];
            	 var value=args[2];
            	 var dropdownbtn = scope.find("[data-toggle='dropdown']");
            	 var fieldname=dropdownbtn.attr("name");
                 var textcontrolname = fieldname + "-text";
                 var valuecontrolname = fieldname + "-value";
            	 $("[name='"+textcontrolname+"']").val(text);
            	 $("[name='"+valuecontrolname+"']").val(value);
            	 var caret = scope.find(".caret");
            	 dropdownbtn.html(text+caret.prop("outerHTML"));
            	
            },
            //加载数据源
            load: function () {
               

                var dataJSON = {
                    name: 'test', dataset:[
                        {
                            selectText: 'abc',
                            selectValue: '123',
                            selected:true
                        },
                        {
                            selectText: 'eee',
                            selectValue: '6666'
                        }
                    ]
                };
               
                var options = {};
                //alert(arguments[1].length);
                if (arguments[1].length = 2 && typeof arguments[1][1] == "object") {
                    
                    $.extend(options, arguments[1][1]);
                }
                if (arguments[1].length == 3 && typeof arguments[1][1] == "string"&&typeof arguments[1][2]=="object") {
                    options.url = arguments[1][1];
                    options.data = arguments[1][2];
                }
                
                //当前对象
                var _this = arguments[0];
 
                $.ajax({
                     url: options.url,
                     method: 'post',
                     data: options.data,
                     dataType: 'json',
                     success: function (responseData) {
                        $.DropdownListener.parseJSONData(_this, responseData);
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         //$.DropdownListener.parseJSONData(_this, dataJSON);
                         alert(XMLHttpRequest.status + errorThrown);
                     }
                 });//end ajax
                
            }//load function end
        }//prototype end
    });
   
    $.format = function () {

        if (arguments.length == 0)
            return null;
        var str = arguments[0];
        for (var i = 1; i < arguments.length; i++) {
            var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
            str = str.replace(re, arguments[i]);
        }
        return str;
    };


    $.extend($.fn, {
        //动作监听
        dropdownListener: function (){
            var listener = new $.DropdownListener();

            var $this = $(this).find("[data-toggle='dropdown']");
            
             if(arguments.length==0)
                //初始化监听事件
                 listener.initSelectedListener.call($this);
             //调用功能函数
             if (arguments.length > 0 && typeof arguments[0] == "string") {
                 
                 listener[arguments[0]].call(listener,$(this),arguments);
             }
             return $this;

        },
        //单击事件
        dropdownClick: function (callbackfun) {
            
            this.click(callbackfun);
           
        },
        dropdownSelected: function (callbackfun) {

            this.bind("afterSelected", callbackfun);
           // this.closest(".dropdown").find("ul.dropdown-menu>li>a").click(callbackfun);
        },
        getSelectedText: function () {
            var name = $(this).attr("name");
            var textcontrolname = name + "-text";
            return this.closest(".dropdown").find("[name='" + textcontrolname + "']").val();
           
        },
        getSelectedValue: function () {
            var name = $(this).attr("name");
            var valuecontrolname = name + "-value";
            return this.closest(".dropdown").find("[name='" + valuecontrolname + "']").val();
        }

    });//end extends
  
})(jQuery);

(function ($) {

    $.extend($.prototype, {

        pageAction: function () {
            var targetFormid = "form1";
            if (arguments.length >= 0 && typeof arguments[0] == "object") {
                targetFormid = arguments[0].targetFormid;
            }
            $(this).click(function (event) {
                var url = $(this).attr("href");
                // 取消点击事件的默认动作
                event.preventDefault();
                // 修改form中的action动作
                $("#" + targetFormid).attr("action", url);
               
                // 提交表单
                $("#" + targetFormid).submit();
            });

        }

    });
})(jQuery);

$(function () {

    $(".bootstrap-dropdown").dropdownListener();
    $(".pagination > li > a").pageAction();
    $(".goto-pageindex input[type=submit]").click(function () {
        
        var parentcon = $(this).closest(".goto-pageindex");
        var formid=parentcon.data("target-form");
        var url=parentcon.data("url");
        var pageindex = parentcon.find("[name=pageindex]").val();
        var index = url.indexOf("?");
        if (index == -1)
            url = url + "?pageindex=" + pageindex;
        else
            url = url + "&pageindex="+pageindex;
        $("#" + formid).attr("action", url);
        $("#" + formid).submit();

    });
});