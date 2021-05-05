<template>
  <div id="app">
    <nav class="navbar is-info" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item">
      <img src="https://cdn.pixabay.com/photo/2018/08/19/03/33/magnifying-glass-3615985_960_720.png">
    </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>
  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <a class="navbar-item" > 
        <router-link to="/" class="is-back">
        Home
         </router-link>
      </a>
    </div>
    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-warning">
            <router-link to="/signup">
            <strong>Sign up</strong>
            </router-link>
          </a>
          
          <a class="button is-success">
            <router-link to="/login" >
            <strong>Log in</strong> 
            </router-link>
          </a>
        </div>
      </div>
    </div>
  </div>
</nav>
    <router-view :key="$route.fullPath" />
  </div>
</template>

<script>
// import axios from "axios";

export default {
    data() {
      return {
         login:false
      }
    },
//     created() {
//     axios.get("http://localhost:3000/home")
//         .then((response) => {
//           this.blogs = response.data;
//           console.log(this.blogs)
//         })
//         .catch((err) => {
//           console.log(err);
//         });
// }
  }
</script>