<template>
  <NuxtLayout name="admin-layout" class="p-2">
    <div class="w-full rounded-md bg-white shadow-md py-6 px-5">
      <div class="flex justify-between max-md:grid grid-cols-1 ">
        <div>
          <h1 class="font-bold text-3xl text-black">Settings</h1>
          <p class="text-md font-normal">Let's help customize your experience and easy account management.</p>
        </div>
        <div class="flex mr-10 max-md:hidden">
        <!-- <img src="./../../assets/pic-1.jpg" class="rounded-full h-12 w-12" alt=""> -->
        <div class="flex ml-5" v-if="!loading">
          <h1 class="font-bold text-xl text-gray-900">Hello</h1>
          <p class="text-gray-900 font-bold text-xl ml-1" v-if="!loading">{{this.person}}</p>
        </div>
        

      </div>
      </div>
      
    </div>
      <div class="lg:grid lg:grid-cols-2 gap-2 mt-10 md:grid md:grid-cols-1">
        <div class="w-full h-full py-2 px-5 bg-white rounded-md shadow-md">
          <h1 class="text-gray-700 ml-3 font-semibold text-2xl">Personal Information</h1>
          <div class="grid grid-cols-2 px-5">
            <div>
              <h1 class="text-md font-normal text-gray-800 mb-2 mt-5">Name:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-2">Surname:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-2">Date of Birth:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-2">Gender:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-2">Phone Number:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-2">Organisation:</h1>
              <h1 class="text-md font-normal text-gray-800 mb-4">Role:</h1>
            </div>
            <div v-if="!loading">
              <h1 class="text-md font-semibold text-gray-900 mb-2 mt-5">{{ this.adminInfo.firstname }}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-2">{{this.adminInfo.lastname}}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-2">{{this.adminInfo.dateOfBirth}}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-2">{{this.adminInfo.gender}}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-2">{{this.adminInfo.phoneNumber}}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-2">{{this.adminInfo.organisation}}</h1>
              <h1 class="text-md font-semibold text-gray-900 mb-4">{{this.adminInfo.role}}</h1>
            </div>
            
          </div>
        </div>
        <div class="w-full h-full p-2 bg-white rounded-md shadow-md">
          <h1 class="text-gray-700 ml-3 font-semibold text-2xl">Update information</h1>
          <form  @submit.prevent="updateAdminInfo()" class=" grid grid-cols-2 gap-12 rounded px-8 py-6 mb-4">
                             <!-- Name -->
                             <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" v-model="user.firstname"  type="text">
                                <!-- <p v-if="this.errors.firstname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.firstname}}</p> -->
                            </div>  
                            <!-- Surname -->
                            <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Lastname:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" v-model="user.lastname" type="text" >
                                <!-- <p v-if="this.errors.lastname"  class="text-sm text-red-600 text-left mb-2">*{{this.errors.lastname}}</p> -->
                            </div>  
                            <!-- Date of Birth -->
                            <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Date Of Birth:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                type="date" v-model="user.dateOfBirth" >
                                <!-- <p v-if="this.errors.dateOfBirth" class="text-sm text-red-600 text-left mb-2">*{{this.errors.dateOfBirth}}</p> -->
                            </div>
                            <!-- Gender-->
                            <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="status">Gender:</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="status" v-model="user.gender" >
                                <option value="" disabled>Select your gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                              </select>
                              <!-- <p v-if="this.errors.gender" class="text-sm text-red-600 text-left mb-2">*{{this.errors.gender}}</p> -->
                            </div>       
                            <!-- Phone Numbeer -->
                            <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Phone Number:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" type="text" v-model="user.phoneNumber" >
                                <!-- <p v-if="this.errors.phoneNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.phoneNumber}}</p> -->
                            </div> 
                            <!-- Membership Status -->
                            <div class="mb-1">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Membership Status:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" v-model="user.membershipStatus" type="text"  >
                                <!-- <p v-if="this.errors.membershipStatus" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipStatus}}</p> -->
                            </div> 
                            <!-- Submit Button -->
                            <div class="ml-2">
                              <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                              >Submit</button>
                            </div>
            </form> 
        </div>
      </div>
   
  </NuxtLayout>
  
</template>

<script>
import axios from 'axios'
import { encryptData, decryptData } from '@/encryption';
  export default {
    data() {
      return {  
        errors: [],
        adminInfo: [],
        user: '',
        person: '',
        loading: true,
      }
    },
    methods:{
      async getAdminInfo(){
      this.loading = true;
      const id = localStorage.getItem('mN');
      const mNumber = decryptData(id);
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${mNumber}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.adminInfo = res.data
        this.user = this.adminInfo
        this.person = this.adminInfo.firstname
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async updateAdminInfo(){
      this.errors = {};
            
            if (Object.keys(this.errors).length === 0) {
        // make API call or submit form data here
        try{
          const id = localStorage.getItem('mN');
      const mNumber = decryptData(id);
          const pp = localStorage.getItem('pp');
          const local = decryptData(pp);
        await axios.put('https://chitma.hushsoft.co.zw/api/api/v1/auth/updateAdminByMembershipNumber/' + mNumber,{
          'firstname': this.user.firstname,  
          'lastname': this.user.lastname,  
          'gender': this.user.gender,  
          'dateOfBirth': this.user.dateOfBirth,  
          'organisation': this.user.organisation,  
          'membershipStatus': this.user.membershipStatus,
          'phoneNumber': this.user.phoneNumber,  
          'local': local
        },{
            headers: {'Content-Type': 'application/json'},
            credentials: 'include'
          }).then((response) =>{
          const data = response.data;
          alert("Admin updated successfully.")
          reloadNuxtApp()
          this.response = data;
        })
        }catch(err){
        console.log("Error:",err)
        this.errors.failed = "Sorry, an error occured!";
        this.errors.ERR = err;
        }
      }
    },
    },
    computed:{
      formatDate(date) {
      const day = date.getDate().toString().padStart(2, '0');
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const year = date.getFullYear();
      return `${day}/${month}/${year}`;
    }
    },
    mounted(){
      this.getAdminInfo()
    }
    
  }
</script>

<style scoped>

</style>