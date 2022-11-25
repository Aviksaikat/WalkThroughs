<html>

<head>
    <meta charset="UTF-8">
    <title>Pumpkin Facts</title>
    <link rel="stylesheet" href="static/css/index.css" />
</head>

<body>
    <div class="page">
        <header class="type-1 perfect letter">
            <h1 class="section-title">
                <span class="minor">not so</span>
                <span class="letter-ss20">Spooky</span>
            </h1>
            <h2 class="section-subtitle letter-ss20">
                Pumpkin Facts
            </h2>

            <div class="btn-wrapper">
                <button id="spookybtn" class="btn" onclick="loadfacts('spooky')" >
                    Spooky Facts
                </button>

                <button id="notspookybtn" class="btn" onclick="loadfacts('not_spooky')">
                    Not So Spooky Facts
                </button>

                <button id="secretsbtn" class="btn" onclick="loadfacts('secrets')">
                    Secret Facts
                </button>
            </div>
        </header>

        <main class="grid" id="facts-container">
            
        </main>

        <blockquote>
            <p>You don't believe the story of the Great Pumpkin? I thought little girls always believed everything that was told to them. I thought little girls were innocent and trusting.</p>
            <footer>Linus</footer>

            <p>Welcome to the 20th Century!</p>
            <footer>Sally</footer>
            <cite>It's The Great Pumpkin, Charlie
                Brown</cite>
        </blockquote>

    </div>
    <script src="/static/js/index.js"></script>
</body>

</html>