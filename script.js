// Define keywords to highlight in the resume
const keywords = ["JavaScript", "HTML", "CSS", "React", "Node", "Python", "Leadership", "Teamwork", "Communication", "Project Management"];

function analyzeResume() {
    const input = document.getElementById("resumeInput").value;
    if (!input.trim()) {
    alert("Please paste your resume text.");
    return;
    }
    let foundCount = 0;
  // Highlight keywords in the resume text
    let highlighted = input.replace(
    new RegExp("(" + keywords.join("|") + ")", "gi"),
    (match) => {
    foundCount++;
    return `<span class="highlight">${match}</span>`;
    }
);
  const score = Math.min(100, foundCount * 5);
document.getElementById("highlightedText").innerHTML = highlighted;
document.getElementById("score").innerText = score;
document.getElementById("resultContainer").style.display = "block";
  // Approval message logic
let approvalMessage = document.getElementById("approvalMessage");
if (!approvalMessage) {
    approvalMessage = document.createElement("p");
    approvalMessage.id = "approvalMessage";
    document.getElementById("resultContainer").appendChild(approvalMessage);
}
approvalMessage.style.fontWeight = "bold";
if (score >= 50) {
    approvalMessage.style.color = "green";
    approvalMessage.innerText = "Candidate Approved ✅";
} else {
    approvalMessage.style.color = "red";
    approvalMessage.innerText = "Candidate Needs Improvement ❌";
}
}