import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Home.vue') // set home as path '/'
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/login.vue') // set login as path '/'
  },
  {
    path: '/signup',
    name: 'signup',
    component: () => import('../views/signup.vue') // set signup as path '/'
  },
  {
    path: '/userdetil',
    name: 'userdetil',
    component: () => import('../views/userdetil.vue') 
  },
  {
    path: '/company',
    name: 'company',
    component: () => import('../views/company.vue') 
  }, 
  {
    path: '/postjob/:id',
    name: 'postjobs',
    component: () => import('../views/postjob/Detailjob.vue') 
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router