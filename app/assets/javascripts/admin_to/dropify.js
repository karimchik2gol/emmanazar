function start_dropify(){
    $('.dropify').dropify({
        messages: {
            'default': 'Drag and drop a file here or click',
            'replace': 'Drag and drop or click to replace',
            'remove': 'Remove',
            'error': 'Ooops, something wrong appended.'
        },
        error: {
            'fileSize': 'The file size is too big (1M max).'
        }
    });
}

function set_hidden_field_dropify_delete(val, th){
    par = th.parents(".col-sm-9");
    par.find("input[type='hidden']:last").val(val);
}

$(".dropify-clear").click(function(){
    set_hidden_field_dropify_delete("true", $(this));
});

$(".dropify").change(function(){
    if(!$(this).val()){
        set_hidden_field_dropify_delete("false", $(this));
    }
})

start_dropify();