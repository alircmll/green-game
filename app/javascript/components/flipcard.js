const flipcard = () => {
    $('.response').on('click', function () {
        $('.card').toggleClass('flipped');
        $('.valid').attr("href", $('.response').data("option-id"));
    });
}

export { flipcard };