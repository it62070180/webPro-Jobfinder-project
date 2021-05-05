<template>
    <div class="container is-widescreen">
        <section class="hero">
            <div class="hero-body">
                <p class="title">
                Person
                </p>
                <div class="columns">
                <div class="column is-half">
                    <input class="input" type="text" v-model="search" placeholder="Search Person">
                </div>
                <div class="column is-half">
                    <!-- <button @click="getBlogs" class="button">Search</button> -->
                    <button class="button">Search</button>
                </div>
                </div>
            </div>
    </section>
        <div class="content">
            <div class="columns is-multiline">
            <div class="column is-3">
                <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">  
                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                        <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">PETE</p>
                        <p class="subtitle is-6">@PETE</p>
                    </div>
                    </div>

                    <div class="content">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                    <a href="#">#css</a> <a href="#">#responsive</a>
                    <br>
                    <time datetime="2016-1-1">11:09 PM - 16 Jan 2016</time>
                    </div>
                    </div>
                </div>
            </div>
            <div class="column is-3">
                <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">  
                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                        <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">BIG</p>
                        <p class="subtitle is-6">@BIG</p>
                    </div>
                    </div>

                    <div class="content">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                    <a href="#">#css</a> <a href="#">#responsive</a>
                    <br>
                    <time datetime="2016-1-1">11:09 PM - 14 Jan 2016</time>
                    </div>
                    </div>
                </div>
            </div>
            <div class="column is-3">
                <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">  
                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                        <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">Arpo</p>
                        <p class="subtitle is-6">@Arpo</p>
                    </div>
                    </div>

                    <div class="content">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                    <a href="#">#css</a> <a href="#">#responsive</a>
                    <br>
                    <time datetime="2016-1-1">11:09 PM - 5 Jan 2016</time>
                    </div>
                    </div>
                </div>
                
            </div>
            <div class="column is-3">
                <div class="card">
                <div class="card-image">
                    <figure class="image is-4by3">  
                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                        <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">KON</p>
                        <p class="subtitle is-6">@KON</p>
                    </div>
                    </div>

                    <div class="content">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                    <a href="#">#css</a> <a href="#">#responsive</a>
                    <br>
                    <time datetime="2016-1-1">11:09 PM - 11 Jan 2016</time>
                    </div>
                    </div>
                </div>
                
            </div>
            </div>
        </div>
    </div>
</template>