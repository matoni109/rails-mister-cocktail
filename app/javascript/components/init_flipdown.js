const flipdown = document.addEventListener('DOMContentLoaded', () => {

    // get main
    const main = document.querySelector('#main');
    const top = document.querySelector('#top');
    // Unix timestamp (in seconds) to count down to
    var twoDaysFromNow = (new Date().getTime() / 1000) + (6 * 1) + 1;

    // Set up FlipDown
    const flipdown = new FlipDown(twoDaysFromNow)

        // Start the countdown
        .start()

        // Do something when the countdown ends
        .ifEnded(() => {
            console.log(main);

            main.removeAttribute("style");
            top.setAttribute("style", "display: none;");
        });

});


export { flipdown }