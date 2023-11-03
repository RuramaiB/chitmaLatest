<template>
  <NuxtLayout name="finance-layout">
    <div class="flex px-10 py-1 bg-blue-900">    
        <div class="flex flex-rows w-full justify-between">
          <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Dashboard</h1>
          </div>
          <!-- Right content -->
          <div class="relative my-1 z-10">
          <button
          v-if="!loading"
            @click="isOpen = !isOpen"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            {{ this.person }}
            
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
              <NuxtLink class=" text-black flex flex-cols text-md font-lg cursor-pointer my-3 gap-2" to="/">
                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 24 24"> <g> <path fill="none" d="M0 0h24v24H0z"/> <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2a9.985 9.985 0 0 1 8 4h-2.71a8 8 0 1 0 .001 12h2.71A9.985 9.985 0 0 1 12 22zm7-6v-3h-8v-2h8V8l5 4-5 4z"/> </g> </svg>
                Logout
              </NuxtLink>
            </div>
          </div>
        </div>
          
        </div>
    </div>
    <div class="grid grid-cols-4 justify-between mx-5 w-full">
      <div class="py-6">
        <div class="bg-white w-64 h-32 border rounded-lg">
          <div class="flex flex-col-2 p-4">
            <div class="w-14 h-14 -mt-9 borderd rounded-lg bg-indigo-600 p-3">
              <svg style="color: white" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 576 512"><!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M251.1 207.1C251.1 196.1 260.1 187.1 271.1 187.1H287.1C299 187.1 308 196.1 308 207.1V275.1H312C323 275.1 332 284.1 332 295.1C332 307 323 315.1 312 315.1H263.1C252.1 315.1 243.1 307 243.1 295.1C243.1 284.1 252.1 275.1 263.1 275.1H267.1V227.6C258.9 225.7 251.1 217.7 251.1 207.1zM48.66 79.13C128.4 100.9 208.2 80.59 288 60.25C375 38.08 462 15.9 549 48.38C565.9 54.69 576 71.62 576 89.66V399.5C576 423.4 550.4 439.2 527.3 432.9C447.6 411.1 367.8 431.4 288 451.7C200.1 473.9 113.1 496.1 26.97 463.6C10.06 457.3 0 440.4 0 422.3V112.5C0 88.59 25.61 72.83 48.66 79.13L48.66 79.13zM127.1 416C127.1 380.7 99.35 352 63.1 352V416H127.1zM63.1 223.1C99.35 223.1 127.1 195.3 127.1 159.1H63.1V223.1zM512 352V287.1C476.7 287.1 448 316.7 448 352H512zM512 95.1H448C448 131.3 476.7 159.1 512 159.1V95.1zM287.1 143.1C234.1 143.1 191.1 194.1 191.1 255.1C191.1 317.9 234.1 368 287.1 368C341 368 384 317.9 384 255.1C384 194.1 341 143.1 287.1 143.1z" fill="white"></path></svg>
            </div>
            <div class="grid px-5">
              <p class="text-gray-400 text-sm ">USD Balance</p>
              <p class="text-black font-bold text-lg">$52k</p>
            </div>
          </div>
          <hr class="bg-gray-50 w-full ">
          <div class="py-1 flex">
            <p class="text-green-300 font-bold text-md mx-1">+55%</p>
            <p class="text-gray-600 text-md  font-bold mx-1"> than last week</p>
          </div>          
        </div>
      
      </div>
      <div class="py-6">
        <div class="bg-white w-64 h-32 border rounded-lg">
          <div class="flex flex-cols-2 p-4">
            <div class="w-14 h-14 -mt-9 borderd rounded-lg bg-pink-600 p-3">
              <svg style="color: white" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 576 512"><!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M251.1 207.1C251.1 196.1 260.1 187.1 271.1 187.1H287.1C299 187.1 308 196.1 308 207.1V275.1H312C323 275.1 332 284.1 332 295.1C332 307 323 315.1 312 315.1H263.1C252.1 315.1 243.1 307 243.1 295.1C243.1 284.1 252.1 275.1 263.1 275.1H267.1V227.6C258.9 225.7 251.1 217.7 251.1 207.1zM48.66 79.13C128.4 100.9 208.2 80.59 288 60.25C375 38.08 462 15.9 549 48.38C565.9 54.69 576 71.62 576 89.66V399.5C576 423.4 550.4 439.2 527.3 432.9C447.6 411.1 367.8 431.4 288 451.7C200.1 473.9 113.1 496.1 26.97 463.6C10.06 457.3 0 440.4 0 422.3V112.5C0 88.59 25.61 72.83 48.66 79.13L48.66 79.13zM127.1 416C127.1 380.7 99.35 352 63.1 352V416H127.1zM63.1 223.1C99.35 223.1 127.1 195.3 127.1 159.1H63.1V223.1zM512 352V287.1C476.7 287.1 448 316.7 448 352H512zM512 95.1H448C448 131.3 476.7 159.1 512 159.1V95.1zM287.1 143.1C234.1 143.1 191.1 194.1 191.1 255.1C191.1 317.9 234.1 368 287.1 368C341 368 384 317.9 384 255.1C384 194.1 341 143.1 287.1 143.1z" fill="white"></path></svg>
          </div>
          <div class="grid px-5">
            <p class="text-gray-400 text-sm">ZWL Balance</p>
          <p class="text-black font-bold text-lg">2,300</p>
          </div>
          </div>
          <hr class="bg-gray-50 w-full ">
          <div class="py-1 flex">
            <p class="text-green-300 font-bold text-md mx-1">+3%</p>
            <p class="text-gray-600 text-md  font-bold mx-1"> than last month</p>
          </div>          
        </div>
      
      </div>
      <div class="py-6">
        <div class="bg-white w-64 h-32 border rounded-lg">
          <div class="flex flex-cols-2 p-4">
            <div class="w-14 h-14 -mt-9 borderd rounded-lg bg-green-600 p-3">
              <svg style="color: white" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 576 512"><!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M251.1 207.1C251.1 196.1 260.1 187.1 271.1 187.1H287.1C299 187.1 308 196.1 308 207.1V275.1H312C323 275.1 332 284.1 332 295.1C332 307 323 315.1 312 315.1H263.1C252.1 315.1 243.1 307 243.1 295.1C243.1 284.1 252.1 275.1 263.1 275.1H267.1V227.6C258.9 225.7 251.1 217.7 251.1 207.1zM48.66 79.13C128.4 100.9 208.2 80.59 288 60.25C375 38.08 462 15.9 549 48.38C565.9 54.69 576 71.62 576 89.66V399.5C576 423.4 550.4 439.2 527.3 432.9C447.6 411.1 367.8 431.4 288 451.7C200.1 473.9 113.1 496.1 26.97 463.6C10.06 457.3 0 440.4 0 422.3V112.5C0 88.59 25.61 72.83 48.66 79.13L48.66 79.13zM127.1 416C127.1 380.7 99.35 352 63.1 352V416H127.1zM63.1 223.1C99.35 223.1 127.1 195.3 127.1 159.1H63.1V223.1zM512 352V287.1C476.7 287.1 448 316.7 448 352H512zM512 95.1H448C448 131.3 476.7 159.1 512 159.1V95.1zM287.1 143.1C234.1 143.1 191.1 194.1 191.1 255.1C191.1 317.9 234.1 368 287.1 368C341 368 384 317.9 384 255.1C384 194.1 341 143.1 287.1 143.1z" fill="white"></path></svg>
          </div>
          <div class="grid px-5">
            <p class="text-gray-400 text-sm">Rands Balance</p>
          <p class="text-black font-bold text-lg">3,462</p>
          </div>
          </div>
          <hr class="bg-gray-50 w-full ">
          <div class="py-1 flex">
            <p class="text-red-500 font-bold text-md mx-1">-3%</p>
            <p class="text-gray-600 text-md  font-bold mx-1"> than yesterady</p>
          </div>          
        </div>
      
      </div>
      <div class="py-6">
        <div class="bg-white w-64 h-32 border rounded-lg">
          <div class="flex flex-cols-2 p-4">
            <div class="w-14 h-14 -mt-9 borderd rounded-lg bg-gray-400 p-3">
              <svg style="color: white" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 576 512"><!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M251.1 207.1C251.1 196.1 260.1 187.1 271.1 187.1H287.1C299 187.1 308 196.1 308 207.1V275.1H312C323 275.1 332 284.1 332 295.1C332 307 323 315.1 312 315.1H263.1C252.1 315.1 243.1 307 243.1 295.1C243.1 284.1 252.1 275.1 263.1 275.1H267.1V227.6C258.9 225.7 251.1 217.7 251.1 207.1zM48.66 79.13C128.4 100.9 208.2 80.59 288 60.25C375 38.08 462 15.9 549 48.38C565.9 54.69 576 71.62 576 89.66V399.5C576 423.4 550.4 439.2 527.3 432.9C447.6 411.1 367.8 431.4 288 451.7C200.1 473.9 113.1 496.1 26.97 463.6C10.06 457.3 0 440.4 0 422.3V112.5C0 88.59 25.61 72.83 48.66 79.13L48.66 79.13zM127.1 416C127.1 380.7 99.35 352 63.1 352V416H127.1zM63.1 223.1C99.35 223.1 127.1 195.3 127.1 159.1H63.1V223.1zM512 352V287.1C476.7 287.1 448 316.7 448 352H512zM512 95.1H448C448 131.3 476.7 159.1 512 159.1V95.1zM287.1 143.1C234.1 143.1 191.1 194.1 191.1 255.1C191.1 317.9 234.1 368 287.1 368C341 368 384 317.9 384 255.1C384 194.1 341 143.1 287.1 143.1z" fill="white"></path></svg>
          </div>
          <div class="grid px-5">
            <p class="text-gray-400 text-sm">Other currencies</p>
          <p class="text-black font-bold text-lg">2,898</p>
          </div>
          </div>
          <hr class="bg-gray-50 w-full ">
          <div class="py-1 flex">
            <p class="text-green-300 font-bold text-md mx-1">+5%</p>
            <p class="text-gray-600 text-md  font-bold mx-1"> than yesterday</p>
          </div>          
        </div>
      
      </div>
    </div>
    <div class="grid grid-cols-2 w-full gap-10 px-5 ">
      <div class="shadow-lg w-full h-screen rounded-md p-5">
        <h1 class="text-xl font-semibold text-black">Recent Cash Transactions</h1>
      </div>
      <div class="shadow-lg w-full h-screen rounded-md p-5">
        <h1 class="text-xl font-semibold text-black mb-5">Recent Mobile Transactions</h1>
        <hr class="w-full border-gray-300 my-2 opacity-10">
        <div class="flex justify-between">
          <div class="grid-grid-cols-1">
            <h1 class="text-lg font-semibold">Ruramai Botso</h1>
            <h1 class="text-sm font-semibold opacity-50">Tithe</h1>
          </div>
          <h1 class="text-2xl mr-2 font-bold text-gray-900">$10</h1>

        </div>
        <hr class="w-full border-gray-600 my-2 opacity-10">
      </div>
    </div>
    
  </NuxtLayout>
</template>

<script>
import axios from 'axios'
import { encryptData, decryptData } from '@/encryption';
export default {
    data(){
      return{
        loading: true,
        person: "",
        isOpen: false,
      }
    },
    methods: {
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

</style>