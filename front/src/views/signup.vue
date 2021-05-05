<template>
  <div class="container is-widescreen">
    <div class="field">
      <div v-if="!image">
        <div class="field">
          <figure class="image mt-6">
            <img
              style="width: 360px"
              src="https://bulma.io/images/placeholders/256x256.png"
            />
          </figure>
        </div>
      </div>
      <div v-if="image">
        <div class="field" v-for="image1 in image" :key="image1.id">
          <figure class="image mt-6 pt-3 pb-5 mb-6">
            <img style="width: 360px" :src="showSelected(image1)" />
          </figure>
        </div>
      </div>
    </div>
    <br />
    <label class="label mt-5">Pictue for profile</label>
    <div class="file">
      <label class="file-label">
        <input
          class="file-input"
          type="file"
          accept="image/png, image/jpeg, image/webp"
          @change="imgSelectedPic"
        />
        <span class="file-cta">
          <span class="file-icon">
            <i class="fas fa-upload"></i>
          </span>
          <span class="file-label">
            Choose a file…
          </span>
        </span>
      </label>
    </div>
    <!-- --------------------------------First Name---------------------------------------- -->
    <div class="field">
      <label class="label">first Name</label>
      <div class="control">
        <input
          class="input"
          v-model="$v.first_Name.$model"
          :class="{ 'is-danger': $v.first_Name.$error }"
          type="text"
          placeholder="Your fisrt name"
        />
      </div>
      <template v-if="$v.first_Name.$error">
        <p class="help is-danger" v-if="!$v.first_Name.required">
          This field is required
        </p>
      </template>
    </div>
    <!-- --------------------------------first Name---------------------------------------- -->
    <!-- --------------------------------Last Name---------------------------------------- -->
    <div class="field">
      <label class="label">Last Name</label>
      <div class="control">
        <input
          class="input"
          v-model="$v.last_Name.$model"
          :class="{ 'is-danger': $v.last_Name.$error }"
          type="text"
          placeholder="Your last name"
        />
      </div>
      <template v-if="$v.last_Name.$error">
        <p class="help is-danger" v-if="!$v.last_Name.required">
          This field is required
        </p>
      </template>
    </div>
    <!-- --------------------------------Last Name---------------------------------------- -->
    <!-- --------------------------------USERNAME---------------------------------------- -->
    <div class="field">
      <label class="label">Username</label>
      <div class="control has-icons-left has-icons-right">
        <input
          class="input"
          v-model="$v.username.$model"
          :class="{ 'is-danger': $v.username.$error }"
          type="text"
          placeholder="Text input"
          value=""
        />
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
        <span class="icon is-small is-right">
          <i class="fas fa-check"></i>
        </span>
        <template v-if="$v.username.$error">
          <p class="help is-danger" v-if="!$v.username.required">
            This field is required
          </p>
          <p class="help is-danger" v-if="!$v.username.minLength">
            Must be at least 5 characters
          </p>
          <p class="help is-danger" v-if="!$v.username.maxLength">
            Must be at least 20 characters
          </p>
        </template>
      </div>
    </div>
    <!-- --------------------------------USERNAME---------------------------------------- -->
    <!-- --------------------------------password---------------------------------------- -->

    <div class="field">
      <label class="label">password</label>
      <div class="control has-icons-left has-icons-right">
        <input
          class="input"
          v-model="$v.password.$model"
          :class="{ 'is-danger': $v.password.$error }"
          type="password"
          placeholder="password"
          value=""
        />
        <span class="icon is-small is-left">
          <i class="fas fa-key"></i>
        </span>
        <span class="icon is-small is-right">
          <i class="fas fa-check"></i>
        </span>
        <template v-if="$v.password.$error">
          <p class="help is-danger" v-if="!$v.password.required">
            This field is required
          </p>
          <p class="help is-danger" v-if="!$v.password.minLength">
            Must be at least 8 length
          </p>
          <p class="help is-danger" v-if="!$v.password.complexPassword">
            your password to easy to guess
          </p>
        </template>
      </div>
      <!-- --------------------------------password---------------------------------------- -->
      <!-- --------------------------------Confirm password---------------------------------------- -->
    </div>
    <div class="field">
      <label class="label">Confirm password</label>
      <div class="control has-icons-left has-icons-right">
        <input
          class="input"
          type="password"
          placeholder="Confirm password"
          v-model="$v.confirm_password.$model"
          :class="{ 'is-danger': $v.confirm_password.$error }"
        />
        <span class="icon is-small is-left">
          <i class="fas fa-key"></i>
        </span>
        <span class="icon is-small is-right">
          <i class="fas fa-check"></i>
        </span>
        <template v-if="$v.confirm_password.$error">
          <p class="help is-danger" v-if="!$v.confirm_password.sameAs">
            Your pass is not match
          </p>
          <p class="help is-danger" v-if="!$v.confirm_password.required">
            this field is required
          </p>
        </template>
      </div>
    </div>
    <!-- --------------------------------Confirm password---------------------------------------- -->
    <!-- --------------------------------Email ---------------------------------------- -->
    <div class="field">
      <label class="label">Email</label>
      <div class="control has-icons-left has-icons-right">
        <input
          class="input"
          v-model="$v.email.$model"
          :class="{ 'is-danger': $v.email.$error }"
          type="email"
          placeholder="Email input"
        />
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
        <span class="icon is-small is-right">
          <i class="fas fa-exclamation-triangle"></i>
        </span>
        <template v-if="$v.email.$error">
          <p class="help is-danger" v-if="!$v.email.email">
            Invalid email
          </p>
          <p class="help is-danger" v-if="!$v.email.required">
            This field is required
          </p>
        </template>
      </div>
    </div>
    <!-- --------------------------------Email ---------------------------------------- -->
    <!-- --------------------------------Phone ---------------------------------------- -->
    <div class="field">
      <label class="label">Phone number</label>
      <div class="control has-icons-left has-icons-right">
        <input
          class="input"
          type="text"
          v-model="$v.phone_number.$model"
          :class="{ 'is-danger': $v.phone_number.$error }"
          placeholder="ex:0123456789"
        />
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
        <span class="icon is-small is-right">
          <i class="fas fa-exclamation-triangle"></i>
        </span>
        <template v-if="$v.phone_number.$error">
          <p class="help is-danger" v-if="!$v.phone_number.required">
            This field is required
          </p>
          <p class="help is-danger" v-if="!$v.phone_number.phone_number">
            Invalid Phone number
          </p>
        </template>
      </div>
    </div>
    <!----------------------------------Phone ---------------------------------------- -->
    <!----------------------------------dob ---------------------------------------- -->
    <div class="field">
      <label class="label">Date of birth</label>
      <div class="control">
        <input
          class="date"
          type="date"
          name="date_of_birth"
          v-model="$v.dob.$model"
          :class="{ 'is-danger': $v.dob.$error }"
        />
      </div>
      <template v-if="$v.dob.$error">
        <p class="help is-danger" v-if="!$v.dob.$required">
          This field is required
        </p>

        <p class="help is-danger" v-if="!$v.dob.$checkdate">
          Invalid date of birth
        </p>
      </template>
    </div>
    <!----------------------------------dob ---------------------------------------- -->
    <div class="field">
      <label class="label">occupation</label>
      <option v-for="job in jobs" :key="job.id" value="">
        {{ job.job_name }}
      </option>
    </div>
    <!----------------------------------Resume ---------------------------------------- -->
    <div class="field">
      <label class="label">Resume</label>
      <div class="control">
        <textarea
          class="textarea"
          v-model="$v.Resume.$model"
          :class="{ 'is-danger': $v.Resume.$error }"
          placeholder="บอกความสามารถของตน"
        >
        </textarea>
      </div>
      <template v-if="$v.Resume.$error">
        <p class="help is-danger" v-if="!$v.Resume.required">
          This field is required
        </p>
        <p class="help is-danger" v-if="!$v.Resume.minLength">
          Too short
        </p>
      </template>
    </div>
    <!----------------------------------Resume ---------------------------------------- -->
    <!---------------------------------- text_info---------------------------------------- -->
    <div class="field">
      <div class="control">
        <label class="label">experience for past Jobs</label>
        <div class="control">
          <div class="select is-info">
            <select v-model="text_info">
              <!-- ประสบการณ์ การฝึกงาน -->
              <option value="-">โปรดเลือก</option>
              <option value="ไม่มี">no experience</option>
              <option value=" 6เดือน">half year</option>
              <option value="ทำมาแล้ว 1 ปี">1</option>
              <option value="ทำมาแล้ว 2 ปี">2</option>
              <option value="ทำมาแล้ว 3 ปี">3</option>
              <option value="ทำมาแล้ว 4 ปี">4</option>
              <option value="ทำมาแล้ว 5 ปี">5</option>
              <option value="ทำมาแล้ว 6 ปี">6</option>
              <option value="ทำมาแล้ว 7 ปี">7</option>
              <option value="ทำมาแล้ว 8 ปี">8</option>
              <option value="ทำมาแล้ว 9 ปี">9</option>
              <option value="ทำมาแล้ว 10 ปี">10</option>
            </select>
          </div>
        </div>
      </div>
    </div>
    <!---------------------------------- text_info---------------------------------------- -->
    <div class="field is-grouped">
      <div class="control">
        <button @click="Submit" class="button is-link">Submit</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

