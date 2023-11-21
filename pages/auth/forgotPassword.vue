<template>
    <div class="body flex justify-center">
      <div class="bg-white opacity-16 py-2 px-24 flex flex-col rounded-lg">
          <div class="w-24 h-24 mb-2 mx-24">
              <img class="" src="../../assets/logo.png" alt="">
          </div>  
          <div class="mt-2 mb-12">
            <h1 class="font-bold text-lg">Verify and complete password Reset</h1>
          </div> 
          <form action="#" class="flex flex-col" @submit.prevent="handleSubmit()">
            <input type="text" v-model="membershipNumber" placeholder="Membership number" class="mt-2 px-14 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
            <p v-if="this.errors.membershipNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipNumber}}</p>
            <input type="text" v-model="phoneNumber" placeholder="+263-xxx-xxx-xxx" class="mt-2 px-14 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
            <p v-if="this.errors.phoneNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.phoneNumber}}</p>
            <Button class="text-white bg-blue-800 hover:bg-red-600 text-center font-lg rounded-md mt-6 py-3" >Finish</Button>
            <p class="text-center italics text-gray-900 text-sm font-sm my-6">Already have an account <NuxtLink class="text-blue-800 cursor-pointer" to="/auth/login">Login</NuxtLink></p>
              
          </form>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios'
  export default {
    data(){
           return{
             membershipNumber: "",
             phoneNumber: "",          
             errors: {}
           }
       },
       computed: {
      formData() {
        return this.$store.state.formData;
      }
    },
       methods:{
           async handleSubmit(){
               this.errors = {};
               if(!this.membershipNumber){
                   this.errors.membershipNumber = "First name is required";
               }
               if(!this.phoneNumber){
                   this.errors.phoneNumber = "Last name is required";
               }         
               if (Object.keys(this.errors).length === 0) {
           // make API call or submit form data here
           try{
           await axios.post('https://chitma.hushsoft.co.zw/api/otp/sendOTP',{
              'membershipNumber': this.membershipNumber,
              'phoneNumber': this.phoneNumber
           },{
               headers: {'Content-Type': 'application/json'},
               credentials: 'include'
             }).then((response) =>{
             const data = response.data;
             alert("Check your phone SMS.")
             this.response = data;
             console.log(response);
             this.$router.push('/auth/validateOTP')
           })
   
   }catch(err){
   console.log("Error:",err)
   this.errors.failed = "Sorry, an error occured!";
   this.errors.ERR = err;
   }
         }
           }
       }
  }
  </script>
  
  <style>
  .body {
      background: url("@/assets/banner.jpg");
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