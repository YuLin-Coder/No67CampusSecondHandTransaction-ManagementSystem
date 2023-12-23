var alertDlg = function (title, msg) {

    return $.alert({
        backgroundDismiss: true,
        titleClass: '',
        title: title,
        content: "<i class='fa fa-warning fa-lg'></i>" + msg,
        confirmButton: '确定',
        confirmButtonClass: 'btn-primary',
        closeIcon: true,
        columnClass: 'col-md-4 col-md-offset-4',
        animation: 'zoom',
        closeAnimation: 'scale',
        animationSpeed: 500,
        animationBounce: 1.2,

    });

};
var tipDlg = function (msg) {

    return $.alert({
        backgroundDismiss: true,
        titleClass: '',
        title: false,
        content: "<i class='fa fa-warning fa-lg'></i>" + msg,
        confirmButton: false,
        cancelButton: false,
        closeIcon: false,
        columnClass: 'col-md-4 col-md-offset-4',
        animation: 'zoom',
        closeAnimation: 'scale',
        animationSpeed: 500,
        animationBounce: 1.2,

    });


}