import {
  required,
  email,
  helpers,
  minLength,
  maxLength,
  sameAs,
} from "vuelidate/lib/validators";

function phone_number(value) {
  return !helpers.req(value) || !!value.match(/0[0-9]{9}/);
}

function complexPassword(value) {
  console.log("value :" + value);
  if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
    return false;
  }
  return true;
}

function checkdate(value1) {
  let thisdate = new Date();
  console.log("value :" + value1);
  if (Date.parse(value1) > Date.parse(thisdate)) {
    return false;
  } else {
    return true;
  }
}

export default {
  data() {
    return {
      first_Name: "", //ชื่อ
      last_Name: "", //นามสุกล
      username: "",
      password: "",
      confirm_password: "",
      email: "",
      Resume: "", //ใส่เป็น text
      text_info: "", //ทำมานานแค่ไหน
      image: null, // ที่เก็บรูป
      hasimage: true,
      phone_number: "",
      dob: "",
    };
  },
  methods: {
    imgSelectedPic(event) {
      console.log(event);
      this.image = event.target.files;
      console.log(this.image);
    },
    showSelected(image1) {
      // Show รูปที่ได้มา
      return URL.createObjectURL(image1);
    },
    Submit() {
      // Validate all fields
      this.$v.$touch();

      if (!this.$v.$invalid) {
        let dataforjob = {
          // will send to table jobseerker
          f_name: this.first_Name,
          l_name: this.last_Name,
          username: this.username,
          password: this.password,
          email: this.email,
        };
        axios
          .post("http://localhost:3000/user/signup" , dataforjob)
          .then((res)=>{
          alert('Done');
          res.send('hello from simple server :)')
          })
          .catch((err) =>{
            alert(err.response.dataforjob.details.message)
          })
             
          
      }
    },
    getjob() {
      axios
        .get("http://localhost:3000/home/1")
        .then((response) => {
          this.jobs = response.data;
          console.log(this.jobs);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  validations: {
    email: {
      required: required,
      email: email,
    },
    phone_number: {
      required: required,
      phone_number: phone_number,
    },
    password: {
      required: required,
      minLength: minLength(8),
      complex: complexPassword,
    },
    confirm_password: {
      required: required,
      sameAs: sameAs("password"),
    },
    username: {
      required: required,
      minLength: minLength(5),
      maxLength: maxLength(20),
    },
    first_Name: {
      required: required,
    },
    last_Name: {
      required: required,
    },
    Resume: {
      required: required,
      minLength: minLength(20),
    },
    dob: {
      required: required,
      checkdate: checkdate,
    },
    text_info: {
      required: required,
    },
  },
};
</script>
