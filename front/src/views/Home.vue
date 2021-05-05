<template>
  <div class="container is-widescreen">
    <!-- other code -->
    <section class="hero">
      <div class="hero-body">
        <p class="title">WANTED JOB!</p>
        <div class="columns">
          <div class="column is-half">
            <input
              class="input"
              type="text"
              v-model="search"
              placeholder="Search jobs"
            />
          </div>
          <div class="column is-half">
            <!-- <button @click="getBlogs" class="button">Search</button> -->
            <!-- <button @click="filteredPostjob" class="button">Search</button> -->
          </div>
        </div>
        <div class="columns">
             <div class="column">
               <div class="select">
                  <select v-model="career">
                    <option value="--">โปรดเลือกอาชีพ</option>
                    <option v-for="job in jobs" :key="job.id" value="">
                      {{ job.job_name }}
                    </option>
                  </select>
                  <!-- <button @click="filteredjob">search</button> -->
              </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section" id="app">
      <div class="content">
        <div class="columns is-multiline">
          <div class="column is-3" v-for="post in filteredPostjob" :key="post.id">
            <div class="card">
              <div class="card-image">
                <figure class="image is-4by3">
                  <img :src="post.img" alt="Placeholder image" />
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <p class="title is-4">
                      <span style="color: red"> Wanted !!</span> <br />
                      {{ post.job_name }}
                    </p>
                  </div>
                </div>
                <div class="content">
                  {{ post.req_ability }}
                  <br />
                  <p>{{ post.req_date }}</p>
                </div>
              </div>
              <footer class="card-footer">
                <router-link
                  class="card-footer-item"
                  :to="`/postjob/${post.req_id}`"
                  >Read more...</router-link
                >
              </footer>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";


export default {
  data() {
    return {
      post_job: [], // jobs
      search: '',
      jobs: [],
      career: '',
    };
  },
  created() {
    axios
      .get("http://localhost:3000/home")
      .then((response) => {
        for (let date of response.data) {
          date.req_date = date.req_date.substring(0,date.req_date.indexOf("T"));
        }
        this.post_job = response.data;
        console.log(this.post_job);
      })
      .catch((err) => {
        console.log(err);
      });
    axios
      .get("http://localhost:3000/home/1")
      .then((response) => {
        this.jobs = response.data;
        // console.log(this.jobs);
      })
      .catch((err) => {
        console.log(err);
      });
  },
  computed: {
    // หางานในช่อง search
    filteredPostjob: function () {
      return this.post_job.filter((post) => {
        return  post.job_name.match(this.search);
      });
    },

    filteredjob: function () {
      return this.post_job.filter((job) => {
        return  job.job_name.match(this.career);
      });
    },
  },
};
      // console.log(this.career)
</script>


<style scoped>
</style>