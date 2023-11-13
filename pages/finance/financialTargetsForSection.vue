<template>
    <NuxtLayout name="financial-targets-layout">
      <div class="mt-1 p-4 gap-3">
        <div class="bg-white rounded shadow-sm">
          <div class="flex justify-between">
                <div class="flex flex-row justify-between">
                <div class="mb-4">
                  <label  for="descriptionFilter" class="block font-medium mb-1">Filter by description:</label>
                  <select v-if="!loading" v-model="descriptionFilter" id="descriptionFilter" class="border border-gray-300 rounded-md px-4 py-2 w-full">
                    <option value="">All</option>
                    <option v-for="desc in descriptionsData" :value="desc">{{ desc }}</option>
                  </select>
                </div>
                <div class="mb-4 ml-5">
                  <label for="targetFilter" class="block font-medium mb-1">Filter by Target:</label>
                  <input
                    v-model="targetFilter"
                    id="targetFilter"
                    type="text"
                    class="border border-gray-300 rounded-md px-4 py-2 w-full"
                    placeholder="Search target..."
                  />
                </div>
              </div>
                  <div>
                    <!-- Add Button -->
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Allocate</button>
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="resetFinancialTargets">Reset</button>
                  </div>
              </div>
         
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
                                  Target
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Level
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Amount
                                </th>
                                <th scope="col" class="px-3 py-3"></th>
                                
                            </tr>
                        </thead>
                        <tbody v-if="!loading">
                            <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                              <td class="px-6 py-4">{{ item.id }}</td>
                              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                {{ item.financeDescription.description }}
                            </th>
                              <td class="px-6 py-4">{{ item.target}}</td>
                              <td class="px-6 py-4">{{ item.level}}</td>
                              <td class="px-6 py-4">{{ item.amount}}</td>
                              <td class="px-3 py-4">
                                <a href="#"  @click="fetchFinancialTargetByID(item.id)" class="font-medium text-green-500 dark:text-blue-500 hover:underline">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"   class="bi bi-pencil-square" viewBox="0 0 16 16"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> </svg>
                                </a >
                              </td>
                              
                            </tr>
                        </tbody>
                    </table>
                    <div v-if="!loading" class="text-md text-white flex flex-row justify-end bg-blue-900 px-8 w-full">
                          <button class="p-3" @click="getAllFinancialTargets(pageNumber)"  v-for="pageNumber in result.totalPages.value" :key="pageNumber">
                            {{ pageNumber }} 
                          </button>
                    </div>
                </div>
                 <!--  Add Modal -->
                 <div v-if="addModal" class="z-10 pt-36 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                          <!-- Modal Content -->
                          <div class="flex justify-between">
                            <h2  class="text-2xl font-bold mb-4">Add new Financial Target</h2>
                            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeAddModal">X</button>
                          </div>
                          <p v-if="loading">Processing the payment request</p>
                          <form  v-else @submit.prevent="allocateSectFinancialTargets()" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                             <!-- Description -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Description:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" type="text" v-model="targets.description" >
                                <p v-if="this.errors.level" class="text-sm text-red-600 text-left mb-2">*{{this.errors.level}}</p>
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
                  <!--  Edit Modal -->
                  <div v-if="editModal" class="z-10 pt-36 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                          <!-- Modal Content -->
                          <div class="flex justify-between">
                            <h2  class="text-2xl font-bold mb-4">Update Financial Target</h2>
                            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeEditModal">X</button>
                          </div>
                          <p v-if="loading">Processing the payment request</p>
                          <form  v-else @submit.prevent="updateFinancialTarget(fTargets.id)" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                             <!-- Amount -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="level">Amount:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="level" type="text" v-model="fTargets.amount" >
                                <p v-if="this.errors.amount" class="text-sm text-red-600 text-left mb-2">*{{this.errors.amount}}</p>
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
        descriptionFilter: '',
        targetFilter: '',
        addModal: false,
        fTargets: [],
        editModal: false,
        deleteModal: false,
        editModalHeading: 'Edit record',
        addModalHeading: 'Add new finance description',
        loading:true,
        isOpen: false,
        name: '',
        person:'',
        item: [],
        errors: {},
        targets: {
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
      pages:[],
      result:[],
      };
    },
    computed: {
      filteredItems() {
        let filteredItems = this.items;
  
        if (this.descriptionFilter) {
          filteredItems = filteredItems.filter((item) => item.financeDescription.description === this.descriptionFilter);
        }
  
        if (this.targetFilter) {
          filteredItems = filteredItems.filter(
            (item) => item.target.toLowerCase().includes(this.targetFilter.toLowerCase())
          );
        }
  
        return filteredItems;
      },
      descriptionsData() {
        return [...new Set(this.items.map((item) => item.financeDescription.description ))];
      },
    },
    methods:{
      async getAllFinancialTargets(pageNumber){
      this.loading = true;
      Number.parseInt(pageNumber)
      pageNumber -=1;
      const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
      const URL = `https://chitma.hushsoft.co.zw/api/financialTargets/getAllSectionsFinancialTargets/${local}/${pageNumber}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.result = res.data
        this.items = res.data.content
        this.pages = res.data.pageable
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async resetFinancialTargets(){
        try{
          await axios.delete('https://chitma.hushsoft.co.zw/api/financialTargets/resetSectionFinancialTargets', {
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Sections targets reset was successfully.")
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
      },
      async updateSectFinancialTargets(id){
        try{
            const pp = localStorage.getItem('pp');
            const local = decryptData(pp);
          await axios.put(`https://chitma.hushsoft.co.zw/api/financialTargets/updateSectionFinancialTarget/${local}/${this.fTargets.amount}/${id}`,{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Organisational targets updated successfully.")
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
      },
      async allocateSectFinancialTargets(){
        try{
            const pp = localStorage.getItem('pp');
            const local = decryptData(pp);
          await axios.post('https://chitma.hushsoft.co.zw/api/financialTargets/distributeFinancialTargetForSections',{
            'financialDescription': this.targets.description,  
            'local': local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Organisational targets allocated successfully.")
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
      },
      async updateFinancialTarget(){
              this.errors = {};
              if(!this.targets.target){
                  this.errors.target = "Financial Target is required";
              }
              if(!this.targets.financialDescription){
                  this.errors.financialDescription = "Financial Description is required";
              }  
              if(!this.targets.level){
                  this.errors.level = "Financial Level is required";
              }
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
            const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
          await axios.post('https://chitma.hushsoft.co.zw/api/financeDescription/addNewFinanceDescriptions',{
            'description': this.targets.description,  
            'status': this.targets.status,
            'local': local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Finance Description added successfully.")
            this.closeAddModal()
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
      async fetchFinancialTargetByID(id){
          this.loading = true;
    const URL = `https://chitma.hushsoft.co.zw/api/financialTargets/getFinancialTargetBy/${id}`;
    // const token = localStorage.token;
    await axios.get(URL,{
      headers: {'Content-Type': 'application/json',
          // Authorization : 'Bearer ' + token,
          'Access-Control-Allow-Origin': '*'}
    }).then((res) =>
     {
      this.fTargets = res.data
      this.editModal = true;
    }) .catch(error => {
      console.log(error.code)
      this.error=error.code;
      this.errored = true

    }).finally(() => this.loading = false);
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
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
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
      this.getAllFinancialTargets(1)
      this.getAdminInfo()
    }
  };
  </script>
  
  <style>
  
  </style>
  
  