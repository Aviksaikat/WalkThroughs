const alerts = document.getElementById('alerts');
const food = food_selected => {
    document.getElementById('food').value = food_selected;
    document.getElementById('food_select').innerHTML = food_selected;
};

const flash = (message, level) => {
  alerts.innerHTML = `
      <div class="alert alert-${level}" role="alert">
          <button type="button" id="closeAlert" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>${message}</strong>
      </div>
  `;
};

const bg = document.body;
const mouseValues = {
  ox: 1,
  oy: 1
};

const form = document.getElementsByTagName('form')[0];

form.addEventListener('submit', e => {
  e.preventDefault();
  fetch('/api/order', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      table_num: document.getElementById('table').value,
      food: document.getElementById('food').value
    })
  })
  .then(r => r.json())
  .then(data => {
    flash(data.message, data.status);
  });
});

bg.addEventListener('mousemove', ev => {
  mouseValues.sw = window.innerWidth * 0.5;
  mouseValues.sh = window.innerHeight * 0.5;
  mouseValues.mx = ev.clientX;
  mouseValues.my = ev.clientY;
  mouseValues.ox = (Math.floor((mouseValues.sw - mouseValues.mx) / mouseValues.sw * 35) * -0.01).toFixed(2);
  mouseValues.oy = (Math.floor((mouseValues.sh - mouseValues.my) / mouseValues.sh * 35) * -0.01).toFixed(2);
});

let x = 0;
let y = 0;
const ticker = new PIXI.ticker.Ticker();
ticker.stop();
ticker.add(() => {
  x = x - mouseValues.ox * 5;
  y = y - mouseValues.oy * 5;
  bg.style.backgroundPosition = x + 'px ' + y + 'px';
});
ticker.start();