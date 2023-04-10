<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Gunhead Diagnose</title>
  <link rel="stylesheet" href="/static/css/style.css">

</head>

<body>
  <main>
    <div id="border">
      <wrapper>
        <scroller id="scroller">
          <content id="blog-content">
            <div class="my-post text">
              <h2>Visual Inspection</h2>
              <p>Starting Visual Inspection... OK</p>
              <p>Checking for cracks and deformation... OK</p>
              <p>Verifying all lights and indicators are functioning... OK</p>
              <p>Confirming all necessary data is displayed correctly... OK</p>
            </div>
            <div class="my-post text">
              <h2>Actuators</h2>
              <p>Locating all of the actuators... OK</p>
              <p>Confirming that the actuator moves in the correct direction... OK</p>
              <p>Checking the position sensors, limit switches... OK</p>
              <p>Checking for voltage issues... OK</p>
            </div>
            <div class="my-post text">
              <h2>Power Systems</h2>
              <p>Locating all of the components of the power system... OK</p>
              <p>Verifying that the power connections are properly connected... OK</p>
              <p>Checking the voltage and current levels... OK</p>
              <p>Running performance tests on the charging system... OK</p>
            </div>
            <div class="my-post text">
              <h2>Sensors</h2>
              <p>Verifying that the sensor connections are properly connected... OK</p>
              <p>Testing all the sensors... OK</p>
              <p>Monitoring the sensor data... OK</p>
              <p>Running performance tests... OK</p>
            </div>
          </content>
          <scrollbar></scrollbar>
        </scroller>
        <div id="celia-window">
          <div id="term-container">
            <div id="term"></div>
            <div id="term-entry">
              <div>
                ><input type="text" class="c3" maxlength="140" />
              </div>
            </div>
          </div>
        </div>
      </wrapper>
    </div>
    <sidebar>
      <a id="side-int" class="s" href="#">
        <p>Status</p>
        <img style="height: 80%;" src="/static/images/face.png" />
      </a>
      <a id="side-needs" class="s" href="#">
        <p>Needs</p>
        <img src="/static/images/needs.png" />
      </a>
      <a id="side-celia" class="s" href="#">
        <p>Command</p>
        <img style="height: 70%;" src="/static/images/terminal.png" />
      </a>
    </sidebar>
    <div id="integer-status" class="pop">
      <div class="ribbon">// Integer_Status<close>X</close>
      </div>
      <img id="integer" src="/static/images/figure.png" />
      <p class="codetext">
        Last Update: Feb 7, 2023.<br />
        Release Date: TBA<br />
        Creator: Xclow3n<br />
        Design Document: In Progress.<br /><br />
        zPlat v. 2022-03-25<br />
        hackReg v. 2022-08-21<br /><br />
        Current Activity: Planning phase involving character redesigns, story development, and mechanics development.
      </p>
    </div>
    <div id="needs" class="pop red">
      <div class="ribbon">// Needs<close>X</close>
      </div>
      <div class="scrollbox">
        <span class="dirtitle">Power Status: </span>
        <div class="dirtitleAfter"></div>
        <ul class="dir">
          <li>> Current Power: 40%</li>
          <li>> Time Left: 11h 54m</li>
        </ul>
        <span class="dirtitle">Repair and Maintenance: </span>
        <div class="dirtitleAfter"></div>
        <ul class="dir">
          <li>> Health: 90%</li>
          <li>> Repair: Right Leg, Arm Motor</li>
        </ul>
        <span class="dirtitle">Weapon Status: </span>
        <div class="dirtitleAfter"></div>
        <ul class="dir">
          <li>> Plasma Cannon: Fully operational</li>
          <li>> Gatling Gun: Partially operational</li>
          <li>> Missile Launcher: Inactive. The launcher has been disassembled for maintenance and is currently being repaired. It is not available for use at this time.</li>
        </ul>
      </div>
    </div>
  </main>
  <!-- partial -->
  <script src='/static/js/jquery.js'></script>
  <script src="/static/js/script.js"></script>

</body>

</html>