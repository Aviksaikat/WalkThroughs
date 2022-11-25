var fills = document.querySelectorAll(".healthbar_fill");
var aliveCharacter = document.querySelector(".alive")
var deadCharacter = document.querySelector(".dead")

var health = 100;
var maxHp = 100;
var total_tries = 8

function renderHealth() {

   var percent = health / maxHp * 100;

   //Update color
   document.documentElement.style.setProperty('--bar-fill', '#57e705');
   document.documentElement.style.setProperty('--bar-top', '#6aff03');

   if (percent <= 50) { //yellows
      document.documentElement.style.setProperty('--bar-fill', '#d6ed20');
      document.documentElement.style.setProperty('--bar-top', '#d8ff48');
   }
   if (percent <= 25) { //reds
      document.documentElement.style.setProperty('--bar-fill', '#ec290a');
      document.documentElement.style.setProperty('--bar-top', '#ff3818');
   }
   console.log(percent)
   if (percent <= 0 || isNaN(percent)) {
      aliveCharacter.style.display = "none";
      deadCharacter.style.display = "block";
      document.getElementById('modalafter').textContent = 'Victory!!!';
      document.getElementById('modal').style.display = "block";

   } else {
      aliveCharacter.style.display = "block";
      deadCharacter.style.display = "none";
   }


   fills.forEach(fill => {
      fill.style.width = percent + "%";
   })
}

function updateHealth(change) {
   health += change;
   health = health > maxHp ? maxHp : health;
   health = health < 0 ? 0 : health;

   renderHealth();
}

function addCards() {
   row1 = $('#row1');
   row2 = $('#row2');

   power = [
      11,
      33,
      54,
      22,
      45,
      78,
      34,
      65,
      32,
      90,
      43
   ]

   card_image = [
      'static/images/card1.png',
      'static/images/card2.png',
      'static/images/card3.png',
      'static/images/card4.png',
      'static/images/card5.png',
      'static/images/card6.png',
      'static/images/card7.png',
      'static/images/card8.png',
      'static/images/card9.png',
      'static/images/card10.png',
      'static/images/card11.png',
      'static/images/card12.png',
      'static/images/card13.png',
      'static/images/card14.png',
      'static/images/card15.png',
      'static/images/card16.png',
      'static/images/card17.png',
      'static/images/card18.png',
      'static/images/card19.png',
      'static/images/card20.png',
   ]

   operator = ['-', '+']

   for (i = 0; i < 20; i++) {
      var card_div_1 = document.createElement('div');
      card_div_1.setAttribute('class', 'face side1');

      var card_div_2 = document.createElement('div');
      card_div_2.setAttribute('class', 'face side2');

      var face_side_1_image = document.createElement('img');
      face_side_1_image.setAttribute('src', 'static/images/card_back.png');
      face_side_1_image.setAttribute('class', 'cardImage');

      card_div_1.append(face_side_1_image);

      var face_side_2_image = document.createElement('img');
      face_side_2_image.setAttribute('src', card_image[i]);
      face_side_2_image.setAttribute('class', 'cardImage');

      card_div_2.append(face_side_2_image);

      var main_card_div = document.createElement('div');
      main_card_div.setAttribute('class', 'card');
      main_card_div.setAttribute('angle', 0);
      main_card_div.setAttribute('power', power[Math.floor(Math.random() * power.length)])
      main_card_div.setAttribute('operator', operator[Math.floor(Math.random() * operator.length)])

      main_card_div.append(card_div_1);
      main_card_div.append(card_div_2);

      if (i < 10) {
         row1.append(main_card_div);

      }
      else{
         row2.append(main_card_div);
      }
   }

   document.getElementById("flipleft").textContent = `Flip left: ${total_tries}`


}

const calculate_health = (power, operator) => {
   fetch('/api/get_health',{
      method:'POST',
      headers: {
         'Content-Type': 'application/json'
      },
      body: JSON.stringify({ 'current_health': health.toString(), 'attack_power': power, 'operator': operator })
   })
   .then((data) => data.json())
   .then((response) => {
      if(Number(response.message) <= 0) updateHealth(-100)
      if(operator === '-') {
         document.getElementById("addicon").classList.toggle('incorrect');
         updateHealth(Number(`-${response.message}`))
         setTimeout(() => {
            document.getElementById("addicon").classList.toggle('incorrect');
        }, 500)
      }
      if(operator === '+') {
         document.getElementById("addicon").classList.toggle('correct');
         updateHealth(Number(response.message))
         setTimeout(() => {
            document.getElementById("addicon").classList.toggle('correct');
        }, 500)
      }
      document.getElementById("flipleft").textContent = `Flip left: ${total_tries - 1}`
      total_tries -= 1
   })
}

$(document).on('click', '.card', function () {
   var attr = $(this).attr('turned');
   if (total_tries > 0 && attr === 'once'){
      calculate_health($(this).attr('power'), $(this).attr('operator'));
      $(this).attr('turned', 'done');
   }
   if (total_tries <= 0){
      document.getElementById('modalafter').textContent = 'Game Over!';
      document.getElementById('modal').style.display = "block";
   }
});

$(document).ready(function () {
   addCards();
})

updateHealth(0);