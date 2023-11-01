<template>
    <div class="body flex justify-center">
      <div class="bg-white opacity-16 py-2 px-24 flex flex-col rounded-lg">
          <div class="w-24 h-24 mb-2 mx-24">
              <img class="" src="../assets/logo.png" alt="">
          </div>  
          <div class="mt-2 mb-12">
            <h1 class="font-bold text-lg">Validate your One Time Password (OTP)</h1>
          </div> 
          <form action="#" class="flex flex-col pb-12" @submit.prevent="handleSubmit()">
            <input type="text" v-model="membershipNumber" placeholder="Membership number" class="mt-2 px-14 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
            <p v-if="this.errors.membershipNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipNumber}}</p>
            <input type="text" v-model="otp" placeholder="Enter OTP" class="mt-2 px-14 py-3 border-2 border-red-600 hover:border-2 hover:border-blue-800 text-black rounded-md placeholder-black">
            <p v-if="this.errors.otp" class="text-sm text-red-600 text-left mb-2">*{{this.errors.otp}}</p>
            <Button class="text-white bg-blue-800 hover:bg-red-600 text-center font-lg rounded-md mt-6 py-3" >Finish</Button>              
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
             otp: "",          
             errors: {}
           }
       },
       methods:{
           async handleSubmit(){
               this.errors = {};
               if(!this.membershipNumber){
                   this.errors.membershipNumber = "Membership Number is required";
               }
               if(!this.otp){
                   this.errors.otp = "OTP is required";
               }         
               if (Object.keys(this.errors).length === 0) {
           // make API call or submit form data here
           try{
            const membershipNumber = this.membershipNumber;
            const otp = this.otp
           await axios.post(`https://chitma.hushsoft.co.zw/api/otp/validateOTP/${membershipNumber}/${otp}`,{
           },{
               headers: {'Content-Type': 'application/json'},
               credentials: 'include'
             }).then((response) =>{
             const data = response.data;
             this.response = data;
             if(this.response == true){
                localStorage.membershipNumber = this.membershipNumber;
                alert("OTP is valid. Proceed to password reset.")
                this.$router.push('./resetPassword')
             }
             else{
                alert("OTP is invalid. Try again later.")
                this.$router.push('./login')
             }
            
             console.log(response);
           })
   
   }catch(err){
   console.log("Error:",err)
   this.errors.failed = "Sorry, an error occured!";
   this.errors.ERR = err;
   }
           console.log("Form submitted successfully");
         }
           }
       }
  }
  </script>
  
  <style>
  .body {
      background: url("../assets/banner.jpg");
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