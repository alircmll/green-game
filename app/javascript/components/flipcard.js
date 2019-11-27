import { checkServerIdentity } from "tls";

const flipcard = () => {    
    // $('.radio').on('click', function () {
    $('.radio_buttons').on('click', function () {
        
        $('.card').toggleClass('flipped');
        
        const radio1 = document.getElementById('radio1');
        const radio2 = document.getElementById('radio2');
        const good_option = document.getElementById('goodOption');
        if (radio1.checked && radio1.value === good_option.value ) {
            document.getElementById('badresult').setAttribute("hidden","")
        } else if (radio2.checked && radio2.value === good_option.value ) {
            document.getElementById('badresult').setAttribute("hidden","")
        } else {
            document.getElementById('goodresult').setAttribute("hidden","")
        }
    });
}

export { flipcard };