<template>
    <div>
        <div class="bg-gray-100  shadow-sm rounded-sm mt-5">
                    <div class="flex items-center space-x-2 font-semibold px-5 text-2xl text-black leading-8">
                        <span clas="text-green-500">
                            <svg class="h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </span>
                        <span class="tracking-wide m-10 ">About</span>
                    </div>
                    <div class="text-black py-14">
                        <div class="grid md:grid-cols-2 text-sm">
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Membership Number</div>
                                <div class="px-4 py-2">{{user.membershipNumber}}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">First Name</div>
                                <div class="px-4 py-2">{{ user.firstname }}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Last Name</div>
                                <div class="px-4 py-2">{{user.lastname}}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Gender</div>
                                <div class="px-4 py-2">{{user.gender}}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Date of Birth</div>
                                <div class="px-4 py-2">{{ user.dateOfBirth }}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Contact No.</div>
                                <div class="px-4 py-2">+263 78 615 098</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Local</div>
                                <!-- <div class="px-4 py-2">{{user.local.name}}</div> -->
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Section</div>
                                <!-- <div class="px-4 py-2">{{ user.section.name }}</div> -->
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Organisation</div>
                                <div class="px-4 py-2">{{ user.organisation }}</div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div class="px-4 py-2 font-semibold">Role</div>
                                <div class="px-4 py-2">{{ user.role }}</div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios'
export default {
  data() {
    return {
        user:[]
    }
  },
  methods:{
    async fetchUser(){
      
      this.loading = true;
      const URL = "https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/" + localStorage.membershipNumber;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.user = res.data;
        console.log(this.user);
        console.log(typeof(this.user))
        console.log("Fetching  user Data Completed...");
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true

      }).finally(() => this.loading = false);
    },
    },
    mounted(){
    this.fetchUser()
    
  }
};
</script>