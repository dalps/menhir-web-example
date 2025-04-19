const input = document.getElementById("exp_input");
const p = document.getElementById("output");
const error = document.getElementById("error");

error.style.display = "none";

function parseAndShow(text) {
  try {
    var exp = myParseLib.parse(text);
    p.innerText = myParseLib.toString(exp);

    p.style.display = "";
    error.style.display = "none";
  } catch {
    p.style.display = "none";
    error.style.display = "";
  }
}

if (input.value) {
  parseAndShow(input.value);
}

input.addEventListener("input", (e) => {
  if (!e.target.value) {
    p.style.display = "none";
    error.style.display = "none";
    return;
  }

  parseAndShow(e.target.value);
});
