window.onload = async () => {
    let stats = document.getElementById("stats");
    const response = await fetch("/api/stats?command=ifconfig");
    const data = await response.text();
    stats.innerHTML = data;
}