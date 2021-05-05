import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import 'bulma/css/bulma.css'
import Vuelidate from 'vuelidate'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

Vue.config.productionTip = false
Vue.use(Vuelidate)
library.add(fas)
Vue.component('icon', FontAwesomeIcon)

new Vue({
  router,  // add router here
  render: h => h(App),
}).$mount('#app')