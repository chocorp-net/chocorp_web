window.addEventListener("load", () => {
    const form = document.querySelector("#feedback_form");
    form.addEventListener("ajax:success", (event) => {
        const text = $("#xhr_success");
        text.addClass("vanish");
        hideElt(text);
    });
    form.addEventListener("ajax:error", () => {
        text = $("#xhr_fail");
        text.addClass("vanish");
        hideElt(text);
    });
});

function hideElt(elt) {
    setTimeout(function() {
        elt.removeClass("vanish");
    }, 7001);
}
