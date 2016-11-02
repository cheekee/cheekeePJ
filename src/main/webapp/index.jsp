<html>
<header>
    <style>
        html, body {
            height:100%;
            margin: 0; 
            padding: 0;
        }
        body {
            min-height: 100%;
position: relative;
        }
        nav {
            background-color: #f8f8f8;
            top: 0;
            position: fixed;
            width: 100%;
        }
        nav ul {
            margin: 0 0 0 0 ;
        }
        nav ul li {
            display:inline;
            float:right;
            padding: 0 10px;
            line-height: 50px;
            vertical-align: middle;
            text-align: center;
        }
        nav ul li a {
            text-decoration:none;
            display: block;
            font-size: 12px;
            font-weight: bold;
        }
        #section-top {
            width: 100%;
            height: 250px;
        }
        #section-main {
            width: 90%;
            height: 650px;
            margin:0 auto;
        }
        .section-main-container {
            float: left;
            width: 33%;
            height: 600px;
        }
        footer {
            clear: both;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 50px;
            background-color: #f8f8f8;
        }
    </style>
</header>
<body>
    <nav>  
        <!-- Navigation -->
        <ul>  
            <li><a href="#">Geustbook</a></li>  
            <li><a href="#">Lab</a></li>  
            <li><a href="#">Idea</a></li>  
            <li><a href="#">Blog</a></li>  
        </ul>  
    </nav>  
    <section>  
        <!-- Introduction -->
        <div id="section-top">

        </div>
        intro image + intro
    </section>
    <section>
        <!-- Main content area -->
        <div id="section-main">
            <div class="section-main-container">
                <div class="">
                    BlogImage
                </div>
                <div>
                    RecentBlog
                </div>
            </div>
            <div class="section-main-container">
                <div>
                    IdeaImage
                </div>
                <div>
                    RecentIdea
                </div>
            </div>
            <div class="section-main-container">
                <div>
                    LabImage
                </div>
                <div>
                    RecentLab
                </div>
            </div>
        </div>
    </section>
    <footer>  
        <!-- Footer -->
        footer  
    </footer>  
</body>
</html>
