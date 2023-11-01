<template>
    <div class="body flex justify-center">
      <div class="mt-5 bg-white opacity-16 py-5 px-24 flex flex-col rounded-lg">
          <div  class="w-32 h-32 mb-10 mx-16 mt-4">
              <img  src="../../assets/logo.png" alt="">
          </div>   
          <form action="#" class="flex flex-col " @submit.prevent="$event => handleSubmit()">
              <input type="text" v-model="membershipNumber" placeholder="Enter membership number" class="my-2 px-12 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
              <input type="password" v-model="password" placeholder="Enter your password" class="mt-2 px-14 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
              <!-- <p class="text-right italics text-gray-600 text-sm font-sm cursor- pointer">Forgot password</p> -->
              <NuxtLink class="text-right italics text-gray-600 text-sm font-sm cursor- pointer" to="/auth/forgotPassword">Forgot Password</NuxtLink>
              <Button class="text-white bg-blue-800 hover:bg-red-600 text-center font-lg rounded-md mt-6 mb-12 py-3">Login</Button>
              
              
          </form>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { encryptData, decryptData } from '@/encryption';
  export default {
      data(){
          return{
              membershipNumber: "",
              password: "",
              token: '',
               role: '',
              loading: true,
              errored:false,
              errors: {}
          }
      },
      methods:{
  
          async handleSubmit(){
              this.loading=true;
              this.errors = {};
              if(!this.membershipNumber){
                  this.errors.membershipNumber = "Membership Number required";
              }
              if(!this.password){
                  this.errors.password = "Enter password";
              }
              if (Object.keys(this.errors).length === 0) {
         // Your code for handling the login form submission
         try{
          await axios.post('https://chitma.hushsoft.co.zw/api/api/v1/auth/login',{
          membershipNumber:this.membershipNumber,
          password :this.password
          },{
              headers: {'Content-Type': 'application/json',
              // Authorization : 'Bear' + localStorage.token,
              'Accept' : '*/*',
              // 'Connection' : 'keep-alive',
              'Access-Control-Allow-Origin': '*'
            },
              credentials: 'include',
            }).then((response) =>{
            const data = response.data;
  
            if(response.data == "User Not Found"){
              this.errors.ERR = "Wrong Login details...";
            }else{
              
          
                this.token = data.token
                this.role = data.role
                this.membershipNumber = data.membershipNumber
                this.local = data.local
                const userData = { secureT: this.token, mN: this.membershipNumber, r: this.role, l: this.local };
              // const encryptedUserData = encryptData(userData);
              const tk = encryptData(this.token);
              const mbn = encryptData(this.membershipNumber);
              const rol = encryptData(this.role);
              const loc = encryptData(this.local);
              this.getAdminInfo(this.membershipNumber);
              localStorage.setItem('secT', tk);
              localStorage.setItem('mN', mbn);
              localStorage.setItem('r', rol);
              localStorage.setItem('pp', loc);
                this.success="";
                this.success = "Login Sucessful...";
              if(this.role === "[Admin]"){
                  alert("Welcome To UMC Finance Admin Dashboard.")
                  this.$router.push('/admin/')
              }
              else if(this.role === "[Finance]"){
                  alert("Welcome to UMC Finance Dashboard.")
                  this.$router.push('/finance/')
              }
              else if(this.role === "[Super_Admin]"){
                  alert("Welcome to Super Admin Dashboard.")
                  this.$router.push('/superAdmin/')
              }
              else {
                alert("Login failed")
              }
            }
          }).catch(error => {
          console.log(error)
          this.errored = true
          this.errors.ERR=error
          
        }).finally(() => this.loading = false);
  
  }catch(err){
    this.errors.network = "Error: " + err.message;
    this.errors.ERR = err;
  console.log("Error:",err.message)
  
  }
        }
          },
          async getAdminInfo(userID){
      this.loading = true;
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${userID}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.adminInfo = res.data
        this.user = this.adminInfo
        const username= encryptData(this.user.firstName);
        localStorage.setItem('u', username);
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      }
      
  
  }
  </script>
  
  <style>
  .body {
      background: url("../../assets/banner.jpg");
      background-size: cover;
      background-repeat: none;
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
  </style>