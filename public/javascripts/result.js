var Id = 0;
$(function() {
    imageAdding(1);
    imageAdding(2);
    imageAdding(3);
    imageAdding(4);
    $('img').click(function(event) {
        $('#seatNumber').attr('value',this.id);  
        $('#amount').attr('value', '450');  
    });
    
});

function imageAdding(id) {

    for(i=1;i<10;i+=1) {        
        $('#images'+id).append('<img src="images/seat_avail.jpg" class="seats" id="change"/>');
        Id += 1;
        $('#change').attr('id', Id);
    }
    if (id == 4) {
        $('#images'+id).append('<img src="images/seat_avail.jpg" class="seats" id="unbookable"/>');
    }
}
