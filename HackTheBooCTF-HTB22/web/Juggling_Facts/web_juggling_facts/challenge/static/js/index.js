const $ = document.querySelector.bind(document);
const spookybtn = $('#spookybtn');
const icon = '🎃';

const loadfacts = async (fact_type) => {
    await fetch('/api/getfacts', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ 'type': fact_type })
    })
        .then((response) => response.json())
        .then((res) => {
            if (!res.hasOwnProperty('facts')){
                populate([]);
                return;
            }

            populate(res.facts);
        });
}

const populate = (facts) => {
    facts_html = '';

    grid_array = [
        'fact fact-featured',
        'fact',
        'fact fact-tall',
        'fact fact-tall',
        'fact',
        'fact',
        'fact fact-xtall',
        'fact fact-wide',
        'fact'
    ];

    if (facts.length > 0)
    {
        for (let i = 0; i < facts.length; i++){
            facts[i].fact = facts[i].fact.replaceAll(':pumpkin:', icon);
            facts_html += `<div class="${grid_array[i]}">${facts[i].fact}</div>`;
        }
    }
    else
    {
        facts_html = '<div></div><div class="error">Secrets can only be accessed by admin</div>';
    }

    $('#facts-container').innerHTML = facts_html;
}

window.onload = () => {
    spookybtn.click();
}