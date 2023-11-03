<template>
   <NuxtLayout name="finance-layout">
        <div class="flex px-10 py-1 bg-blue-900">    
        <div class="flex flex-rows w-full justify-between">
            <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Finance Categories</h1>
            </div>
            <!-- Right content -->
            <div class="relative my-1 z-10">
            <button
            @click="isOpen = !isOpen"
            v-if="!loading"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
            >
            {{this.person }}
            
            <svg
                class="-mr-1 ml-2 h-5 w-5"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
            >
                <path
                fill-rule="evenodd"
                d="M6 8l4 4 4-4H6z"
                clip-rule="evenodd"
                ></path>
            </svg>
            </button>
            <div
            v-if="isOpen"
            class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
            role="menu"
            aria-orientation="vertical"
            aria-labelledby="options-menu"
            >
            <div class="py-1 px-2" role="none">
                <!-- Dropdown options -->
                <NuxtLink class=" text-black flex flex-cols text-md font-lg cursor-pointer my-3 gap-2" to=".././settings">
                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 24 24"> <g> <path fill="none" d="M0 0h24v24H0z"/> <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2a9.985 9.985 0 0 1 8 4h-2.71a8 8 0 1 0 .001 12h2.71A9.985 9.985 0 0 1 12 22zm7-6v-3h-8v-2h8V8l5 4-5 4z"/> </g> </svg>
                Logout
                </NuxtLink>
            </div>
            </div>
        </div>
            
        </div>
        </div> 
        <div class="flex justify-between px-5">
            <NuxtLink to="/finance/financeDescription"> 
            Finance Description
            </NuxtLink>
            <NuxtLink to="/finance/financeDescriptionWithTargets"> 
            Finance Description with Targets
            </NuxtLink>
        </div>
       
    <slot/>  
 
  </NuxtLayout>
</template>

<script>
  import axios from 'axios'
  import { encryptData, decryptData } from '@/encryption';
import 'axios' 
    export default {
        data(){
            return{
                isOpen: false,
                loading: true,
                error: null,
                adminInfo: null,
                person: null,
                user: null,

            }
        },
        methods:{
            async getAdminInfo(){
      this.loading = true;
      const mN = localStorage.getItem('mN');
      const mbnD = decryptData(mN);
      console.log("Munhu uyu",mbnD)
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${mbnD}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.adminInfo = res.data
        this.user = this.adminInfo
        this.person = this.user.firstname
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
        },
        mounted(){
            this.getAdminInfo()
        }
    }
</script>

<style>
.router-link-exact-active{
    font-weight: bold;
}
</style>