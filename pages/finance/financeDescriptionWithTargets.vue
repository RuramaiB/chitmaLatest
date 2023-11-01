<template>
    <NuxtLayout name="finance-description-layout">
      <div class="mt-1 p-4 gap-3">
    <div class="bg-white rounded shadow-sm">
      <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Add</button>
    </div>
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-white uppercase bg-blue-900 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                          <th scope="col" class="px-6 py-3">
                            ID
                        </th>
                            <th scope="col" class="px-6 py-3">
                              Description
                            </th>
                            <th scope="col" class="px-6 py-3">
                              Kick Off
                            </th>
                            <th scope="col" class="px-6 py-3">
                              Target
                            </th>
                            <th scope="col" class="px-3 py-3"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                          <td class="px-6 py-4">{{ item.id }}</td>
                          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            {{ item.description }}
                        </th>
                          <td class="px-6 py-4">{{ item.kickOff}}</td>
                          <td class="px-6 py-4">{{ item.grandTarget}}</td>
                          <td class="pl-3 pr-4 py-4">
                            <a href="#" class="font-medium text-yellow-500 dark:text-blue-500 hover:underline" >
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="openDeleteModal(item.id)" class="bi bi-trash" viewBox="0 0 16 16"> <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/> <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/> </svg>
                            </a >
                          </td>
                        </tr>
                    </tbody>
                </table>
            </div>
              <!--  Add Modal -->
              <div v-if="addModal" class="z-10 pt-36 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center md:pt-1">
                    <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                      <!-- Modal Content -->
                      <div class="flex justify-between">
                        <h2  class="text-2xl font-bold mb-4">{{ addModalHeading }}</h2>
                        <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeAddModal">X</button>
                      </div>
                      <p v-if="loading">Processing the payment request</p>
                      <form  v-else @submit.prevent="addFinanceDescription()" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                         <!-- Description -->
                         <div class="mb-4">
                          <label class="block text-gray-700 text-sm font-bold mb-2" for="description">Description:</label>
                          <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                            id="description" type="text" v-model="loc.description" >
                            <p v-if="this.errors.description" class="text-sm text-red-600 text-left mb-2">*{{this.errors.description}}</p>
                        </div>  
                        <!-- Status-->
                        <div class="mb-4">
                          <label class="block text-gray-700 text-sm font-bold mb-2" for="status">Status</label>
                          <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                            id="status" v-model="loc.status" >
                            <option value="" disabled>Select status</option>
                            <option value="active">active</option>
                            <option value="inactive">inactive</option>
                          </select>
                          <p v-if="this.errors.status" class="text-sm text-red-600 text-left mb-2">*{{this.errors.status}}</p>
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
        addModalHeading: 'Add new finance description',
        loading:true,
        isOpen: false,
        name: '',
        item: [{
          id: '',
          description: '',
          status: [],
          local: '',
        }],
        errors: {},
        loc: {
          description: '',
          status: [],
          local: '',
        },
        locs:[],
        items: [{
          id: '',
          description: '',
          status: [],
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
      async getFinanceDescriptionByID(id){
            this.loading = true;
      const URL = `https://chitma.hushsoft.co.zw/api/financeDescription/getFinanceDescriptionBy/${id}`;
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
      async getAllFinanceDescriptions(){
      this.loading = true;
      const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
      const URL = `https://chitma.hushsoft.co.zw/api/financeDescription/getFinancialDescriptionWithoutTargetsByLocal/${local}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.items = res.data;
        console.log("Fetching Data Completed...", this.items);
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async addFinanceDescription(){
              this.errors = {};
              if(!this.loc.description){
                  this.errors.description = "Location is required";
              }
              if(!this.loc.status){
                  this.errors.status = "Circuit method is required";
              }  
             
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
            const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
          await axios.post('https://chitma.hushsoft.co.zw/api/financeDescription/addNewFinanceDescriptions',{
            'description': this.loc.description,  
            'status': this.loc.status,
            'local': local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Finance Description added successfully.")
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
        if(_option == 'yes'){
          try{
          await axios.delete('https://chitma.hushsoft.co.zw/api/financeDescription/deleteFinanceDescriptionByID/' + this.name,{
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
      this.getAllFinanceDescriptions()
    }
  };
  </script>
  
  <style>
  
  </style>
  
  