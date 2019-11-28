import { checkServerIdentity } from "tls";

const flipcard = () => {    
    $('.radio').on('click', function () {
        $('.flipcard').toggleClass('flipped');
        const el = document.querySelectorAll('input[id^="answer_option_id_"]');
        const radio1 = el[0];
        const radio2 = el[1];
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