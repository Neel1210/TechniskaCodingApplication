function showCoordinatorOption() {
    let element = document.getElementById("manageCoordinatorOption");
    let element2 = document.getElementById("manageParticipantsOption");
    let element3 = document.getElementById("manageQuizOption");
    element2.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element.removeAttribute("hidden");
}

function showParticipnatsOption() {
    let element = document.getElementById("manageCoordinatorOption");
    let element2 = document.getElementById("manageParticipantsOption");
    let element3 = document.getElementById("manageQuizOption");
    element.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
}

function showContestOption() {
    let element = document.getElementById("manageCoordinatorOption");
    let element2 = document.getElementById("manageParticipantsOption");
    let element3 = document.getElementById("manageQuizOption");
    element.setAttribute("hidden", "hidden");
    element2.setAttribute("hidden", "hidden");
    element3.removeAttribute("hidden");
}