<template>
    <div class="w-full mt-5">
          <h1 class="text-2xl font-semibold tracking-wider text-gray-800 capitalize dark:text-white">
              Update your account.
          </h1>

          <form class="grid grid-cols-1 gap-4 mt-8 md:grid-cols-2">
              <div>
                  <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">First Name</label>
                  <input type="text" v-model="profile.firstname" placeholder="First Name" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" />
                  <p v-if="this.errors.firstname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.firstname}}</p>
              </div>
              <div>
                  <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">Last Name</label>
                  <input type="text" v-model="profile.lastname"  placeholder="Enter last name" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" />
                  <p v-if="this.errors.lastname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.lastname}}</p>
              </div>
              <div>
                  <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">Date Of Birth</label>
                  <input type="date" v-model="profile.dateOfBirth" placeholder="Select date of birth" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" />
                  <p v-if="this.errors.dateOfBirth" class="text-sm text-red-600 text-left mb-2">*{{this.errors.dateOfBirth}}</p>
              </div>
              <div>
                  <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">Gender</label>
                  <!-- <input type="text"  placeholder="Enter your gender" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" /> -->
                  <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="gender" v-model="profile.gender" >
                              <option value="" disabled>Select local</option>
                              <option value="Male">Male</option>
                              <option value="Female">Female</option>
                            </select>
                            <p v-if="this.errors.gender" class="text-sm text-red-600 text-left mb-2">*{{this.errors.gender}}</p>
              </div>
              <div>
                  <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">Password</label>
                  <input type="password" v-model="password"  placeholder="Enter new password" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" />
                  <p v-if="this.errors.password" class="text-sm text-red-600 text-left mb-2">*{{this.errors.password}}</p>
              </div>
              <div>
                <label class="block mb-2 text-sm text-gray-600 dark:text-gray-200">Confirm Password</label>
                <input type="password" v-model="profile.cpassword"  placeholder="Confirm your new password" class="block w-full px-5 py-3 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-lg dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40" />
                <p v-if="this.errors.cpassword" class="text-sm text-red-600 text-left mb-2">*{{this.errors.cpassword}}</p>
              </div>
          </form>
          
          <div class="mt-6">
            <button type="button" @click="updateAdminHandler" class="w-full px-6 py-2.5 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-green-900 rounded-lg hover:bg-gray-700 focus:outline-none focus:ring focus:ring-gray-300 focus:ring-opacity-50">
                Update Profile
            </button>
        </div>  
      </div>
</template>
<script>
import axios from 'axios'
export default {
  data() {
    return {
        user:[],
        errors: {},
        profile:[]
    }
  },
  methods:{
    async fetchUser(){
      
      this.loading = true;
      const URL = "https://chitma.hushsoft.co.zw/api/v1/auth/getUserByMembershipNumber/" + localStorage.membershipNumber;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.profile = res.data;
        console.log(this.user);
        console.log(typeof(this.user))
        console.log("Fetching  user Data Completed...");
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true

      }).finally(() => this.loading = false);
    },
    async updateAdminHandler(){
      this.errors = {};
             if(!this.profile.firstname){
                 this.errors.firstname = "First name is required";
             }
             if(!this.profile.lastname){
                 this.errors.lastname = "Last name is required";
             }
             if(!this.profile.dateOfBirth){
                 this.errors.dateOfBirth = "Date Of Birth is required";
             }
             if(!this.profile.gender){
                 this.errors.gender = "Gender is required";
             }
             if(!this.profile.password){
                 this.errors.password = "Enter your password";
             } 
             if(!(this.password === this.profile.cpassword)){
                 this.errors.cpassword = "Passwords do not match";
             }
             if(!this.profile.cpassword){
                 this.errors.cpassword = "Re-enter password";
             }
           
            if (Object.keys(this.errors).length === 0) {
        // make API call or submit form data here
        try{
        await axios.put('https://chitma.hushsoft.co.zw/api/v1/auth/updateAdminByMembershipNumber/' + localStorage.membershipNumber,{
          'firstname': this.profile.firstname,
          'lastname': this.profile.lastname,
          'dateOfBirth': this.profile.dateOfBirth,
          'gender': this.profile.gender,
          'password': this.password,
          'local': localStorage.local
        },{
            headers: {'Content-Type': 'application/json'},
            credentials: 'include'
          }).then((response) =>{
          const data = response.data;
          alert("Admin updated successfully.")
          this.response = data;
          console.log(response);
        })
        }catch(err){
        console.log("Error:",err)
        this.errors.failed = "Sorry, an error occured!";
        this.errors.ERR = err;
        }
        console.log("Form submitted successfully");
      }
    },
    },
    mounted(){
      this.fetchUser()
    }
};
</script>