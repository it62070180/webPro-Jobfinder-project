<template>
  <div class="container is-widescreen">
    <section class="section">
      <div class="container is-widescreen">
        <p class="title"></p>
      </div>
        <figure class="image block" style="margin-top:5%">
          <img
            :src="jobreq[0].img"
            style="width: 500px"
          />
        </figure>
      <div class="content is-medium">
        <h1 class="is-danger"> Wanted {{ jobreq[0].job_name }}</h1>
        <p>
         {{post[0].req_information}} <br> {{post[0].req_ability}}
        </p>
        <h2>คำอธิบายเกี่ยวกับบริษัท</h2>
        <p>
          {{company[0].name}}
        </p>
        <ul> <strong>ก่อตั้งเมื่อ</strong>  <b> {{company[0].founding_data}} </b>
         <br> {{ company[0].company_info}}
        </ul>
        
      </div>
    </section>
  </div>
</template>
<script>
import axios from '@/plugins/axios'

export default {
  data() {
    return {
      post: [],
      company: [],
      work:[],
      jobreq:[],
    };
  },
  mounted() {
    this.getBlogDetail(this.$route.params.id);
    // console.log(this.getBlogDetail)
  },
  methods: {
    getBlogDetail(postid) {
      axios
        .get(`http://localhost:3000/postjob/${postid}`)
        .then((response) => {
          // console.log(response.data.company[0].founding_data)
          
           let date2 = response.data.company[0].founding_data
              // console.log(date2)
              date2 = date2.substring(0,date2.indexOf('T'))
              // console.log('formated ' + date2)


          this.post = response.data.request_job;
          this.company = response.data.company;
          this.company[0].founding_data = date2
          this.work = response.data.request_info;
          this.jobreq = response.data.job;
          // console.log(this.post);
          // console.log(this.company);
          // console.log(this.work);
          // console.log(this.jobreq);
          
          
        })
        .catch((error) => {
          console.log(error)
        });
    },
  },
};
</script>
