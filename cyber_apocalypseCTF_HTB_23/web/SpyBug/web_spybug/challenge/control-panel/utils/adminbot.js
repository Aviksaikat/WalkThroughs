require("dotenv").config();

const puppeteer = require("puppeteer");

const browserOptions = {
  headless: true,
  executablePath: "/usr/bin/chromium-browser",
  args: [
    "--no-sandbox",
    "--disable-background-networking",
    "--disable-default-apps",
    "--disable-extensions",
    "--disable-gpu",
    "--disable-sync",
    "--disable-translate",
    "--hide-scrollbars",
    "--metrics-recording-only",
    "--mute-audio",
    "--no-first-run",
    "--safebrowsing-disable-auto-update",
    "--js-flags=--noexpose_wasm,--jitless",
  ],
};

exports.visitPanel = async () => {
  try {
    const browser = await puppeteer.launch(browserOptions);
    let context = await browser.createIncognitoBrowserContext();
    let page = await context.newPage();

    await page.goto("http://0.0.0.0:" + process.env.API_PORT, {
      waitUntil: "networkidle2",
      timeout: 5000,
    });

    await page.type("#username", "admin");
    await page.type("#password", process.env.ADMIN_SECRET);
    await page.click("#loginButton");

    await page.waitForTimeout(5000);
    await browser.close();
  } catch (e) {
    console.log(e);
  }
};
