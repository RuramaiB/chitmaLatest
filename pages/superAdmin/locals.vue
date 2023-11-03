<template>
    <NuxtLayout name="super-admin-layout">
      <div class="flex px-10 py-1 bg-green-900">    
        <div class="flex flex-rows w-full justify-between">
          <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Locals</h1>
          </div>
          <!-- Right content -->
          <div class="relative my-1 z-10">
          <button
            v-if="!loading"
            @click="isOpen = !isOpen"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            {{ this.person}}
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
      <div class="mt-1 p-4 gap-3">
        <div class="bg-white rounded shadow-sm">
          <button class="text-black border-2 border-green-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Add</button>
        </div>
                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-white uppercase bg-green-900 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                              <th scope="col" class="px-6 py-3">
                                ID
                            </th>
                                <th scope="col" class="px-6 py-3">
                                  Local
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Location
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Prefix
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    
                                </th>
                                <th scope="col" class="px-6 py-3"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                              <td class="px-6 py-4">{{ item.id }}</td>
                              <td class="px-6 py-4">{{ item.name }}</td>
                              <td class="px-6 py-4">{{ item.location }}</td>
                            <td class="px-6 py-4">{{ item.prefix }}</td>
                              <td class="px-3 py-4">
                                <a href="#" class="font-medium text-green-500 dark:text-blue-500 hover:underline">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="getLocalByName(item.name)"  class="bi bi-pencil-square" viewBox="0 0 16 16"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> </svg>
                                </a >
                              </td>
                              <td class="pl-3 pr-4 py-4">
                                <a href="#" class="font-medium text-yellow-500 dark:text-blue-500 hover:underline" >
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="openDeleteModal(item.name)" class="bi bi-trash" viewBox="0 0 16 16"> <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/> <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/> </svg>
                                </a >
                              </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                    <!-- Floating Download Button -->
                    <try/>
                    <!-- End of Floating button -->
                  <!--  Add Modal -->
                  <div v-if="addModal" class="z-10 pt-36 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                          <!-- Modal Content -->
                          <div class="flex justify-between">
                            <h2  class="text-2xl font-bold mb-4">{{ addModalHeading }}</h2>
                            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeAddModal">X</button>
                          </div>
                          <p v-if="loading">Processing the payment request</p>
                          <form  v-else @submit.prevent="addLocal()" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">     
                            <!-- Local Name -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="local">Local Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="local" type="text" v-model="loc.local" >
                                <p v-if="this.errors.local" class="text-sm text-red-600 text-left mb-2">*{{this.errors.local}}</p>
                            </div>  
                            <!-- Location -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="location">Location:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="location" type="text" v-model="loc.location" >
                                <p v-if="this.errors.location" class="text-sm text-red-600 text-left mb-2">*{{this.errors.location}}</p>
                            </div>  
                            <!-- Submit Button -->
                            <div class="ml-2">
                              <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                              >Submit</button>
                            </div>
                          </form>        
                        </div>
                      </div>
                      <!-- End of Add modal -->
                <div v-if="editModal" class="z-10 ml-40 pt-24 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                  <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                    <!-- Modal Content -->
                    <div class="flex justify-between">
                      <h2 class="text-2xl font-bold mb-4">{{ editModalHeading }}</h2>
                      <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeEditModal">X</button>
                    </div>
                    <form @submit.prevent="updateLocal(locs.name)" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                      <!-- Circuit -->
                      <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="circuit">Circuit:</label>
                        <select class="shadow appearance-none text-black border rounded w-full py-2 px-3  leading-tight focus:outline-none focus:shadow-outline" 
                          id="circuit"  v-model="locs.circuit.name">
                          <!-- <option value="" disabled>Select payment method</option> -->
                          <option value="Seke North">Seke North</option>
                        </select>
                      </div>      
                      <!-- Local -->
                      <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="local">Local</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                          id="local" type="text" v-model="locs.name" required>
                      </div>  
                      <!-- Location -->
                      <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="location">Location:</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                          id="location" type="text" v-model="locs.location" required>
                      </div>  
                      <!-- Submit Button -->
                      <div class="ml-2">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                          type="submit">Submit</button>
                      </div>
                    </form>       
                  </div>
                </div>
                <div v-if="deleteModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-10">
                  <div class="bg-white p-6 rounded-lg">
                    <p class="mb-4">Are you sure you want to delete?</p>
                    <div class="flex justify-end">
                      <button class="mr-2 px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded" @click="handleOption('yes')">Yes</button>
                      <button
                        class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 rounded" @click="handleOption('no')">No</button>
                    </div>
                  </div>
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
        sectionFilter: '',
        surnameFilter: '',
        addModal: false,
        editModal: false,
        deleteModal: false,
        editModalHeading: 'Edit record',
        addModalHeading: 'Add new local locs record',
        loading:true,
        isOpen: false,
        person: '',
        name: '',
        item: [{
          id: '',
          location: '',
          circuit: [],
          local: '',
        }],
        errors: {},
        loc: {
          location: '',
          circuit: [],
          local: '',
        },
        locs:[],
        items: [{
          id: '',
          location: '',
          circuit: [],
          local: '',
      }],
      locs:[]
      };
    },
    computed: {
      filteredItems() {
        let filteredItems = this.items;
  
        if (this.sectionFilter) {
          filteredItems = filteredItems.filter((item) => item.Section === this.sectionFilter);
        }
  
        if (this.surnameFilter) {
          filteredItems = filteredItems.filter(
            (item) => item.user.lastname.toLowerCase().includes(this.surnameFilter.toLowerCase())
          );
        }
  
        return filteredItems;
      },
      sections() {
        return [...new Set(this.items.map((item) => item.Section))];
      },
    },
    methods:{
      async getLocalByName(name){
            this.loading = true;
            const locName = name.replace('%20', '@');
      const URL = `https://chitma.hushsoft.co.zw/api/local/getLocalPreachingPointByName/?preachingPoint=${locName}`;
      // const token = localStorage.token;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.locs = res.data
        console.log(this.locs);
        console.log("Information tatora baba.");
        this.editModal = true;
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async getLocals(){
      this.loading = true;
     
      const URL = "https://chitma.hushsoft.co.zw/api/local/getAllLocalPreachingPoints";
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.items = res.data;
        console.log("Fetching Data Completed...");
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async addLocal(){
              this.errors = {};
              if(!this.loc.location){
                  this.errors.location = "Location is required";
              }             
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
          await axios.post('https://chitma.hushsoft.co.zw/api/local',{
            'localLocation': this.loc.location,  
            'localName': this.loc.local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Local added successfully.")
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
      async updateLocal(name){
              this.errors = {};
              const locNames = name.replace('%20', '@');
              if(!this.locs.location){
                  this.errors.location = "Location is required";
              }
              if(!this.locs.name){
                  this.errors.name = "Local is required";
              }      
             
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
          await axios.put('https://chitma.hushsoft.co.zw/api/local/updateLocalByName/' + locNames,{
            location: this.locs.location,  
            name: this.locs.name,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Local updated successfully.")
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
     async handleOption (_option) {
        if(_option = 'yes'){
          try{
          await axios.delete('https://chitma.hushsoft.co.zw/api/local/deleteLocalPreachingPointByName/' + this.name,{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Local Finance Record deleted successfully.")
            this.closeDeleteModal()
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
      else if(_option = 'no'){
        this.name = ''
        this.closeDeleteModal();
      } 
      },
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
        openAddModal() {
          this.addModal = true;
        },
        closeAddModal() {
          this.addModal = false;
        },
        openEditModal() {
          this.editModal = true;
        },
        closeEditModal() {
          this.editModal = false;
        },
        openDeleteModal(name) {
          this.deleteModal = true;
          this.name = name;
        },
        closeDeleteModal() {
          this.deleteModal = false;
        },
       
    },
    mounted(){
      this.getLocals()
      this.getAdminInfo()
      
    }
  };
  </script>
  
  <style>
  
  </style>
  
  
